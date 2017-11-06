while read line
do
	./display.sh "$line"
done < $CATALOG_LOCATION 