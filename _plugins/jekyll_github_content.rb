# Modified to patch and open url
# Original: https://github.com/francisco-perez-sorrosal/jekyll-github-content
# 3rd party libs
require 'open-uri'
require 'active_support'
require 'liquid'

module JekyllGithubContent

  class GithubUriParser

    GITHUB_URI_ROOT = 'https://github.com/'
    GITHUB_RAW_URI_ROOT = 'https://raw.githubusercontent.com'

    attr_reader :user, :repo, :file

    def initialize(path)
      relative_path = path.sub(/^https?\:\/\//, '').sub(/^github.com/, '')
      url_chunks = relative_path.split('/').delete_if { |e| e.empty? }

      @user, @repo, blob, @branch = url_chunks[0..3]
      @file = File.join(url_chunks[4..-1])
    end

    def get_raw_file_uri
      File.join(GITHUB_RAW_URI_ROOT, @user, @repo, @branch, @file)
    end

    def get_user_uri
      File.join(GITHUB_URI_ROOT, @user)
    end

    def get_repo_uri
      File.join(GITHUB_URI_ROOT, @user, @repo)
    end

  end

  class GithubContentRenderer < ::Liquid::Tag

    def initialize(tag_name, params, tokens)
      path, @initial_line, @end_line = params.split
      @github_file = GithubUriParser.new(path)
      @initial_line, @end_line = parse_line_boundaries(@initial_line, @end_line)
      super
    end

    def render(context)
      file_lines = cache.fetch(@github_file.get_raw_file_uri) do
        URI.open(@github_file.get_raw_file_uri).readlines
      end
      lines_to_print = file_lines[@initial_line..@end_line]
      lines_to_print.join
    end

    private # --------------------------------------------------------------------------------------------------------

    def cache
      @@cache ||= ActiveSupport::Cache::MemoryStore.new
    end

    def parse_line_boundaries(first_line, last_line)
      if first_line.nil? && last_line.nil?
        first_line = 0
        last_line = -1
      elsif last_line.nil?
        last_line = first_line
      end

      [first_line.to_i, last_line.to_i]
    end
  end

  class GithubMetaContentRenderer < GithubContentRenderer

    def render(context)
      <<DELIMITER.strip
<div class="github-file">
  <div class="meta-info">
    Github file by <a href="#{@github_file.get_user_uri}">#{@github_file.user}</a>
    <br>
    Repo: <a href="#{@github_file.get_repo_uri}">#{@github_file.repo}</a>
    <br>
    File: #{@github_file.file} <a href="#{@github_file.get_raw_file_uri}">Raw view</a>
  </div>
</div>
DELIMITER
    end
  end

end

# Register the tag names in Liquid to allow code & medadata insertion in Jekill markdown files
# e.g. {% github_file <my_file_url_in_github> [start_line] [end_line] %}
# e.g. {% github_fileref <my_file_url_in_github> %}
Liquid::Template.register_tag('github_file', JekyllGithubContent::GithubContentRenderer)
Liquid::Template.register_tag('github_fileref', JekyllGithubContent::GithubMetaContentRenderer)
