# ==== 対話シェルかどうかを判定し、対話時のみ行編集/補完/プロンプトを設定 ====
if [[ $- == *i* ]]; then
  # bash-completion の読み込み（対話時のみ）
  if [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
  fi

  # ==== 補完・行編集設定（bind は対話時のみ実行）====
  bind 'set completion-ignore-case on'     # 大文字小文字を無視
  bind 'set show-all-if-ambiguous on'      # 曖昧補完時に候補をすぐ表示
  bind '"\t":menu-complete'                # Tab で候補を順送り
  bind '"\e[Z":menu-complete-backward'     # Shift+Tab で逆送り
  bind 'set mark-directories on'           # ディレクトリ補完時に / を付ける

  # ==== プロンプト設定（対話時のみ）====
  # Git ブランチ表示関数
  parse_git_branch() {
    git branch 2>/dev/null | sed -n '/\* /s///p'
  }

  # 色付きプロンプト（ユーザー@ホスト 作業ディレクトリ [ブランチ名]）
  PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[33m\]$(parse_git_branch)\[\e[0m\] \$ '
fi

# ==== NVM（対話/非対話どちらでも有効にしたい場合はここに置く）====
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"               # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /workspace/.venv/bin/activate
PATH="/workspace/.venv/bin:${PATH}"
source /opt/crafter_pytorch/.venv/bin/activate
