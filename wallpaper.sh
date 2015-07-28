#! /bin/bash

#Going to download "New York East Side Gallery, hopefully they didn't change the url"
url="https://www.google.com/culturalinstitute/exhibit/east-side-gallery/gQAJocMp?projectId=street-art"

#parse the xml for the page and parse out the urls for the images we want to download
curl "$url" | grep -oP "src=\"http://lh((?:.|\n)*?)\"" | grep -oP "http(.*?)=" > values.txt
#num variable that we will use to name files
num=0
#string to concatenate to the end of the urls so we can download larger images
end='s1200'
#create the images directory 
mkdir Images
#while loop to loop through the "values.txt" file
while read line 
do 
	#increment the num variable
	num=$(( num+1))
	#concatenate the "end" string to our url
	download=$line$end
	#download the image located there and name it after the current value
	#of the num variable
	wget -O "Images/$num" "$download"

done <values.txt

#set initial index value to 0
echo 0 > index.txt

#delete the values.txt file 
rm values.txt

#run the set_wallpaper script to set the first wallpaper
./set_wallpaper.sh
