spellname="$1"
grep -i "$spellname" $CATALOG_LOCATION > /tmp/spellSearch$$

if [ ! -s /tmp/spellSearch$$ ] ; then
	echo "\tThat spell is not in the vault"
	exit 1
fi

while read line 
do
	./display.sh $line
	echo "\tRemove this spell from the vault? (y/n) \c"
	read answer < /dev/tty

	if [ "$answer" = y ] ; then
		break
	fi
done < /tmp/spellSearch$$

rm /tmp/spellSearch$$

if [ "$answer" = y ] ; then
	if grep -i -v "^$line$" $CATALOG_LOCATION > /tmp/spells$$ ; then
		mv /tmp/spells$$ $CATALOG_LOCATION
		echo "\t${spellname} removed from vault"
	else
		echo "\tSpell not removed"
	fi
fi