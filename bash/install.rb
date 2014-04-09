#!/usr/bin/env ruby

# TODO: If .bash_profile or a symlink already exists,
# prompt the user to over-write. 

Dir['*.symlink'].each do |file|
  bash_symlink = "#{Dir.home}/.#{file[0, file.index('.')]}"

  unless File.symlink?(bash_symlink)
    File.symlink("#{__dir__}/#{file}", "#{Dir.home}/.#{file[0, file.index('.')]}")
  end
end
