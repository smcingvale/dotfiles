# dotfiles #

~ is where the dotfiles are.

## Boxen ##

These dotfiles are installed by [my-boxen](https://github.com/smcingvale/my-boxen).  Here's the relevant snippet from `dotfiles.pp`:

```
  # setup .vim and vim plugins
  $vim = "${home}/.vim"
  file { [
    "${vim}",
    "${vim}/bundle",
    "${vim}/autoload",
  ]:
    ensure => directory,
  }

  # puppet doesn't like grabbing files like this...
  exec { 'retrieve_pathogen.vim':
    command => "/usr/bin/curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim",
    creates => "${vim}/autoload/pathogen.vim",
  }

  file { "${vim}/autoload/pathogen.vim":
    mode    => 0755,
    require => Exec["retrieve_pathogen.vim"],
  }

  # vim plugins
  $vim_bundle = "${vim}/bundle"
  repository { "${vim_bundle}/vim-colors-solarized":
    ensure => 'origin/HEAD',
    source => 'altercation/vim-colors-solarized',
  }
  # and many more plugins...
```


## Thanks ##
[Zach Holman](http://zachholman.com/) showed me the way with his [elegant approach](https://github.com/holman/dotfiles) to structuring and symlinking dotfiles.  I've pulled in tricks from [Mathias Bynens](https://github.com/mathiasbynens/dotfiles), [Ryan Bates](https://github.com/ryanb/dotfiles), and [Ben Alman](https://github.com/cowboy/dotfiles).  Lastly, I've spent way too much time on [GitHub](http://github.com)'s [unofficial guide to dotfiles](http://dotfiles.github.io/).

## Development ##

### Version History ###

**1.0.0** (June 14, 2015)

* Manage installation with boxen.
* Move some configs to boxen.

**0.2.0** (April 10, 2014)

* Install vim-pathogen.
* Specify vim plugins in `vim/plugins.yaml`  and install them with pathogen.
* Use the solarized dark theme.

**0.1.0** (April 9, 2014)

* Initial public release.

### License ###

(The MIT license)

Copyright (c) 2014 Sam McIngvale

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
