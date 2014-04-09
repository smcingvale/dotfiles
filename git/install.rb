#!/usr/bin/env ruby

# TODO: If .gitconfig or a symlink (or other git dotfiles) already exists,
# prompt the user to over-write.

Dir['*.symlink'].each do |file|
  git_symlink = "#{Dir.home}/.#{file[0, file.index('.')]}"

  unless File.symlink?(git_symlink)
    File.symlink("#{__dir__}/#{file}", "#{Dir.home}/.#{file[0, file.index('.')]}")
  end
end
