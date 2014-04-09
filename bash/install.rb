#!/usr/bin/env ruby

Dir['*.symlink'].each do |file|
  bash_symlink = "#{Dir.home}/.#{file[0, file.index('.')]}"

  unless File.symlink?(bash_symlink)
    File.symlink("#{__dir__}/#{file}", "#{Dir.home}/.#{file[0, file.index('.')]}")
  end
end
