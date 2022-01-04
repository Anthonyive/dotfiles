#!/bin/zsh

timezsh() {
    echo "Measuring shell's load times...\n"
    shell=${1-$SHELL}
    for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
    
    echo "\nTiming plugins...\n"
    # Load all of the plugins that were defined in ~/.zshrc
    for plugin ($plugins); do
    timer=$(($(gdate +%s%N)/1000000))
    if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
        source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
    elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
        source $ZSH/plugins/$plugin/$plugin.plugin.zsh
    fi
    now=$(($(gdate +%s%N)/1000000))
    elapsed=$(($now-$timer))
    paste <(echo "\t"$elapsed"ns") <(echo $plugin) 
    done
}
