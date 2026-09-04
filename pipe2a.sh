#!/bin/bash

# first job - rplparallel (if present in your script)
jid1=$(sbatch /data/src/PyHipp_nictzl/rplparallel-slurm.sh)

# second job - no dependencies, called from the day directory
jid2=$(sbatch /data/src/PyHipp_nictzl/rse-slurm.sh)

# third set of jobs - depends on rse-slurm.sh, called from the day directory
jid3=$(sbatch --dependency=afterok:${jid2##* } /data/src/PyHipp_nictzl/rs1a-slurm.sh)
jid4=$(sbatch --dependency=afterok:${jid2##* } /data/src/PyHipp_nictzl/rs2a-slurm.sh)
jid5=$(sbatch --dependency=afterok:${jid2##* } /data/src/PyHipp_nictzl/rs3a-slurm.sh)
jid6=$(sbatch --dependency=afterok:${jid2##* } /data/src/PyHipp_nictzl/rs4a-slurm.sh)
