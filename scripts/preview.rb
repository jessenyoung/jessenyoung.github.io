# frozen_string_literal: true

require "bundler/setup"

# Work around require_all not loading these files reliably in this Windows setup.
require "jekyll/filters/url_filters"
require "jekyll/filters/grouping_filters"
require "jekyll/filters/date_filters"

require "jekyll"
require "jekyll/commands/build"
require "jekyll/commands/serve"

Jekyll::PluginManager.require_from_bundler

options = {
  "host" => "127.0.0.1",
  "port" => "4000",
  "serving" => true,
  "watch" => true
}

Jekyll::Commands::Serve.process(options)
