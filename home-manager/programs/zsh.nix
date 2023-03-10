{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    defaultKeymap = "emacs";

    history = {
      size = 1000000;
      save = 1000000;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      ignoreDups = true;
    };

    enableSyntaxHighlighting = true;

    shellAliases = {
      clbin = "${pkgs.curl}/bin/curl -F 'clbin=<-' https://clbin.com";
      grep = "${pkgs.gnugrep}/bin/grep --color=auto";
      "l." = "${pkgs.coreutils}/bin/ls -d .*";
      ll = "${pkgs.coreutils}/bin/ls -l";
      ls = "${pkgs.coreutils}/bin/ls --classify --all --color=auto --hyperlink=auto --group-directories-first";
    };

    initExtraFirst = ''
      print -v HOST_FULL -P '%M'
      print -v HOST_P -P '%m'
      autoload -U colors && colors

      color_lightness() {
        integer r=$1
        integer g=$2
        integer b=$3
        integer lightness=$(( (r*299) + (g*587) + (b*114) / 1000 ))
        # Tweak this based on theme color
        return $(( !(lightness > 125) ))
      }

      convert_to_rgb() {
        integer x=$1
        # truncate the top bits
        x='x & 16#FFFFFF'
        local r=$(( x >> 16 ))
        local g=$(( (x >> 8) & 16#FF ))
        local b=$(( x & 16#FF ))
        REPLY="$r $g $b"
      }

      # $1 - get hash of string
      # sdbm hash algo
      color_hash2() {
        local LANG=C #8bit char
        integer chr=0 hash=0 i=1 len=$#1
        # i=1 because zsh indexing
        for (( i=1; i<=len; ++i )); do
          printf -v chr '%d' \'"''${1[$i]}"
          # keep the number under 32bits
          hash='(chr + (hash << 6) + (hash << 16) - hash)'
        done
        REPLY=$hash
      }

      # $1 - string to hash
      serv_color() {
        local col_arr=("''${(@k)fg}")
        local filter=(white black default)
        # will conflict with colorized terms
        col_arr=("''${(@)col_arr:|filter}")
        color_hash2 $1
        integer chash=$REPLY
        REPLY="''${fg[''${col_arr[$(( chash % ''${#col_arr[@]} + 1))]}]}"
      }

      base16_prompt_color() {
        serv_color "$HOST_FULL"
        PS1_COLOR=$REPLY
      }

      truecolor_prompt_color() {
        color_hash2 "$HOST_FULL"
        convert_to_rgb "$REPLY"
        local rgb=(''${(s: :)REPLY})
        if color_lightness $rgb; then
          print -v PS1_COLOR -f '\033[38;2;%d;%d;%dm' $rgb
          else
          base16_prompt_color
        fi
      }

      truecolor_prompt_color

      # load vcs_info plugin
      autoload -U -z vcs_info &&
         zstyle ':vcs_info:*' formats $'%s\0%r\0%b\0%R\0/%S' &&
         zstyle ':vcs_info:*' actionformats $'%s\0%r\0%b\0%R\0/%S'

      zshprompt_git_info_pre() {
        vcs_info
        if [[ -n $vcs_info_msg_0_ ]]; then
          local vcs_infos=(''${(ps:\0:)vcs_info_msg_0_})
          local vcs_type=''${vcs_infos[1]}
          local repo=''${vcs_infos[2]}
          local branch=''${vcs_infos[3]}
          local parent_dir="''${vcs_infos[4]}/"
          parent_dir="''${parent_dir/#''$HOME/~}"
          local lpath="''${vcs_infos[5]#/}/"
          local vcs_changes=

          if [[ ''$vcs_type == 'git' ]]; then
            # porcelain v1 output has different meanings during a merge
            if [[ -f ''$parent_dir/.git/MERGE_HEAD ]]; then
              vcs_changes+='MERGE'
            elif [[ -f ''$parent_dir/.git/REVERT_HEAD ]]; then
              vcs_changes+='REVERT'
            else
              [[ -d ''$parent_dir/.git/rebase-merge ||
                 -d ''$parent_dir/.git/rebase-apply ]] &&
                vcs_changes+='REBASE:'
              integer untracked=0
              integer staged=0
              integer unstaged=0
              ${pkgs.git}/bin/git status --porcelain=v1 | \
              while IFS= read -r st; do
                case ''${st:0:2} in
                  '??') untracked+=1 ;;
                  ?' ') staged+=1 ;;
                  ' '?) unstaged+=1 ;;
                  ??)   staged+=1; unstaged+=1 ;;
                esac
              done
              vcs_changes+="S:%F{green}''$staged%f "
              vcs_changes+="U:%F{yellow}''$unstaged%f "
              vcs_changes+="N:%F{red}''$untracked%f"
            fi
          fi
          local esc_branch=''${branch//'%'/%%}
          local esc_branch=''${esc_branch//')'/%)}
          zshprompt_git_info="[B:''$esc_branch ''$vcs_changes] "
          return 0
        else
          zshprompt_git_info=
          return 1
        fi
      }

      precmd() {
        zshprompt_git_info_pre
        PROMPT="%{$PS1_COLOR%}%m%f (%(?.%F{green}0%f.%F{red}%?%f)%)%2(L. L%L.) $zshprompt_git_info%~ %B%#%b "
      }
    '';

    initExtra = ''
      [[ -z $LS_COLORS ]] && {
        # dircolors only supports some terminals, like xterm
        eval "$(TERM=xterm-256color ${pkgs.coreutils}/bin/dircolors -b)"
      }
    '';

    localVariables = {
    PROMPT = "%{$PS1_COLOR%}%m%f (%(?.%F{green}0%f.%F{red}%?%f)%)%2(L. L%L.) %~ %B%#%b ";
    };
  };
}
