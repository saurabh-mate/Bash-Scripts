#!/bin/bash
if [ "$1" ]; then
        echo "The size of the directory '$1'is:"
        du -sh "$1" 
else
        echo "The directory is not present"

fi 

echo "CHOOSE  AN ARCHIVE METHOD:"
read -p "Enter your choice (1: tar , 2: zip):" choice
case $choice in 
        1)
                echo "Archiving using tar"
                tar -cvf "$1.tar" "$1"
                du -sh "$1.tar"
                ;;
        2) 
                echo "Archiving using zip"
                zip -r "$1.zip" "$1"
                du -sh "$1.zip"
                ;;
esac
     
