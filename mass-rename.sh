for f in *.mp3
do
  newfile=$f
  if [ "$1" = "DashSpace" ]; then
    newfile=$(echo $f | sed -E 's/-/ /g')
    #newfile=$(echo $f | sed -E 's/^[a-zA-Z]-/./g')
  elif [ "$1" = "RemoveDashOnwards" ]; then
    newfile=$(echo $f | sed -E 's/[ ]*-[a-zA-Z0-9@\., ]*(\.mp3)/.mp3/g')
  elif [ "$1" = "RemoveUptoDash" ]; then
    newfile=$(echo $f | sed -E 's/^[a-zA-Z0-9@\., ]*-[ ]*//g')
  elif [ "$1" = "MonthToNum" ]; then
    year=2017
    newfile=$f
    newfile=$(echo $newfile | sed -E 's/.*01.*/01/g')
    newfile=$(echo $newfile | sed -E 's/.*02.*/02/g')
    newfile=$(echo $newfile | sed -E 's/.*03.*/03/g')
    newfile=$(echo $newfile | sed -E 's/.*04.*/04/g')
    newfile=$(echo $newfile | sed -E 's/.*05.*/05/g')
    newfile=$(echo $newfile | sed -E 's/.*06.*/06/g')
    newfile=$(echo $newfile | sed -E 's/.*07.*/07/g')
    newfile=$(echo $newfile | sed -E 's/.*08.*/08/g')
    newfile=$(echo $newfile | sed -E 's/.*09.*/09/g')
    newfile=$(echo $newfile | sed -E 's/.*10.*/10/g')
    newfile=$(echo $newfile | sed -E 's/.*11.*/11/g')
    newfile=$(echo $newfile | sed -E 's/.*12.*/12/g')
    newfile=$year$newfile.pdf
  else
    echo "options:" 
    echo "DashSpace, RemoveDashOnwards RemoveUptoDash, MonthToNum"
    exit 0
  fi

  if [ "$2" == "commit" ]; then
    mv "$f" "$newfile"
  elif [ "$1" != '' ]; then
    echo $newfile
  fi
done

