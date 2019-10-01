process maxbin2 {
    label 'maxbin2'
    input:
    set val(name), file(assembly), file(ont), file(illumina)
    output:
    set val(name), file("bins_dir/maxbin_bin")
    script:
    """
    run_MaxBin.pl -contig ${assembly}  -reads ${ont} -reads2 ${illumina[0]} -reads3 ${illumina[1]}  -out bins_dir/maxbin_bin -thread ${task.cpus}
    """
}  // add -prob_threshold 0.5 -markerset 40 ??