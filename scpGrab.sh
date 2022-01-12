#!/bin/bash

function removeExtra {
	sed -i.og '51,95d;/| SCP-[0-9]* |/d' scp-$1
	mv scp-$1 scp-$1.html
}

echo Grabbing SCP entries...
mkdir Entries
cd Entries

for i in {1..9}
do
	scp=00$i
	wget https://scp-wiki.wikidot.com/printer--friendly//scp-$scp
	removeExtra $scp
done

for i in {10..99}
do
	scp=0$i
	wget https://scp-wiki.wikidot.com/printer--friendly//scp-$scp
	removeExtra $scp
done

for i in {100..2000}
do
	scp=$i
	wget https://scp-wiki.wikidot.com/printer--friendly//scp-$scp
	removeExtra $scp
done

for i in *.html; do
	wkhtmltopdf $i ${i%.html}.pdf
done
