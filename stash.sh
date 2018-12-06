TAG_FILE="tagfile"
NOTE_FILE="notes"
NOTE_PROMPT="    > "
if [ $# -eq 0 ]; then
  FILE_TAGS=`cat $TAG_FILE`
  read -p "Reference Tags ($FILE_TAGS) : " TAGS
  if [ "$TAGS" = ""  ]; then
    TAGS=$FILE_TAGS
  else
    echo $TAGS > $TAG_FILE
  fi
  echo "Recording for tags ($TAGS):"
  read -p "$NOTE_PROMPT" NOTE
  while [ "$NOTE" != ""  ];
  do
    echo "$TAGS $NOTE" >> $NOTE_FILE
    read -p "$NOTE_PROMPT" NOTE
  done
else
  CMD=""

  CMD="cat $NOTE_FILE"
  for TOKEN in "$@"
  do
    #if [ "$CMD" = "" ]; then
    #  CMD="echo $NOTE_FILE"
    #else
      CMD="$CMD | grep -i $TOKEN"
    #fi
  done
  eval "$CMD"
fi

