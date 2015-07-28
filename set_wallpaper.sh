#! /bin/bash

#gsettings set org.gnome.desktop.background picture-uri file:///home/serrano/Pictures/y.jpg

index=$(head -n 1 index.txt)
index=`expr $index + 1`

path=`pwd`

fullPath="file://"$path$end"/Images/"$index
echo $fullPath

gsettings set org.gnome.desktop.background picture-uri "$fullPath"

echo $index > index.txt

