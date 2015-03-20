#!/bin/bash

let win=0
let lose=0
VERT="\\033[1;32m"
NORMAL="\\033[0;39m"
ROUGE="\\033[1;31m"
ROSE="\\033[1;35m"
BLEU="\\033[1;34m"
BLANC="\\033[0;02m"
BLANCLAIR="\\033[1;08m"
JAUNE="\\033[1;33m"
CYAN="\\033[1;36m"

x=""

if [ "$#" -lt 2 ]
then
	echo  -n "Choisir le nombre de tour pour la simulation : "
	read nb_tours

	echo -n "Choisir le nombre de cubes : "
	read nb_dice
else
	nb_tours=$1
	nb_dice=$2
fi

dice=( red yellow yellow green red green )
color=( $ROUGE $JAUNE $JAUNE $VERT $VERT $VERT )

for i in  $(seq 1  $nb_tours)
do
	for j in $(seq 1 $nb_dice)
	do		
		index=$(($RANDOM%5));
		x="${x}"${color[$index]}"${dice[$index]},"
	done
	echo -e "${x}"
	outcom="$(echo "$x"|grep red|grep -v green)"
	
	if [ "$outcom" == "" ]
	then
		let win+=1
	else
		let lose+=1
	fi
	x=""
done

echo -e $BLANC"----------------"
echo "Wins=$win"
echo "Lose=$lose"
