"Vundle Section Start
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/vim-airline/vim-airline.git'
Plugin 'https://github.com/vim-airline/vim-airline-themes.git'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'   " <leader>cc 注释当前行 <leader>cy 注释并复制 <leader>cs 优美的注释 <leader>cu 取消注释<leader>cA在行最后添加注释
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'https://github.com/nathanaelkane/vim-indent-guides.git'
Plugin 'https://github.com/Yggdroot/indentLine.git'
Plugin 'https://github.com/skywind3000/asyncrun.vim.git'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/luochen1990/rainbow.git'
Plugin 'https://github.com/tpope/vim-surround.git'          "cs,ds,ys,yss,ysiw更改和删除和增加surround
Plugin 'tpope/vim-repeat'    " 使用.重复命令,支持vim-surround
Plugin 'https://github.com/flazz/vim-colorschemes.git'
Plugin 'https://github.com/jiangmiao/auto-pairs.git'
Plugin 'https://github.com/Yggdroot/LeaderF.git'
Plugin 'https://github.com/w0rp/ale.git'
Plugin 'https://github.com/sheerun/vim-polyglot.git'    " 语法高亮增强
Plugin 'majutsushi/tagbar'      " 需要先安装ctags apt-get install ctags
Plugin 'https://github.com/matze/vim-move.git'
Plugin 'SirVer/ultisnips'        " Track the engine.
Plugin 'honza/vim-snippets'      " Snippets are separated from the engine. Add this if you want them:
Plugin 'wesQ3/vim-windowswap'    " 交换窗口之间的位置,按<leader>ww在当前窗口,然后移动到想到交换位置的窗口再按<leader>ww即可
Plugin 'terryma/vim-multiple-cursors'  " 多光标操作
" ADD YOUR PLUGIN
call vundle#end()
filetype plugin indent on
"Vundle Section End

" NERDTTree配置
" 关闭NERDTree快捷键
nmap <F4> :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
" let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=35
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 快捷定位当前文件在nerdtree中
nmap fn :NERDTreeFind<CR>
" 打开文件vim自动进入该文件的目录,并且考虑打开terminal的情况
"autocmd BufEnter * lcd %:p:h
augroup AutoChdir
  autocmd!
  autocmd BufEnter * if &buftype !=# 'terminal' | lchdir %:p:h | endif
augroup END

" indent_guid配置
"let g:indent_guides_enable_on_vim_startup = 0    " 添加行，vim启动时启用
"let g:indent_guides_start_level = 1              " 添加行，开始显示对齐线的缩进级别
"let g:indent_guides_guide_size = 1               " 添加行，对齐线的宽度，（1字符）
"let g:indent_guides_tab_guides = 0               " 添加行，对tab对齐的禁用

" indent_line配置
let g:indentLine_enabled = 1            " 设置启动缩进指示
let g:indentLine_noConcealCursor = 1    " 解决光标位置不正确
let g:indentLine_color_term = 3         " 更换缩进指示颜色
let g:indentLine_char = '|'             " 设置指示符号,不正确的指示符号会造成光标位置不正确
"let g:indentLine_conceallevel  = &conceallevel    " 让插件不隐藏链接,但是插件会失效
let g:indentLine_concealcursor = &concealcursor   " 让插件光标进入隐藏链接时显示隐藏

" airline和其themes配置
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

" nerdcommenter配置
let g:NERDSpaceDelims = 0        " 给注释符号后面添加空格
let g:NERDCompactSexyComs = 1    " 让注释更紧凑
let g:NERDDefaultAlign = 'left'  " 让注释不会随着代码缩进

" YouCompleteMe配置
" 完成补全之后preview窗口自动消失
let g:SimpyIFold_docstring_preview=1
let g:ycm_autoclose_preview_window_after_insertion = 1
" 指定python3解释器目录
let g:ycm_server_python_interpreter='/usr/bin/python3.6'
" 指定.ycm_extra_conf位置
let g:ycm_global_ycm_extra_conf='/root/.vim/.ycm_extra_conf.py'
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=1
" 跳转到定义和声明
" nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

"" syntatic配置
"" 设置语法检查方法
"let g:syntastic_python_checkers=['pyflakes']
"" 设置错误符号
"let g:syntastic_error_symbol='✗'
"" 设置警告符号
"let g:syntastic_warning_symbol='>'
"" 是否在打开文件时检查
"let g:syntastic_check_on_open=0
"" 是否在保存文件后检查
"let g:syntastic_check_on_wq=1
"" 修复错误之后自动更新它的底部描述
"let g:syntastic_always_populate_loc_list = 1
"" 快捷查看错误列表
"nnoremap <F2> :Errors<CR>

" rainbow配置(彩色括号)
let g:rainbow_active = 1

" vim-colorschemes配置
colorscheme gruvbox
" 设置vim为透明,不知道为什么没有效果
let g:gruvbox_italic=1
set background=dark    " Setting dark mode

" leaderF配置
let g:Lf_WorkingDirectoryMode = 'a'      " 设置目录为当前文件所在目录,只对终端下打开文件
"<C-J>   move the cursor downward in the result window
"<C-K>   move the cursor upward in the result window

" ale配置
" ale settings
"let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
" python checker
let g:ale_fixers = {
\   'javascript': ['standard'],
\   'python': ['pylint']
\}
"自定义跳转错误行快捷键
nmap <silent> <space>k <Plug>(ale_previous_wrap)
nmap <silent> <space>j <Plug>(ale_next_wrap)
" 设置python代码检查(需要先pip安装),忽略python E501错误(行太长)
let b:ale_linters = ['pylint']
let g:ale_python_pylint_executable = 'pylint'
let g:ale_python_pylint_options = '--ignore=E501'
" 避免光标在错误提示处不显示,ubuntu vim的问题,更新vim到8.1就好了
let g:ale_echo_cursor = 1

" Tagbar配置
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left = 0
nmap <F5> :TagbarToggle<CR>

" airline切换tab,buffer配置
let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体, 安装字体apt-get install fonts-powerline
set ambiwidth=double     " 设置为双字宽显示，否则无法完整显示如:☆
" 设置tabline扩展
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 显示ale信息
let g:airline#extensions#ale#enabled = 1

"" easymotion配置
"" 跳转到当前光标前后的位置(w/b)<leader><leader>w(word)和<leader><leader>b(back),搜索跳转(s),<leader><leader>s
"let g:EasyMotion_smartcase = 1    " 忽略大小写
""let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
"" hl行内搜索,jk行间搜索
"map <Leader><leader>h <Plug>(easymotion-linebackward)
"map <Leader><Leader>j <Plug>(easymotion-j)
"map <Leader><Leader>k <Plug>(easymotion-k)
"map <Leader><leader>l <Plug>(easymotion-lineforward)
"" 重复上一次操作
"map <Leader><leader>. <Plug>(easymotion-repeat)

" vim-move配置
let g:move_key_modifier = 'C'

" UltiSnips配置
" 解决与 YCM 插件的冲突
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"vim-multiple-cursors配置
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'     " 选中当前光标下字符, 按c开始修改
"let g:multi_cursor_select_all_word_key = '<A-n>'    " 全选匹配的字符
"let g:multi_cursor_start_key           = 'g<C-n>'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'     " 选中下一个字符
let g:multi_cursor_prev_key            = '<C-p>'     " 返回上一个字符
let g:multi_cursor_skip_key            = '<C-x>'     " 跳过当前选中, 选中下一个
let g:multi_cursor_quit_key            = '<Esc>'     " 退出

" 当不编辑主文件时自动退出vim
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
set textwidth=250    "vim自动换行(超过这个数值的行,向其中插入字符时会自动加上换行符)
set number          " Show line numbers.
set softtabstop=4   " 设定 tab 长度为 4
set tabstop=4       " 设定 tab 长度为 4
set shiftwidth=4    " 设定 >,<缩进的列数
autocmd FileType tex setlocal spell spelllang=en_us,cjk    " 拼写检查英文忽略中文
set expandtab       "将tab换成空格
filetype on         " 开启文件类型侦测
autocmd BufWritePost $MYVIMRC source $MYVIMRC   " 让配置变更立即生效
set laststatus=2    " 总是显示状态栏
"set nowrap          " 禁止代码折行
"set mouse=a         " 设置鼠标可用
set clipboard=unnamedplus   " 设置系统剪贴板
syntax enable       " 开启语法高亮功能
syntax on           " 允许用指定语法高亮配色方案替换默认方案
" let mapleader=","   " 定义快捷键的前缀，即<Leader>
" 设置光标
"set cursorcolumn    "高亮显示光标所在的屏幕行列
"set cursorline
" 记录上一次打开某一文件时的光标位置，并在下次打开同一文件时将光标移动到该位置
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
" 改变光标的前景色和背景色
"highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set encoding=utf-8    " 使用UTF-8编码
" 设置运行python程序快捷方式
nnoremap <F6> :call CompileRunGcc()<cr>
func! CompileRunGcc()
          exec "w"
          if &filetype == 'python'
                  if search("@profile")
                          exec "AsyncRun kernprof -l -v %"
                          exec "copen"
                          exec "wincmd p"
                  elseif search("set_trace()")
                          exec "!python3 %"
                  else
                          exec "AsyncRun -raw python3 %"
                          exec "copen"
                          exec "wincmd p"
                  endif
          endif

endfunc
let $PYTHONUNBUFFERED=1    " 在quickfix中实时显示python输出信息
" 快速停止运行程序
nnoremap <F7> :AsyncStop<CR>
" 当输入查找命令时，启用高亮search命中的文本
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>
" 当光标一段时间保持不动了，就禁用高亮
autocmd cursorhold * set nohlsearch
"" 快捷禁用搜索高亮
"nnoremap <F2> :call DisableHighlight()<cr>
"function! DisableHighlight()
    "set nohlsearch
"endfunc
" 搜索时忽略大小写
set ignorecase
" 如果有一个大写字母，则切换到大小写敏感查找
set smartcase
" 随着键入即时搜索
set incsearch
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 快速使用quickfix,打开,关闭,以及移动到错误行
nnoremap <leader>q :call QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
" 设置vim删除命令不剪切
nnoremap x "_x
nnoremap X "_X
nnoremap d "_d
nnoremap dd "_dd
nnoremap D "_D
vnoremap d "_d
vnoremap dd "_dd
" vim快速增加空行,并且支持数字操作,比如5]<space>
nnoremap <silent>[<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap <silent>]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
" 快速打开terminal
nnoremap <leader>t :vertica terminal<cr>
" 调整窗口(buffer)尺寸-+5
nnoremap <space><left> :vertical resize +5<cr>
nnoremap <space><right> :vertical resize -5<cr>
nnoremap <space><up> :resize +5<cr>
nnoremap <space><down> :resize -5<cr>

" 设置vim半透明,这行配置要放到后面才能生效,之前是因为放到前面被其他命令覆盖了
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" vim命令记录
" ci'、ci"、ci(、ci[、ci{、ci< - 分别更改这些配对标点符号中的文本内容,并且进入插入模式
" di'、di"、di(或dib、di[、di{或diB、di< - 分别删除这些配对标点符号中的文本内容
" yi'、yi"、yi(、yi[、yi{、yi< - 分别复制这些配对标点符号中的文本内容
" vi'、vi"、vi(、vi[、vi{、vi< - 分别选中这些配对标点符号中的文本内容
" da(连括号与括号内的文字一起删除
" :bd关闭缓冲区文件
" NERDTree按m会弹出对话框,里面有选项可以新建文件
" ~改变字母大小写
" <ctrl-s>会锁住vim,ctrl+q可以解锁
" ctrl-缩小字体, ctrl+0还原
" 命令:vert sb[buffernumber]可以让两个buffer垂直分屏显示,:sb[buffernumber]可以让两个buffer水平分屏显示
" <ctrl-w>c可以关闭当前window但是不关闭buffer
" 命令:ls可以列出当前buffer和buffernumber
" <ctrl-w>=,让所有窗口尺寸相等
" <ctrl-w>v,给当前文件再开一个垂直分屏
" <ctrl-w>S,给当前文件打开水平分屏
" <ctrl-w>r,,交换窗口位置(两个窗口时比较可控,三个窗口会循环窗口位置,用windowswap插件可控一点)
" 命令:browse oldfiles(:bro ol)可以打开最近打开的文件列表,按q或者esc之后输入文件的数字即可打开文件
" 命令:ol则是浏览最近打开的文件列表,进去之后使用:e #<[filenumber]打开文件
" 可视模式下按o可以在选区顶端位置切换
" <ctrl-o>返回上次光标位置
