if status is-interactive
    # Commands to run in interactive sessions can go here
    alias cfg="cd ~/.config/"
    alias scr="cd ~/.config/my-scripts/"
    alias lis="cd ~/.config/my-lists/"
    alias home="cd ~/"
    alias sl="sl -e"
    alias mv="mv -iv"
    alias pip="pip --require-virtualenv"
    alias btrfs="btrfs --log debug"
    alias chal="cd ~/Public/ctfs/"
    function config -d "dotfile management"
        /usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" $argv
    end
    function tt -d "timetable"
        sxiv "/home/subzcuber/Pictures/imp/timetable-25s.png" -b -s f -f
    end
    function fcd -d "fzf cd"
        cd "$(find ~/ -type d  | fzf +i --scheme=path)"
    end
    function fshare -d "gen link to share file"
        curl -F"file=@$(find $HOME -type f | fzf)" 0x0.st | wl-copy
    end
    function fopen -d "fzf xdg-open"
        xdg-open "$(find ~/ -type f  | fzf +i --scheme=path)"
    end
    function getpath -d "copy path" 
        find ~/ -type f  | fzf | sed 's/^.{2}//;s/ /\\\ /g' | tr -d '\n' | wl-copy
    end
    function reload -d "reload shell"
        source ~/.config/fish/**/*.fish
    end
    function build -d "compile given file"
        set input_file $argv[1]
        set output_file $argv[2]

        if test -z "$input_file" -o -z "$output_file"
            echo "Usage: compile_file <input_file> <output_file>"
            return 1
        end

        # Replace the following line with your actual compilation command
        gcc -Wall -ggdb $input_file -o $output_file

        if test $status -eq 0
            echo "Compilation successful: $output_file"
        else
            echo "Compilation failed"
        end
    end
    function btrh -d "btrfs help"
        set search $argv[1]
        btrfs --help | grep -i "$search" -A 1 -B 1 -n
    end
    starship init fish | source
end

# pnpm
set -gx PNPM_HOME "/home/subzcuber/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# wallpaper env
set -g CURRENT_WALLPAPER "/home/subzcuber/Wallpapers/animegirls/ryo-btr.png"

# ROS
set QT_QPA_PLATFORM xcb

# man pages
# if test -n "$NVIM_LISTEN_ADDRESS"
#   set -x MANPAGER "/usr/local/bin/nvr -c 'Man!' -o -"
# end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
