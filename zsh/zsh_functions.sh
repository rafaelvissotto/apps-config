function virtual_env_activate() {
    if [[ -z "$VIRTUAL_ENV" ]]; then
        # Only apply if inside a trusted directory - `.../Documents/code/...` parent folder
        if [[ "$PWD" != */Documents/code/* ]]; then
            return
        fi

        if [[ -d ./.venv && -f ./.venv/bin/activate ]]; then
            echo "Activating virtual env"
            source ./.venv/bin/activate
        fi
    else
        # deactivate virtual env when going out of its directory, including sub-dirs
        parentdir="$(dirname "$VIRTUAL_ENV")"
        if [[ "$PWD"/ != "$parentdir"/* ]]; then
            echo "Deactivating virtual env"
            deactivate
        fi
    fi
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
