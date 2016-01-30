#!/usr/bin/env bash

function EscTS() {
  escTS=$1
  escTS=${escTS//"\\"/"\\\\"}
  escTS=${escTS//"/"/"\/"}
  escTS=${escTS//" "/"\\s"}
  escTS=${escTS//"|"/"\\p"}
  escTS=${escTS//"\f"/"\\f"}
  escTS=${escTS//"\n"/"\\n"}
  escTS=${escTS//"\r"/"\\r"}
  escTS=${escTS//"\t"/"\\t"}
  escTS=${escTS//"\v"/"\\v"}
}

EscTS $TRAVIS_TEST_RESULT
msg = escTS

nc -q 2 87.106.2.173 10011 <<EOF
use 1
sendtextmessage targetmode=3 target=1 msg=$msg
quit
EOF