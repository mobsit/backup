function sidx(src,tgt) {
    SLENGTH = ( (SSTART=index(src,tgt)) ? length(tgt) : 0 )
    return SSTART
}
{
    skipped = 0
    starts = ""
    while ( sidx($0,string) ) {
        starts = starts (starts?" ":"") skipped + SSTART
        $0 = substr($0,SSTART + SLENGTH)
        skipped += SSTART + SLENGTH - 1
    }
}
starts { print  NR }
