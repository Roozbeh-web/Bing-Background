#!/bin/sh

#Store xml URL in a variable
xml="https://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-US"

#Get xml data
data=$(curl -s $xml)

#Store the image url in a variable
pic="www.bing.com"$(echo $data | grep -oP "<url>(.*)</url>" | cut -d ">" -f 2 | cut -d "<" -f 1)

#Store today date in a variable
today=$(date +"%Y-%-m-%d")

#Store path in a variable
path=$HOME"/Pictures/"

#Store name of the image file in a variable
name=$today".jpg"

#Get the image with curl command
curl -s -o $path$name $pic

#Set the image as desktop background
gsettings set org.gnome.desktop.background picture-uri file:////$path$name

#close the script
exit
