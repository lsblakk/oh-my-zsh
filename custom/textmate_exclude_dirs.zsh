# PROTIP: use this `m .` command the first time, then save it as a 'tmproj'
# aka Textmate Project. Then use `open app_name.tmproj` and TextMate will 
# save what files / tabs you had open, etc.

m() 
{
  # Shell (bash/zsh) function which opens a directory as a project in TextMate
  # excluding directories that tend to slow down "Find in Project"
  #
  # Add this function to your dotfiles or ~/.bash_profile or ~/.zshrc for it 
  # to be available in your shell. You can also add it as a tm_exclude_dirs.zsh 
  # file in the custom folder of an ~/.oh-my-zsh install
  
  # shopt -s extglob  # Enable extended globbing for bash
  setopt extended_glob # Enable extended globbing for zsh
   
  # Invoke TextMate upon all the files and directories except those listed
  # Note: Don't open tmproj files or you'll get two windows (added to list)
  mate !(@(cache|log|tmp|*.tmproj)) "$@" 
  
  # shopt -u extglob  # Disable extended globbing for bash
  unsetopt extended_glob  # Disable extended globbing for zsh
}