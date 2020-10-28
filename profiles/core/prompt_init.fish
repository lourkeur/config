# Defined in /home/louis/.config/fish/functions/fish_prompt.fish @ line 1
function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -l last_status $status
    set -l normal (set_color normal)

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    if contains -- $USER root toor
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
    end

    # Prepare pipestatus
    set -l prompt_status (__fish_print_pipestatus " [" "]" "|" (set_color $fish_color_status) (set_color --bold $fish_color_status) $last_pipestatus)

    # Line 1
    set_color yellow
    printf '%s' $USER
    set_color normal
    printf ' at '

    # If we're running via SSH, underline hostname.
    set_color magenta
    if set -q SSH_TTY
        set_color -u
    end
    echo -n (prompt_hostname)
    set_color normal
    printf ' in '

    set_color $color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    fish_vcs_prompt
    set_color normal

    printf '%s' $prompt_status
    echo

    # Line 2
    printf " ↪ "
    set_color normal
end
