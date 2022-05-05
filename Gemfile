source "https://rubygems.org"
gem "jekyll"
# gem "minima", "~> 2.5"
# gem "github-pages", group: :jekyll_plugins

group :jekyll_plugins do
  gem "classifier-reborn"
  gem "jekyll_version_plugin"
  gem "jekyll-archives"
  gem "jekyll-compose"
  gem "jekyll-email-protect"
  gem "jekyll-feed"
  gem "jekyll-github-metadata"
  gem "jekyll-include-cache"
  gem "jekyll-last-modified-at"
  gem "jekyll-loading-lazy"
  gem "jekyll-mentions"
  gem "jekyll-octicons"
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
  gem "jekyll-target-blank"
  gem "jekyll-titles-from-headings"
  gem "jekyll-watch"
  gem "jemoji"
  gem "sass-embedded"
end

install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo"
  gem "tzinfo-data"
end

gem "wdm", :install_if => Gem.win_platform?

gem "http_parser.rb", :install_if => Gem.java_platform?

gem "webrick", :install_if => Gem.ruby_version >= Gem::Version.new("3")
