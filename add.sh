invalid="\tInvalid entry"

while true 
do
	while true 
	do
		echo "\tSpell name? \c"

		read spellname

		if [ -z "$spellname" ] ; then
			echo $invalid
		else
			break
		fi
	done

	while true 
	do
		echo "\tSpell level? \c"

		read spelllevel

		if [[ "$spelllevel" == *[^0-9]* ]]; then
			echo $invalid
		else
			break
		fi
	done

	while true
	do
		echo "\tSpell school? (H or help for available options) \c"

		read spellschool

		if [ "$spellschool" == "H" -o "$spellschool" == "help" ] ; then
			echo '
			(A)bjuration
			(C)onjuration
			(D)ivination
			(En)chantment
			(Ev)ocation
			(I)llusion
			(N)ecromancy
			(T)transmutation
			(U)niversal \n'
		else
			case $spellschool in
				A )
					spellschool="Abjuration";;
				C )
					spellschool="Conjuration";;
				D ) 
					spellschool="Divination";;
				En )
					spellschool="Enchantment";;
				Ev )
					spellschool="Evocation";;
				I ) 
					spellschool="Illusion";;
				N ) 
					spellschool="Necromancy";;
				T )
					spellschool="Ttransmutation";;
				U ) 
					spellschool="Universal";;
				* ) 
					echo $invalid
			esac
			break
		fi
	done

	while true 
	do 
		echo "\tRequires components? (y/n) \c"

		read spellcomponent

		if [ "$spellcomponent" == y ] || [ "$spellcomponent" == n ]; then
			break
		else
			echo $invalid
		fi
	done

	while true 
	do 
		echo "\tSpell Description? \c"

		read spelldescription

		if [ -z "$spelldescription" ] ; then
			echo $invalid
		else
			break
		fi
	done

	entry="$spellname^$spelllevel^$spellschool^$spellcomponent^$spelldescription"

	echo "$entry" >> $CATALOG_LOCATION

	sort -o $CATALOG_LOCATION $CATALOG_LOCATION

	echo "\t${spellname} added to the spell vault"
	
	while true 
	do
		echo "\nWould you like to add another spell to the vault? (y/n)\c"

		read addanother

			if [ "$addanother" == y ] ; then
				break 
			elif [ "$addanother" == n ] ; then
				break 2
			else
				echo $invalid
			fi
	done
done