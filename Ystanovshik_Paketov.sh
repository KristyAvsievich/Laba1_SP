#!/bin/bash

echo "Автор: Авсиевич Кристина"
echo "Название скрипта: Установщик пакетов"
echo "Описание: Скрипт может проверять, установлен ли указанный пакет, либо может его поставить"

while [[ $vybor != "n" ]]
do
	echo -e "\nВведите название интересующего Вас пакета"
	read name
	if [[ $name != "" ]]
	then
		otvet=`yum list installed $name`
		if [[ $otvet == *"Installed Packages"* ]]
		then 
			yum info $name
		else
			echo -e "\nДанный пакет не установлен\n"
			yum install $name --downloadonly -y
			echo -e "\n\nХотите ли Вы установить или выйти? (i - установить/e - выйти)"
			read reshenie
			if [[ $reshenie = "i" ]]
			then
				yum install $name -y
			else
				if [[ $reshenie = "e" ]]
				then
					exit 0
				fi
			fi
		fi	
	else
		echo "Имя пакета не может быть пустым!"
	fi


	echo -e "\nХотите ли Вы продолжить? (y/n)"
	read vybor
	if [[ $vybor != "y" && $vybor != "n" ]]
	then 
		echo "Вас не понять. Начнем сначала."
	fi
done
exit 0
