#!/bin/bash

#1)declaration des variables pouvent être modifier :
clear
echo "================= Hyrule Castle ================="
read -p 'Qui ose se presenter devant la porte du grand chateaux : ' name
hpInit="60"
strInit="15"
state=""
hp="60"
floor="0"
floorMobHp="30"
floorMobHpInit="30"
floorStr="5"
ganonHp="150"
ganonStr="20"
nameMob="Bokoblin"
#2)la base du jeux simplifier :

while [[ $hp -ne "0" && $ganonHp -ne "0" ]]; do

#2.1)condition arret de parti victoire ou defaite :

	if [[ $floor -ne "10" ]]; then

#2.1.1)positionnement dans le donjon :

		echo "$name tu es a l'etage $floor, tu as $hp PV et tu occasionnes $strInit DG par attaque."
		while [[ $hp -ne "0" && $floorMobHp -ne "0" ]]; do

#2.1.2)phase de comba :

			echo "etage : $floor"
			echo "PV de $name : $hp =================================== PV du $nameMob : $floorMobHp"
			echo "DG de $name : $strInit =================================== DG du $nameMob : $floorStr"
			echo "A toi de jouer : "
			echo "Quelle action veux-tu faires, attaquer ou te soigner (a/s) :"
			read action
			if [[ $action == "a" ]]; then
				echo "Tu occasionnes $strInit DG aux Mob."
				floorMobHp=$(( $floorMobHp - $strInit ))
				echo "$nameMob t'as occasionné $floorStr DG "
                        	hp=$(( $hp - $floorStr ))
				if [[ $floorHp -ne "0" ]]; then
					hp=$(( $hp - $floorStr ))
				fi
			elif [[ $action == "s" ]]; then
				echo "Tu soigne $(( $hpInit/2 )) PV"
				hp=$(( $hp + $hpInit/2 ))
				if [[ $hp -gt $hpInit ]]; then
					hp=$hpInit
				fi
				echo "$nameMob t'as occasionné $floorStr DG "
                                if [[ $floorHp -ne "0" ]]; then
                                        hp=$(( $hp - $floorStr ))
                                fi
			else
				echo "Les seuls reponses admises sont attaque ou soing."
			fi
		done
		clear
		if [[ $hp -ne "0" ]]; then
			echo "====================== etage : $floor WIN ======================"
		fi
		floor=$(( $floor + 1 ))
		floorMobHp=$floorMobHpInit
	fi
	if [[ $floor -eq "10" ]]; then
		echo -e "$name tu es arriver a l'etage $floor, tu as $hp HP et...\nUn bruit de pas lourd fait raisonner les esqualiers menant aux 10éme etage.\nIl est la ,Ganondorf le geant vous et la princesse zelda prisonnier du tirant"
		while [[ $hp -ne "0" && $ganonHp -ne "0" ]]; do
			echo "etage : BOSS "
                        echo "PV de $name : $hp =================================== PV de Ganondorf : $ganonHp"
                        echo "Rox de $name : $strInit =================================== Rox du Ganondorf : $ganonStr"
                        echo "Â toi de jouer : "
                        echo "Quelle action veux-tu faires, attaquer ou te soigner (attaque/soing) :"
			read action
                        if [[ $action == "attaque" ]]; then
				hp=$(( $hp - $ganonStr ))
                                if [[ $ganonHp -ne "0" ]]; then
                                        ganonHp=$(( $ganonHp - $strInit ))
                                fi
                        elif [[ $action == "soing" ]]; then
                                hp=$(( $hp + $hpInit/2 ))
                                if [[ $ganonHp -ne "0" ]]; then
                                        ganonHp=$(( $ganonHp - $strInit ))
                                fi
                                if [[ $hp -gt $hpInit ]]; then
                                        hp=$hpInit
                                fi
                        else
                                echo "Les seuls reponses admises sont attaque ou soing."
                        fi
                done
	fi
done
if [[ $hp -eq "0" ]]; then
	echo "====================== etage : $(( $floor-1 )) YOU LOSE ======================"
else
	echo "====================== YOU WIN ======================"
fi
