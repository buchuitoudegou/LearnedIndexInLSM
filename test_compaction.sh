#!/bin/bash
rm -rf /tmp/db
# build/test_compaction --compaction_style=leveling --num_levels=5 --num_ops=5000000
# rm -rf /tmp/db
# build/test_compaction --compaction_style=tiering --num_levels=4 --num_ops=5000000
build/test_compaction --compaction_style=lazylevel --num_levels=4 --num_ops=5000000
