imap jk <Esc>

exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki
nunmap s
vunmap s
map s" :surround_double_quotes
map s' :surround_single_quotes
map s` :surround_backticks
map sb :surround_brackets
map s( :surround_brackets
map s) :surround_brackets
map s[ :surround_square_brackets
map s[ :surround_square_brackets
map s{ :surround_curly_brackets
map s} :surround_curly_brackets

div.status-bar-item.plugin-obsidian-vimrc-support {
  /* Papercolor theme */
  --text-color-normal: #585858;
  --text-color-insert: #005f87;
  --text-color-visual: white;
  --text-color-replace: white;

  --background-color-normal: #eeeeee;
  --background-color-insert: #eeeeee;
  --background-color-visual: #d75f00;
  --background-color-replace: #d70087;
}

div.status-bar-item.plugin-obsidian-vimrc-support {
  /* 
    Move to bottom left corner and discard top/left/bottom space
    from container paddings.
   */
  order: -9999;
  margin: -4px auto -5px -5px;

  /* 
    We have the :after pseudo-element next, so padding-right
    is not needed
    */
  padding-right: 0px;
  padding-left: 1em;

  /* Use Monospace font */
  font-family: 'MesloLGM Nerd Font Mono'; /* !!! Needs to be a powerline font */
  font-weight: bold;
  font-size: 1.2em;

  /* Clear spaces made from radius borders */
  border-top-right-radius: 0px;
  border-bottom-right-radius: 0px;
}

div.status-bar-item.plugin-obsidian-vimrc-support:after {
  /* Powerline separator character */
  content: '';
  position: relative;
  font-size: 1.5rem;
  left: 0.9rem;

  /* Fine adjust the position */
  margin-top: 0.1rem;
}

/* Normal */
div.status-bar-item.vimrc-support-vim-mode[data-vim-mode="normal"]:after {
  color: var(--background-color-normal);
}
div.status-bar-item.vimrc-support-vim-mode[data-vim-mode="normal"] {
  color: var(--text-color-normal);
  background-color: var(--background-color-normal);
}

/* Insert */
div.status-bar-item.vimrc-support-vim-mode[data-vim-mode="insert"]:after {
  color: var(--background-color-insert);
}
div.status-bar-item.vimrc-support-vim-mode[data-vim-mode="insert"] {
  color: var(--text-color-insert);
  background-color: var(--background-color-insert);
}

/* Visual */
div.status-bar-item.vimrc-support-vim-mode[data-vim-mode="visual"]:after {
  color: var(--background-color-visual);
}
div.status-bar-item.vimrc-support-vim-mode[data-vim-mode="visual"] {
  color: var(--text-color-visual);
  background-color: var(--background-color-visual);
}

/* Replace */
div.status-bar-item.vimrc-support-vim-mode[data-vim-mode="replace"]:after {
  color: var(--background-color-replace);
}
div.status-bar-item.vimrc-support-vim-mode[data-vim-mode="replace"] {
  color: var(--text-color-replace);
  background-color: var(--background-color-replace);
}

