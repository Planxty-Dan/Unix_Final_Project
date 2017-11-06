spellname="$1"
grep -i "$spellname" $CATALOG_LOCATION > /tmp/spellSearch$$

if [ ! -s /tmp/spellSearch$$ ] ; then
	echo "\n \tNo spell found with that name."
else
	while read line
	do
		./display.sh "$line"
	done < /tmp/spellSearch$$
fi

rm /tmp/spellSearch$$