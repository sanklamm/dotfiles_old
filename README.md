# dotfiles
*bootstraps my personal environment and utilities in an OS agnostic manner. (currently focused on Linux)*

currently there is built in support for Linux (Debian) and Mac OS X (macOS currently WIP).

this project also bootstraps necessary packages depending on OS, distro
and machine-type (take a look at `bootstrap.conf`). you might want to add
or remove some packages. Linux-specific performance analysis and debugging
tools may require a current 3.x-line Linux kernel.
## Bootstrapping and configuration
1. `su && apt-get install sudo git`
2. clone in `$HOME`.
3. `./bootstrap [--desktop] [--debug]`.
4. **optional**: configure `~/.mutt/accounts/*`, `~/.goobookrc`.

## TODO
* write coherent setup routine in `bootstrap`
* macOS setup

## OS/Distro Notes
### Linux (Debian)
* Window Manager: i3-gaps customized

## License
Some configurations are cherry-picked from across the internet. Original
work is licensed as follows:

http://opensource.org/licenses/MIT

The MIT License (MIT)

Copyright (c) 2014 Aaron Zauner <azet@azet.org>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
