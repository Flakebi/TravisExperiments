#!/usr/bin/env bash

function EscTS() {
  escTS=$1
  escTS=${escTS//"\\"/"\\\\"}
  escTS=${escTS//"/"/"\\/"}
  escTS=${escTS//" "/"\\s"}
  escTS=${escTS//"|"/"\\p"}
  escTS=${escTS//"\f"/"\\f"}
  escTS=${escTS//"\n"/"\\n"}
  escTS=${escTS//"\r"/"\\r"}
  escTS=${escTS//"\t"/"\\t"}
  escTS=${escTS//"\v"/"\\v"}
}

if [ $TRAVIS_TEST_RESULT -eq 0 ]; then
  ok="succeeded"
else
  ok="failed"
fi

EscTS "Commit $TRAVIS_COMMIT in branch $TRAVIS_BRANCH (Build $TRAVIS_BUILD_ID) $ok."

nc -q 2 87.106.2.173 10011 <<EOF
use 1
sendtextmessage targetmode=3 target=1 msg=$escTS
quit
EOF
