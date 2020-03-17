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
		otvet = yum list installed $name
		if [[ $otvet == *"Installed Packages"* ]]
		then 
			yum info $name
		else
			echo "Данный пакет не установлен"
			yum search $name
			yum install $name -y
			exit 0
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
