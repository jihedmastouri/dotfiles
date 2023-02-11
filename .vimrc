if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

source ~/.config/nvim/sharedVim/opts.vim
source ~/.config/nvim/sharedVim/keys.vim
source ~/.config/nvim/sharedVim/not-idea.vim
