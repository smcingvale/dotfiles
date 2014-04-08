#!/usr/bin/env ruby

Dir['*.symlink'].each do |file|
  File.symlink("#{file}", "~/.#{file[0, file.index('.')]}")
end
