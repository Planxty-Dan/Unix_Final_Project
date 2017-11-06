spellname=$1

grep -i "$spellname" $CATALOG_LOCATION > /tmp/spellSearch$$

if [ ! -s /tmp/spellSearch$$ ] ; then
	echo "\n \tNo spell found with that name."
	exit 1
fi

while read line 
do
	./display.sh $line
	echo "Change this spell entry? (y/n) \c"
	read answer < /dev/tty

	if [ "$answer" = y ] ; then
		break
	fi
done < /tmp/spellSearch$$

rm /tmp/spellSearch$$

if [ "$answer" != y ] ; then
	exit
fi

echo "$line\c" | tr '^' '\012' > /tmp/edit$$
${EDITOR:=vi}
trap "" 2

$EDITOR /tmp/edit$$

grep -i -v "^$line$" $CATALOG_LOCATION > /tmp/spells$$
tr '\012' '^' < /tmp/edit$$
{ tr '\012' '^' < /tmp/edit$$; echo; } >> /tmp/spells$$

sort /tmp/spells$$ -o $CATALOG_LOCATION
rm /tmp/edit$$ /tmp/spells$$
