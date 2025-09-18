# bash-completion の読み込み
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
# ==== 補完設定 ====
# bash-completion 読み込み
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# 補完の挙動カスタマイズ
bind "set completion-ignore-case on"      # 大文字小文字を無視
bind "set show-all-if-ambiguous on"       # 候補をすぐに表示
bind '"\t":menu-complete'                 # Tab で候補を順送り
bind '"\e[Z":menu-complete-backward'      # Shift+Tab で逆送り
bind "set mark-directories on"            # ディレクトリ補完時に / を付ける

# ==== プロンプト設定 ====          
# 色付きプロンプト  
# PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[0m\] \$ '
# Git ブランチ表示関数
parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}

PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[33m\]$(parse_git_branch)\[\e[0m\] \$ '


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
