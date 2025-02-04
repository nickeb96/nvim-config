
if executable("fish")
    let s:base_man_path = system("manpath")
    let s:fish_man_path = system("fish --no-config -c 'echo -n $__fish_data_dir/man'")
    if stridx($MANPATH, s:fish_man_path) == -1
        let $MANPATH = s:fish_man_path .. ":" .. s:base_man_path
    endif
endif

