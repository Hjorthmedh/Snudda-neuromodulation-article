rsync -av \
    --exclude='input*.hdf5' \
    --exclude='log/' \
    dardel.pdc.kth.se:$1 $2
