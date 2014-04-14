#!/usr/bin/env ruby
require "yaml"

rubies = YAML.load_file("rubies.yaml")
rubies.each do |ruby|
  system("rbenv install #{ruby}")
end
