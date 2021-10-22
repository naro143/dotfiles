# scrapbox upload
# requires nkf(brew install nkf), gsed(or linux sed)
# usage
# $ scrapbox hogehoge.txt
function scrapbox() {
  title=$(cat $1 | head -n 1); \
  body=$(cat "$1" | tail -n +2 | gsed 's/ /\t/g' | gsed 's/&/%26/g'); \
  open https://scrapbox.io/143memo/${title}?body=${body}
}

# interactive cd
# requires fzf
fd() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf --reverse +m) && cd "$dir"
}

# interactive cd to ghq repository
# requires ghq, fzf
function move_to_repository() {
  cd $(ghq list -p --vcs=git | fzf --reverse)
  zle reset-prompt
}
zle -N move_to_repository
bindkey '^g' move_to_repository

case `uname` in
  "Darwin" ) # reuires gnu-sed
    his() {
      print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --reverse | gsed -r 's/ *[0-9]*\*? *//' | gsed -r 's/\\/\\\\/g' )
    }

    gco() {
      local branches branch
      branches=$(git branch --all | grep -v HEAD) &&
      branch=$(echo "$branches" |
               fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
      git checkout $(echo "$branch" | gsed "s/.* //" | gsed "s#remotes/[^/]*/##")
    }
  ;;

  "Linux" )
    his() {
      print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
    }

    gco() {
      local branches branch
      branches=$(git branch --all | grep -v HEAD) &&
      branch=$(echo "$branches" |
               fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
      git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
    }
  ;;
esac

# sshの接続先ごとに背景色を変更する
function ssh() {
  # tmux利用時にだけ有効とする
  if [[ -n $(printenv TMUX) ]] ; then
    # 現在のペインIDを記録
    local pane_id=$(tmux display -p '#{pane_id}')

    # 特定のssh先の場合に色を変更する
    if [[ `echo $1 | grep 'prd'` ]] ; then
      tmux select-pane -P 'bg=colour54,fg=white'
    elif [[ `echo $1 | grep 'stg'` ]] ; then
      tmux select-pane -P 'bg=colour22,fg=white'
    else
      tmux select-pane -P 'bg=colour17,fg=white'
    fi

    # sshが終了したらdefaultの色に戻す
    trap 'tmux select-pane -t "$pane_id" -P "default"' 0 1 2 3 15
  fi
  
  command ssh $@
}
