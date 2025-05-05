# lfi()
#
# when in lf, hit 'o' to cd to that directory and exit
# (see ~/.config/lf/lfrc for definition of 'o' binding

function lfi()
{
    LF_CHDIR=$(mktemp -t lf_chdir_XXXXXX.tmp)
    (LF_CHDIR=$LF_CHDIR $(which lf))
    dir=$(cat $LF_CHDIR)
    [ -n "$dir" ] && cd $dir
    rm $LF_CHDIR
}

alias lf=lfi
