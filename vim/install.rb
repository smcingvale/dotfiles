#!/usr/bin/env ruby
require "fileutils"
require "open-uri"
require "yaml"

# TODO: If .vimrc or a symlink (or other vim dotfiles) already exists,
# prompt the user to over-write.

Dir['*.symlink'].each do |file|
  vim_symlink = File.join("#{Dir.home}", ".#{file[0, file.index('.')]}")

  unless File.symlink?(vim_symlink)
    File.symlink(File.join("#{__dir__}", "#{file}"), vim_symlink)
  end
end

FileUtils::mkdir_p(File.join(Dir.home, ".vim", "bundle"))
FileUtils::mkdir_p(File.join(Dir.home, ".vim", "autoload"))

open(File.join(Dir.home, ".vim", "autoload", "pathogen.vim"), "wb") do |pathogen|
  pathogen << open("https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim").read
end

vim_plugins = YAML.load_file("plugins.yaml")
vim_plugins.each do |plugin, clone_url|
  `git clone git://#{clone_url} #{File.join(Dir.home, ".vim", "bundle", plugin)}`
end
