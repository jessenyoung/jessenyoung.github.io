# frozen_string_literal: true

require "webrick"

root = File.expand_path("../_site", __dir__)

server = WEBrick::HTTPServer.new(
  DocumentRoot: root,
  BindAddress: "127.0.0.1",
  Port: 4000,
  AccessLog: [],
  Logger: WEBrick::Log.new($stdout, WEBrick::Log::WARN)
)

trap("INT") { server.shutdown }
trap("TERM") { server.shutdown }

server.start
