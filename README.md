## Reverse Command Search (revcom)

__Description:__ 
Based on clipboard.lua, the idea is to keep a list of common commands in the clipboard. Make sure to edit the source_commands variable and edit the file

__Setup:__
Add it to you init.lua with 
```
require 'revcom.lua'
```
__Commands File:__
Create a file like
```
~/.hammerspoon/revcom.list
```
__Format:__
```
command1
]]
command2
]]
```
__example:__ use ]] to separate each command, it accept multiline commands
```
# List all my files #
ls -lrt
echo "List of files in current dir"
]]
# Reboot the host #
sudo reboot
]]
```
Then you can grab the command by pressing CTRL+SHIFT+CMD+v, select the command, then press CTRL+v in the shell
