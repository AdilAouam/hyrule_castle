#!/bin/bash                                                                                                                                                                                                 
##### VARIABLE #####

a=1
character=Link
enemy=Bokoblin
boss=Ganon
hpmaxchara=60
hpminchara=0
hpchara=60
strchara=15
hpmaxene=30
hpene=30
strene=5
hpmaxboss=150
hpboss=150
strboss=20
heal=$(($hpmaxchara/2))
hpdiff=$(($hpmaxchara-$hpchara))
healvalue=$(($hpchara+$heal))
choix=$1


echo -e "\n\nWelcome into the tower !\n \n"

##### ETAGE ENEMY #####

while [[ $hpchara -gt 0 ]] && [[ $a -lt 10 ]]; do

##### INTRO COMBAT #####
    
echo -e "======== Fight $a  ========\n"
echo -e "You encounter a "$enemy"!\n"
echo -e ""$enemy"  $hpene / $hpmaxene HP \n"
echo -e ""$character"  $hpchara / $hpmaxchara HP \n"

while [[ $hpene -gt 0 ]] && [[ $hpchara -gt 0 ]]; do
echo -e "\n\n---Options---------- \n"
echo -e "\n1.Attack  2.Heal\n"
read choix

##### OPTION ATTAQUE #####

    if [[ $choix -eq 1 ]]; then
        echo -e "\nYou attacked and dealt "$strchara" damages!\n"
        hpene=$(($hpene-$strchara))
        echo -e ""$enemy"  $hpene / $hpmaxene HP \n"
        if [[ $hpene -gt 1 ]]; then
            echo -e ""$enemy" attacked and dealt "$strene" damages!\n"
            hpchara=$(($hpchara-$strene))
            echo -e ""$character"  $hpchara / $hpmaxchara HP \n"
	elif [[ $hpchara -lt 0 ]]; then
	     hpchara=$hpminchara
        else
            echo -e ""$enemy""" died!\n"
        fi

##### OPTION HEAL #####
	
    elif [[ $choix -eq 2 ]]; then
	echo -e "\nYou used heal!\n"
	if [[ $hpchara -gt $heal ]];then
	    hpchara=$hpmaxchara
	    echo -e ""$character"  "$hpchara" / "$hpmaxchara" HP \n"
	    echo -e ""$enemy" attacked and dealt "$strene" damages!\n"
            hpchara=$(($hpchara-$strene))
	    echo -e ""$character"  $hpchara / $hpmaxchara HP \n\n\n"
	elif [[ $hpchara -lt 0 ]]; then
            hpchara=$hpminchara
	else
	    hpchara=$(($hpchara+$heal))
	    echo -e ""$character"  $hpchara / $hpmaxchara HP \n"
            echo -e ""$enemy" attacked and dealt "$strene" damages!\n"
            hpchara=$(($hpchara-$strene))
	    echo -e ""$character"  $hpchara / $hpmaxchara HP \n\n\n"


         fi
          
           
           
	

    else
	echo -e "\nPlease choose 1 or 2.\n"
    fi
done


if [[ $hpchara -lt 1 ]]; then
            echo -e "You are dead ! Game Over\n"
            echo -e "==== Press Enter to quit ====\n"
            read
	    break

fi

hpene=30
((a+=1))
echo -e "==== Press Enter to continue ====\n\n\n\n\n\n\n\n"
read

done


###### ETAGE BOSS ######

while [[ $a -eq 10 ]]; do

###### INTRO COMBAT #####
    
echo -e "======== Fight $a  ========\n"
echo -e "You encounter "$boss"!\n"
echo -e ""$boss"  $hpboss / $hpmaxboss HP \n"
echo -e ""$character"  $hpchara / $hpmaxchara HP \n"
while [[ $hpboss -gt 0 ]] && [[ $hpchara -gt 0 ]]; do
echo -e "\n\n---Options---------- \n"    
echo -e "\n1.Attack  2.Heal\n"
read choix

##### OPTION ATTAQUE #####

    if [[ $choix -eq 1 ]]; then
        echo -e "\nYou attacked and dealt "$strchara" damages!\n"
        hpboss=$(($hpboss-$strchara))
        echo -e ""$boss"  $hpboss / $hpmaxboss HP \n"
        if [[ $hpboss -gt 1 ]]; then
            echo -e ""$boss" attacked and dealt "$strboss" damages!\n"
            hpchara=$(($hpchara-$strboss))
            echo -e ""$character"  $hpchara / $hpmaxchara HP \n"
	elif [[ $hpchara -lt 0 ]]; then
             hpchara=$hpminchara
        else
            echo -e ""$boss""" died! Congratulation hero !\n"
        fi

##### OPTION HEAL ####

    elif [[ $choix -eq 2 ]]; then
        echo -e "\nYou used heal!\n"
        if [[ $hpchara -gt $heal ]];then
            hpchara=$hpmaxchara
            echo -e ""$character"  "$hpchara" / "$hpmaxchara" HP \n"
            echo -e ""$boss" attacked and dealt "$strboss" damages!\n"
            hpchara=$(($hpchara-$strboss))
            echo -e ""$character"  $hpchara / $hpmaxchara HP \n"
	elif [[ $hpchara -lt 0 ]]; then
             hpchara=$hpminchara
        else
            hpchara=$(($hpchara+$heal))
            echo -e ""$character"  $hpchara / $hpmaxchara HP \n"
            echo -e ""$boss" attacked and dealt "$strboss" damages!\n"
            hpchara=$(($hpchara-$strboss))
            echo -e ""$character"  $hpchara / $hpmaxchara HP \n"
        fi

	
    else
        echo -e "\nPlease choose 1 or 2.\n"
    fi

    
if [[ $hpchara -lt 1 ]]; then
            echo -e "You are dead ! Game Over\n"
            echo -e "==== Press Enter to quit ====\n"
            read
fi


done
((a+=1))


done
