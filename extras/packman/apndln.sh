#!/usr/bin/env bash

FILE="$1"
shift
NEW_LINES=("$@")
awk -v nlines="${#NEW_LINES[@]}" -v newlines="$(IFS=$'\n'; echo "${NEW_LINES[*]}")" '
BEGIN {
  split(newlines, insert, "\n")
}
{
  if (!inserted && $0 ~ /^[ \t]*}[ \t]*$/) {
    match($0, /^([ \t]*)}/, m)
    indent = m[1]
    for (i = 1; i <= nlines; i++) {
      print indent insert[i]
    }
	inserted = 1
  }
  print
}
' "$FILE" > "${FILE}.tmp" && mv "${FILE}.tmp" "$FILE"
if [ -f packed.txt.tmp ]; then
	rm "packed.txt.tmp"
fi
