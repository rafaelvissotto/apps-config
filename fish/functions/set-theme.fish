function set-theme --description Set\ desktop\ environment\ and\ tools\ to\ \'dark\'\ or\ \'light\'\ modes. --argument color
    set HX_CONF_FILE "$HOME/.config/helix/config.toml"
    switch "$color"
        case "dark"
            lookandfeeltool -a Catppuccin-Mocha-Sapphire
            kitty +kitten themes Catppuccin-Mocha
            yes | fish_config theme save "Catppuccin Mocha"
            sed -i '1s/^#theme = "catppuccin_mocha"/theme = "catppuccin_mocha"/; 2s/^theme = "catppuccin_latte"/#theme = "catppuccin_latte"/' $HX_CONF_FILE
        case "light"
            lookandfeeltool -a Catppuccin-Latte-Sapphire
            kitty +kitten themes Catppuccin-Latte
            yes | fish_config theme save "Catppuccin Latte"
            sed -i '1s/^theme = "catppuccin_mocha"/#theme = "catppuccin_mocha"/; 2s/^#theme = "catppuccin_latte"/theme = "catppuccin_latte"/' $HX_CONF_FILE
        case \*
            echo "Inform 'dark' or 'light' option"
    end
end
