$ErrorActionPreference = "Stop"

$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repo

$env:PATH = "C:\Ruby33-x64\bin;$env:PATH"
$env:BUNDLE_USER_HOME = Join-Path $repo ".bundle-home"

Write-Host "Building site..."
bundle exec ruby -e "require 'jekyll/filters/url_filters'; require 'jekyll/filters/grouping_filters'; require 'jekyll/filters/date_filters'; require 'jekyll'; require 'jekyll/commands/build'; Jekyll::PluginManager.require_from_bundler; Jekyll::Commands::Build.process({})"

Write-Host ""
Write-Host "Serving http://127.0.0.1:4000"
Write-Host "Press Ctrl+C to stop."
bundle exec ruby scripts\static_preview.rb
