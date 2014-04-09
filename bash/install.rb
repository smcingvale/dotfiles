#!/usr/bin/env ruby

Dir['*.symlink'].each do |file|
  File.symlink("#{__dir__}/#{file}", "#{Dir.home}/.#{file[0, file.index('.')]}")
end
