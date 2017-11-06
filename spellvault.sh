: ${CATALOG_LOCATION:=$HOME/spell_catalog}
export CATALOG_LOCATION

lineandtab="\n \t"

if [ ! -e "$CATALOG_LOCATION" ] ; then
	echo ""
	echo "No file exists at $CATALOG_LOCATION."
	echo "Want to create that file? (y/n) \c"
	read answer

	if [ "$answer" != y ] ; then
		exit 1
	fi

	> $CATALOG_LOCATION || exit1
fi

if [ "$#" -ne 0 ] ; then
	./search.sh "$@"
	exit
fi

trap "continue" 2

while true 
do
	echo "\nWelcome to Spell Vault"
	echo '
	1. Search for a spell
	2. Add a spell
	3. Remove a spell
	4. Change a spell
	5. Display all spells in the vault
	6. Exit Spell Vault

	What would you like to do? (Select 1-6) : \c'

	read choice

	case "$choice" in
		1) echo "${lineandtab}What's the name of the spell to search for? \c"
			read spellname

			if [ -z "$spellname" ] ; then
				echo "${lineandtab}Must enter a spell name to search"
			else
				./search.sh "$spellname"
			fi;;
		2) ./add.sh;;
		3) echo "${lineandtab}What's the name of the spell to remove? \c"
			read spellname

			if [ -z "$spellname" ] ; then
				echo "${lineandtab}Must enter a spell name to remove"
			else
				./remove.sh "$spellname"
			fi;;
		4) echo "${lineandtab}What's the name of the spell to change? \c"
			read spellname

			if [ -z "$spellname" ] ; then
				echo "${lineandtab}Must enter a spell name to change"
			else
				./change.sh "$spellname"
			fi;;
		5) ./displayall.sh;;
		6) exit 0;;
		*) echo "${lineandtab}A valid selection of 1-6 is required"
	esac
	
done