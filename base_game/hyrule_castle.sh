clear
echo "================= Hyrule Castle ================="
# aleatoir:
alea=$(echo $((1 + RANDOM % 100)))
if [[ $alea -le 50 ]]; then
	echo "Ton personnage est Link!"
	name="Link"
elif [[ $alea -le 80 ]]; then
	echo "Ton personnage est Young Link!"
	name="Young Link"
elif [[ $alea -le 95 ]]; then
	echo "Ton personnage est Sheik!"
	name="Sheik"
elif [[ $alea -le 99 ]]; then
	echo "Ton personnage est Impa!"
	name="Impa"
else
	echo "Ton personnage est Hylia!"
	name="Hylia"
fi
while IFS=',' read -r idPerso namePerso hpPerso mpPerso strPerso intPerso defPerso resPerso spdPerso luckPerso racePerso classPerso rarityPerso; do
	if [[ $name == $namePerso ]]; then
        	hpInit=$hpPerso
	        hp=$hpPerso
        	strInit=$strPerso
		echo "$name a $hp PV tu fais $str DG!"
	fi
done < players.csv

alea=$(echo $((1 + RANDOM % 100)))
if [[ $alea -le 50 ]]; then
	alea=$(echo $((1 + RANDOM % 100)))
	if [[ $alea -le 25 ]]; then
		echo "Vous affrontez un Skulltula !"
        	nameMob="Skulltula"
	elif [[ $alea -le 50 ]]; then
        	echo "Vous affrontez un Octorock !"
        	nameMob="Octorock"
	elif [[ $alea -le 75 ]]; then
		echo "Vous affrontez un Bokoblin !"
	else
		echo "Vous affrontez un Deku Scrub !"
        	nameMob="Deku Scrub"
	fi
elif [[ $alea -le 80 ]]; then
	alea=$(echo $((1 + RANDOM % 100)))
	if [[ $alea -le 50 ]];then
        	echo "Vous affrontez un Lizalfos !"
        	nameMob="Lizalfos"
	else
        	echo "Vous affrontez un Gibdo !"
        	nameMob="Gibdo"
	fi
elif [[ $alea -le 95 ]]; then
	alea=$(echo $((1 + RANDOM % 100)))
	if [[ $alea -le 50 ]];then
        	echo "Vous affrontez un Dead Hand !"
		ennemies="Dead Hand"
	else
        	echo "Vous affrontez un Golden Skulltula !"
        	ennemies="Golden Skulltula"
	fi
elif [[ $alea -le 99 ]]; then
	alea=$(echo $((1 + RANDOM % 100)))
	if [[ $alea -le 50 ]]; then
	        echo "Vous affrontez un Stalfos !"
        	nameMob="Stalfos"
	else
        	echo "Vous affrontez un Darknuts !"
        	nameMob="Darknuts"
	fi
else
	alea=$(echo $((1 + RANDOM % 100)))
	if [[ $alea -le 50 ]]; then
        	echo "Vous affrontez un Lynel !"
        	nameMob="Lynel"
	else
        	echo "Vous affrontez un Guardian !"
        	nameMob="Guardian"
	fi
fi
while IFS=',' read -r idMob nameM hpMob mpMob strMob intMob defMob resMob spdMob luckMob raceMob classMob rarityMob; do
        if [[ $nameMob == $nameM ]]; then
		floorMobHpInit=$hpMob
		floorMobHp=$hpMob
		floorStr=$strMob
		echo "Le mob à "$floorMobHp"PV et occasionne "$floorStr"DG !"
        fi
done < enemies.csv

#1)declaration des variables pouvent être modifier :

floor="0"
ganonHp="150"
ganonStr="20"

#2)la base du jeux simplifier :

while [[ $hp -ne "0" && $ganonHp -ne "0" ]]; do

#2.1)condition arret de parti victoire ou defaite :

        	if [[ $floor -ne "10" ]]; then
#2.1.INIT
		alea=$(echo $((1 + RANDOM % 100)))
		if [[ $alea -le 50 ]]; then
        		alea=$(echo $((1 + RANDOM % 100)))
        		if [[ $alea -le 25 ]]; then
        		        echo "Vous affrontez un Skulltula !"
        	        	nameMob="Skulltula"
        		elif [[ $alea -le 50 ]]; then
                		echo "Vous affrontez un Octorock !"
                		nameMob="Octorock"
        		elif [[ $alea -le 75 ]]; then
                		echo "Vous affrontez un Bokoblin !"
        		else
                		echo "Vous affrontez un Deku Scrub !"
                		nameMob="Deku Scrub"
        		fi
		elif [[ $alea -le 80 ]]; then
        		alea=$(echo $((1 + RANDOM % 100)))
        		if [[ $alea -le 50 ]];then
                		echo "Vous affrontez un Lizalfos !"
                		nameMob="Lizalfos"
        		else
                		echo "Vous affrontez un Gibdo !"
                		nameMob="Gibdo"
        		fi
		elif [[ $alea -le 95 ]]; then
        		alea=$(echo $((1 + RANDOM % 100)))
        		if [[ $alea -le 50 ]];then
                		echo "Vous affrontez un Dead Hand !"
                		ennemies="Dead Hand"
        		else
                		echo "Vous affrontez un Golden Skulltula !"
                		ennemies="Golden Skulltula"
        		fi
		elif [[ $alea -le 99 ]]; then
        		alea=$(echo $((1 + RANDOM % 100)))
        		if [[ $alea -le 50 ]]; then
                		echo "Vous affrontez un Stalfos !"
                		nameMob="Stalfos"
        		else
                		echo "Vous affrontez un Darknuts !"
                		nameMob="Darknuts"
        		fi
		else
        		alea=$(echo $((1 + RANDOM % 100)))
        		if [[ $alea -le 50 ]]; then
                		echo "Vous affrontez un Lynel !"
                		nameMob="Lynel"
        		else
                		echo "Vous affrontez un Guardian !"
                		nameMob="Guardian"
        		fi
		fi
		while IFS=',' read -r idMob nameM hpMob mpMob strMob intMob defMob resMob spdMob luckMob raceMob classMob rarityMob; do
        		if [[ $nameMob == $nameM ]]; then
				floorMobHpInit=$hpMob
				floorMobHp=$hpMob
				floorStr=$strMob
				echo "Le mob à "$floorMobHp"PV et occasionne "$floorStr"DG !"
        		fi
		done < enemies.csv
#2.1.1)positionnement dans le donjon :

                echo "$name tu es a l'etage $floor, tu as $hp PV et tu occasionnes $strInit DG par attaque."
                while [[ $hp -gt "0" && $floorMobHp -gt "0" ]]; do

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
                                echo "$nameMob t'as occasionné $floorMobStr DG "
                                hp=$(( $hp - $floorStr ))
                                if [[ $floorHp -gt "0" ]]; then
                                        hp=$(( $hp - $floorStr ))
                                fi
                        elif [[ $action == "s" ]]; then
                                echo "Tu soigne $(( $hpInit/2 )) PV"
                                hp=$(( $hp + $hpInit/2 ))
                                if [[ $hp -gt $hpInit ]]; then
                                        hp=$hpInit
                                fi
                                echo "$nameMob t'as occasionné $floorStr DG "
                                echo "$nameMob t'as occasionné $floorStr DG "
                                if [[ $floorHp -gt "0" ]]; then
                                        hp=$(( $hp - $floorStr ))
                                fi
                        else
                                echo "Les seuls reponses admises sont attaque ou soing."
                        fi
                done
                clear
                if [[ $hp -gt "0" ]]; then
                        echo "====================== etage : $floor WIN ======================"
                fi
                floor=$(( floor + 1 ))
                floorMobHp=$floorMobHpInit
        fi
        if [[ $floor -eq "10" ]]; then
                echo -e "$name tu es arriver a l'etage $floor, tu as $hp HP et...\nUn bruit de pas lourd fait raisonner les esqualiers menant aux 10éme etage.\nIl est la ,le grand Ganondorf"
                while [[ $hp -gt "0" && $ganonHp -gt "0" ]]; do
                        echo "etage : BOSS "
                        echo "PV de $name : $hp =================================== PV de Ganondorf : $ganonHp"
                        echo "Rox de $name : $strInit =================================== Rox du Ganondorf : $ganonStr"
                        echo "Â toi de jouer : "
                        echo "Quelle action veux-tu faires, attaquer ou te soigner (attaque/soing) :"
                        read action
                        if [[ $action == "attaque" ]]; then
                                hp=$(( $hp - $ganonStr ))
                                if [[ $ganonHp -gt "0" ]]; then
                                        ganonHp=$(( $ganonHp - $strInit ))
                                fi
                        elif [[ $action == "soing" ]]; then
                                hp=$(( $hp + $hpInit/2 ))
                                if [[ $ganonHp -gt "0" ]]; then
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
if [[ $hp -lt "0" ]]; then
        echo "====================== etage : $(( $floor - 1 )) YOU LOSE ======================"
else
        echo "====================== YOU WIN ======================"
fi

