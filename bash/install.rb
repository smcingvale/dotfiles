#!/usr/bin/env ruby

# TODO: If .bash_profile or a symlink already exists,
# prompt the user to over-write. 

Dir['*.symlink'].each do |file|
  bash_symlink = File.join("#{Dir.home}", ".#{file[0, file.index('.')]}")

  unless File.symlink?(bash_symlink)
    File.symlink(File.join("#{__dir__}", "#{file}"), bash_symlink)
  end
end
