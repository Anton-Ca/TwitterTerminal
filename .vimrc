"       HOW TO DO 90% OF WHAT PLUGINS DO (WITH JUST VIM)
"                          Max Cantor
"               NYC Vim Meetup -- August 3, 2016
	
set nocompatible
set relativenumber
" set relativenumber

" Easy access to vimrc with the :vs command
command! Vimrc :vs $MYVIMRC

" With both on, searches with no capitals are case insensitive, while searches with a capital characters are case sensitive.
"set smartcase/ignorecase

" Persistent undo, even if you close and reopen Vim. Super great when combined with the undotree plugin.
set undofile

"Enable syntax and plugins (e.g. for netrw)
syntax on
filetype plugin on

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton/.html<CR>3jwf>a

" Read empty java main and move cursor 
nnoremap ,java :-1read $HOME/.vim/.skeleton/.java<CR>2ji<tab>
nnoremap ,main :-1read $HOME/.vim/.skeleton/.java<CR>2ji<tab>

" Read empty python for-loop with list as range and i as increment
"nnoremap ,for :-1read $HOME/.vim/.skeleton/.pfor<CR>ji<tab>
nnoremap ,for :-1read $HOME/.vim/.skeleton/.pfor<CR>jddkdd<A-4>pjpi<tab>

" Read empty for-loop with list as range and i as increment
nnoremap ,jfor :delete<CR>:-1read $HOME/.vim/.skeleton/.jfor<CR>pi<tab><esc>A

""""""""""""""
"
" There's an issue here that the incertion happends on the wrong spot. Seems
" like a tricky fix and as of now, none of these work as intended. 
"
" Read empty print with cursor in pparentheses
"nnoremap ,p dd:-1read $HOME/.vim/.skeleton/.pprint<CR>I<esc>PA<esc>2hi
nnoremap ,p :-2read $HOME/.vim/.skeleton/.pprint<CR>

" Brackets 
"nnoremap ( :-1read $HOME/.vim/.skeleton/.pparentheses<CR>a
"nnoremap { :-1read $HOME/.vim/.skeleton/.pcparentheses<CR>a
"nnoremap [ :-1read $HOME/.vim/.skeleton/.pbparentheses<CR>a

" Quotationmarks 
"nnoremap " :-1read $HOME/.vim/.skeleton/.p""<CR>a
""""""""""""""
" Tab at start of line then esc 
nnoremap ,<tab> :<CR>I<tab><esc>
nnoremap <tab> :<CR>I<tab><esc>

" Map <Del> to perform <x>
nnoremap <Del> :<CR>x

" Map <Space> to / (search) and <Ctrl>+<Space> to ? (backwards search):
nnoremap <Space> /
nnoremap <C-Space> ? 


" Construct a divider and place mouse in middle
nnoremap ,- :-1read $HOME/.vim/.skeleton/.dash<CR>2whi

" Construct a System.out.println() for java
nnoremap ,sys :-1read $HOME/.vim/.skeleton/.sysout<CR>5wla



" -1 ser till att vi gör ändringen på raden där muspekaren befinner sig 
"  read läser och insertar filens innehåll
"  3j = hoppar ned 3 rader
"  >a = går in i insert mode vid nästa character
"  <CR> = Enter kanppen trycks
"  <tab> = tab knappen trycks
" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)


" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and 
"   :cp to navigate forward and back





"                          THANK YOU!

"                    Download this file at:
"   " Not yet possible email me at: bas15aca@student.lu.se if you're intrested

"	          Watch Max Cantors YT video at: 
"   https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim

