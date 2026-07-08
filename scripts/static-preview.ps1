$ErrorActionPreference = "Stop"

$repo = Split-Path -Parent $PSScriptRoot
Set-Location $repo

$env:PATH = "C:\Ruby33-x64\bin;$env:PATH"
$env:BUNDLE_USER_HOME = Join-Path $repo ".bundle-home"

bundle exec ruby scripts\static_preview.rb
