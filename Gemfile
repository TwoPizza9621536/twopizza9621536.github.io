# SPDX-License-Identifier: CC0-1.0
source "https://rubygems.org"

gem "jekyll"
gem "jekyll-compose"
gem "dotenv"
gem "faraday-retry"
gem "sass-embedded"

group :jekyll_plugins do
  gem "jekyll-archives"
  gem "jekyll-email-protect"
  gem "jekyll-feed"
  gem "jekyll-github-metadata"
  gem "jekyll-loading-lazy"
  gem "jekyll-mentions"
  gem "jekyll-octicons"
  gem "jekyll-paginate-v2"
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
  gem "jekyll-target-blank"
  gem "jekyll_version_plugin"
  gem "jekyll-watch"
  gem "jemoji"
end

install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo"
  gem "tzinfo-data"
end

gem "wdm", :install_if => Gem.win_platform?

gem "http_parser.rb", :install_if => Gem.java_platform?

gem "webrick", :install_if => Gem.ruby_version >= Gem::Version.new("3")
