#!/usr/bin/env ruby

# TODO: If .vimrc or a symlink (or other vim dotfiles) already exists,
# prompt the user to over-write.

Dir['*.symlink'].each do |file|
  vim_symlink = "#{Dir.home}/.#{file[0, file.index('.')]}"

  unless File.symlink?(vim_symlink)
    File.symlink("#{__dir__}/#{file}", "#{Dir.home}/.#{file[0, file.index('.')]}")
  end
end
