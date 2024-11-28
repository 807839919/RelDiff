#!/bin/bash
# sh scripts/vctree/test_panoptic_fpn_r101_predcls.sh

GPU=1
CPU=1
node=79
PORT=29500
jobname=pairnet

PYTHONPATH='.':$PYTHONPATH \
srun -p dsta --mpi=pmi2 --gres=gpu:${GPU} -n1 \
--cpus-per-task=${CPU} --ntasks-per-node=${GPU} \
--kill-on-bad-exit=1 --job-name=${jobname} -w SG-IDC1-10-51-2-${node} \
python tools/test.py \
  configs/vctree/panoptic_fpn_r101_fpn_1x_predcls_psg.py \
  work_dirs/vctree_panoptic_fpn_r101_fpn_1x_predcls_psg/epoch_12.pth \
  --eval predcls
