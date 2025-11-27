function clip_last() {
    # last comand to clipboard (wayland)
    wl-copy "$(fc -nl -1)"
}

function rm() {
    # Wrapper to make rm safer by using trash-put
    for arg in "$@"; do
        # Skip flags
        [[ "$arg" =~ ^- ]] && continue

        # Block home directory attempts
        if [ "$arg" = "~" ] || [ "$arg" = "$HOME" ] || [ "$arg" = "~/" ]; then
            echo "BLOCKED: Refusing to remove home directory ($arg)"
            echo "This would delete your entire user directory including trash."
            return 1
        fi

        # Block root directory attempts
        if [ "$arg" = "/" ]; then
            echo "BLOCKED: Refusing to remove root directory"
            echo "This would delete your entire system."
            return 1
        fi

        # Expand tilde and check resolved path
        local expanded_path="${arg/#\~/$HOME}"
        if [ "$expanded_path" = "$HOME" ]; then
            echo "BLOCKED: Refusing to remove home directory"
            return 1
        fi
    done

    # If checks pass, use trash-put for safe deletion
    command trash-put "$@"
}

function virtual_env_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "$(basename "$VIRTUAL_ENV")"
    fi
}

function kube_env_info() {
    local -r kube_cfg="$HOME/.kube/config"
    if [ -f "$kube_cfg" ]; then
        kube_ctx=$(awk '$1 == "current-context:" && $2 != "\"\"" {print $2}' "$kube_cfg")
        echo "$kube_ctx"
    fi
}

function update_prompt() {
    PROMPT=""

    if [ "$PROMPT_HOST" = true ]; then
        PROMPT="%{$fg_bold[yellow]%}%n%{$reset_color%} "
    fi

    if [ "$PROMPT_KUBE" = true ]; then
        local kube_ctx
        kube_ctx=$(kube_env_info)
        if [[ -n $kube_ctx ]]; then
            PROMPT+="%{$fg_bold[blue]%}${kube_ctx}%{$reset_color%} "
        fi
    fi

    if [ "$PROMPT_VENV" = true ]; then
        local venv_name
        venv_name=$(virtual_env_info)
        if [[ -n $venv_name ]]; then
            PROMPT+="%{$fg[magenta]%}${venv_name}%{$reset_color%}"
        fi
    fi

    PROMPT+="$PROMPT_BASE"
}
