## Reverse Command Search (revcom)

__Description:__ 
Based on clipboard.lua, the idea is to keep a list of common commands in the clipboard. Make sure to edit the source_commands variable and edit the file

__Install:__
This utility uses `hammerspoon` refer to https://www.hammerspoon.org/

Install Hammer Spoon. See https://formulae.brew.sh/cask/hammerspoon

__Setup:__
Copy all `.lua` files in this git repo int `~/.hammerspoon` directory.
Review ~/.hammerspoon/init.lua: 
```
required 'clipboard.lue'
require 'revcom'
```
__Commands File:__
Create the commands file
```
~/.hammerspoon/revcom.list
```
__Add commands in this format:__
```
command1
--END--
command2
--END--
```
__example:__ use --END-- to separate each command, it accept multiline commands
```
# List all my files #
ls -lrt
echo "List of files in current dir"
--END--
# Reboot the host #
sudo reboot
--END--
```
Then you can grab the command by pressing CTRL+SHIFT+CMD+v, select the command, then press CTRL+v in the shell
