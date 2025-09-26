function update_kube_prompt() {
    local -r kube_cfg="$HOME/.kube/config"
    if [ ! -f "$kube_cfg" ]; then
        PROMPT="$PROMPT_BASE"
        return
    fi
    local kube_ctx=$(awk '$1 == "current-context:" && $2 != "\"\"" {print $2}' "$kube_cfg")
    if [[ -n "$kube_ctx" ]]; then
        PROMPT="%{$fg_bold[yellow]%}${kube_ctx}%{$reset_color%}$PROMPT_BASE"
    else
        PROMPT="$PROMPT_BASE"
    fi
}

function virtualenv_info {
    [ "$VIRTUAL_ENV" ] && echo "($(basename "$VIRTUAL_ENV")) "
}
