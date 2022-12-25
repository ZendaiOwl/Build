#!/usr/bin/env bash
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
set -euf -o pipefail
REC=0
help(){
  echo "Usage:"
  echo -e "\t-d: [DOMAIN] | Domain to lookup its DNS record(s)"
  echo -e "\t-r: [DNS RECORD] | Record type, i.e A or AAAA etc.\n"
  echo "Record option can be repeated, ex. [-d example.com -r A -r AAAA -r MX -r TXT]"
}
while getopts ":h:d:r:" opt; do
   case "$opt" in
      h) # display Help
        help
        exit 0;;
      d) # Domain to lookup
        DOMAIN="$OPTARG"
        ;;
      r) # Record(s) to lookup, i.e A or AAAA etc.
        RECORD+=("$OPTARG")
        REC=1
        ;;
      \?) # Invalid option
        echo "Error: Invalid option"
        exit 1;;
   esac
done
if test "$OPTIND" -eq 1 || test "$OPTIND" -le "$#"
then
  help
  exit 1;
fi
if test ! -z "$DOMAIN" && test "$REC" -ne 0
then
  echo "$DOMAIN" "${RECORD[@]}"
  for r in "${RECORD[@]}"; do
    dig "$r" "$DOMAIN" +short
  done
fi
if test ! -z "$DOMAIN" && test "$REC" -eq 0
then
  echo "$DOMAIN"
  dig "$DOMAIN" +short
fi
set +euf -o pipefail
exit 0
