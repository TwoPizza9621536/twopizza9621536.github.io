# frozen_string_literal: true

# Modified version of jekyll-target-blank (MIT) https://github.com/keithmifsud/jekyll-target-blank
# With some code from jekyll-link-attributes (MIT) https://github.com/twinsunllc/jekyll-link-attributes
# And jekyll-external-links (BSD-3-Clause) https://github.com/riboseinc/jekyll-external-links

require "jekyll"
require "nokogiri"
require "uri"

module Jekyll
  class ExternalLinkAttributes
    DEFAULT_EXTERNAL_LINK_TITLE = "Opens in a new window"
    DEFAULT_EXTERNAL_LINK_TARGET = "_blank"

    BODY_START_TAG         = "<body"
    OPENING_BODY_TAG_REGEX = %r!<body([^<>]*)>\s*!.freeze

    class << self

      def process(content)
        @site_config                      = content.site.config
        @site_url                         = content.site.config["url"]
        @external_link_attributes_config  = content.site.config["external_link_attributes"]
        @add_noopener                     = true
        @add_noreferrer                   = true
        @add_nofollow                     = true
        @add_external                     = true
        @target                           = get_target_from_config
        @title                            = get_title_from_config

        return unless is_plugin_enabled?

        initialise

        content.output = if content.output.include? BODY_START_TAG
                           process_html(content)
                         else
                           process_anchor_tags(content.output)
                         end
      end

      def document_processable?(doc)
        (doc.is_a?(Jekyll::Page) || doc.write?) &&
          doc.output_ext == ".html" || (doc.permalink&.end_with?("/"))
      end

      private

      def initialise
        parse_config
      end

      def is_plugin_enabled?
        config = @config
        case config
        when nil, NilClass
          true
        else
          enabled = config["enabled"]
          enabled.nil? || enabled
        end
      end

      def process_html(content)
        head, opener, tail  = content.output.partition(OPENING_BODY_TAG_REGEX)
        body_content, *rest = tail.partition("</body>")

        processed_markup = process_anchor_tags(body_content)

        content.output = String.new(head) << opener << processed_markup << rest.join
      end

      def process_anchor_tags(html)
        content = Nokogiri::HTML::DocumentFragment.parse(html)
        anchors = content.css("a[href]")
        anchors.each do |item|
          if is_processable_link?(item)
            add_target_attribute(item)
            add_title_attribute(item)
            add_rel_attributes(item)
          end
          next
        end
        content.to_html
      end

      def is_processable_link?(link)
        if is_not_mailto_link?(link["href"]) && is_external?(link["href"])
          true
        end
      end

      def is_not_mailto_link?(link)
        true unless link.to_s.start_with?("mailto:")
      end

      def is_external?(link)
        if link&.match?(URI.regexp(%w(http https)))
          URI.parse(link).host != URI.parse(@site_url).host
        end
      end

      def add_target_attribute(link)
        link["target"] = @target
      end

      def add_title_attribute(link)
        link["title"] = @title
      end

      def add_rel_attributes(link)
        rel = link["rel"] || ""

        if @add_noopener
          rel += " " unless rel.empty?
          rel += "noopener"
        end

        if @add_noreferrrer
          rel += " " unless rel.empty?
          rel += "noreferrer"
        end

        if @add_nofollow
          rel += " " unless rel.empty?
          rel += "nofollow"
        end

        if @add_external
          rel += " " unless rel.empty?
          rel += "external"
        end

        link["rel"] = rel unless rel.empty?
      end

      # Get values from configuration

      def parse_config
        @add_noopener = false if get_noopener_from_config?
        @add_noreferrrer = false if get_noreferrer_from_config?
        @add_nofollow = false if get_nofollow_from_config?
        @add_external = false if get_external_from_config?
      end

      def get_noopener_from_config?
        config = @external_link_attributes_config
        case config
        when nil, NilClass
          false
        else
          noopener = config["noopener"]
          if noopener == false
            return true
          else
            return false
          end
        end
      end

      def get_noreferrer_from_config?
        config = @external_link_attributes_config
        case config
        when nil, NilClass
          false
        else
          noreferrer = config["noreferrer"]
          if noreferrer == false
            return true
          else
            return false
          end
        end
      end

      def get_nofollow_from_config?
        config = @external_link_attributes_config
        case config
        when nil, NilClass
          false
        else
          nofollow = config["nofollow"]
          if nofollow == false
            return true
          else
            return false
          end
        end
      end

      def get_external_from_config?
        config = @external_link_attributes_config
        case config
        when nil, NilClass
          false
        else
          external = config["external"]
          if external == false
            return true
          else
            return false
          end
        end
      end

      def get_target_from_config
        config = @external_link_attributes_config
        case config
        when nil, NilClass
          DEFAULT_EXTERNAL_LINK_TARGET
        else
          target = config["target"]
          if target == DEFAULT_EXTERNAL_LINK_TARGET
            DEFAULT_EXTERNAL_LINK_TARGET
          else
            target
          end
        end
      end

      def get_title_from_config
        config = @external_link_attributes_config
        case config
        when nil, NilClass
          DEFAULT_EXTERNAL_LINK_TITLE
        else
          title = config["target"]
          title
        end
      end
    end
  end
end

Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  Jekyll::ExternalLinkAttributes.process(doc) if Jekyll::ExternalLinkAttributes.document_processable?(doc)
end
