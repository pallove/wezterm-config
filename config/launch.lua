local platform = require('utils.platform')
local wezterm = require("wezterm")

local default_prog
local launch_menu

if platform.is_win then
   launch_menu = {
      { label = 'Git Bash', args = { "C:/Program Files/Git/bin/bash.exe", "--login", "-i" }, },
      { label = 'PowerShell Core', args = { 'pwsh', '-NoLogo' } },
      { label = 'PowerShell Desktop', args = { 'powershell' } },
      { label = 'Command Prompt', args = { 'cmd' } },
      { label = 'Nushell', args = { 'nu' } },
      { label = 'Msys2', args = { 'ucrt64.cmd' } },
   }
elseif platform.is_mac then
   launch_menu = {
      { label = 'Zsh', args = { 'zsh', '-l' } },
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { '/opt/homebrew/bin/fish', '-l' } },
      { label = 'Nushell', args = { '/opt/homebrew/bin/nu', '-l' } },
   }
elseif platform.is_linux then
   launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { 'fish', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
   }
end

if launch_menu then
   default_prog = default_prog or launch_menu[1].args
end

return {
   default_prog = default_prog,
   launch_menu = launch_menu,
}
