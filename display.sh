spell=$1
IFS="^"
set $spell

spacer="\t-- \t -- \t -- \t -- \t -- \t -- \t -- \t --"

echo
echo $spacer
echo "\t Spell Name: $1 \n \t Level: $2  School: $3  Requires Component: $4 \n \t Description: $5"
echo $spacer
echo 