#!/usr/bin/env ruby
require "yaml"

brews = YAML.load_file("brews.yaml")
brews.each do |brew|
  `brew install #{brew}`
end
