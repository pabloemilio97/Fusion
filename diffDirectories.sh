#! bin/bash

#This script exports which files are different between two directories specified in first two lines in .txt files inside "directories" folder and outputs
#the diff is exported to the file specified in the third line of each of those .txt files

# 1. reads files in directories folders for arguments
# 2. exports which files differ between the two directories
# -q stands for short output: only names of directories that differ
# -r stands for recursive, to check all files inside given directory
# 4. resultant file is refactored to work with diffAll.awk
# 5. " and" is erased from all lines -> sed -i "s/ and//g" $3
# 6. "Only in" to "OnlyIn" -> sed -i "s/Only In/OnlyIn/g" $3
# 7. ": " is changed to "/" in all lines -> sed -i "s/: /\//g" $3
cat directories/*.txt | awk '{system("diff -rq "$1" "$2" > "$3); system("sed -i \"s/ and//g\" "$3); system("sed -i \"s/Only in/OnlyIn/g\" "$3); system("sed -i \"s/: /\\//g\" "$3)}'
