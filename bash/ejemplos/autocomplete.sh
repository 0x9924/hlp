parameter-completion () {
    echo $1
}

_parameter-completion ()  
{          
    local cur
    _init_completion || return

    opts="uno dos tres cuatro cinco seis siete ocho nueve --uno --dos --tres"
  
    if [[ "$cur"  == * ]] ; then
        COMPREPLY=( $( compgen -W "${opts}" -- "$cur" ) )
    fi
}

complete -F _parameter-completion parameter-completion

