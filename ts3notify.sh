#!/usr/bin/env bash

nc -q 2 87.106.2.173 10011 <<EOF
use 1
sendtextmessage targetmode=3 target=1 msg=Build\sfailed\syou\snabs
quit
EOF
