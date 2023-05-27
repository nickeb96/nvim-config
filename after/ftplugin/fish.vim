
if executable("fish")
    let s:fish_data_dir = system("fish -c 'echo -n $__fish_data_dir/man'")
    if stridx($MANPATH, s:fish_data_dir) == -1
        let $MANPATH = s:fish_data_dir .. ":" .. $MANPATH
    endif
endif

