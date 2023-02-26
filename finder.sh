#!/bin/zsh

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function ctrl_c(){
echo -e "\n\n${redColour}[!] Saliendo...${endColour}\n"
exit 1
}

# Ctrl+C
trap ctrl_c INT

buscarpornombre(){

cantidadasumar=10
firstline=$(cat bundle.js | grep -n $1 | head -n 1 | tr ":" " "|awk '{print $1}')
endline=$(($firstline+$cantidadasumar))

for i in $(seq $firstline $endline);do
echo -e "\n\n${blueColour}$(sed -n ${i}p bundle.js)${endColour}\n" | awk '{print $2$3}' | xargs 2>/dev/null | grep -v id | grep -v crypto | grep -v lf | grep -v resuelta | grep -v "{" | grep -v like | tr "," " "
done
}

buscarpordificultad(){

cantidadarestar=4
for i in $(cat bundle.js | grep -n $1 | grep dificultad | awk '{print $1}' | tr ":" " ");do
primeralinea=$(($i-5))
ultimalinea=$(($primeralinea+10))
for o in $(seq $primeralinea $ultimalinea);do
echo -e "\n\n${blueColour}$(sed -n ${o}p bundle.js)${endColour}\n" | awk '{print $2$3}' | xargs 2>/dev/null | grep -v id | grep -v crypto | grep -v lf | grep -v "}" | grep -v like | grep -v resuelta | tr "," " "
done
done
}

buscarporsistema(){

cantidadarestar=4
for i in $(cat bundle.js | grep -n $1 | grep so | awk '{print $1}' | tr ":" " ");do
primeralinea=$(($i-$cantidadarestar))
ultimalinea=$(($primeralinea+10))
for o in $(seq $primeralinea $ultimalinea);do
echo -e "\n\n${blueColour}$(sed -n ${o}p bundle.js)${endColour}\n\n" | awk '{print $2$3}' | xargs 2>/dev/null | grep -v id | grep -v crypto | grep -v lf | grep -v "}" | grep -v like | grep -v resuelta | tr "," " "
done
done
}


if [[ $1 = "-n" ]]
then
	buscarpornombre $2
elif [[ $1 = "-d" ]]
then
	buscarpordificultad $2
elif [[ $1 = "-s" ]]
then
	buscarporsistema $2
else
	echo -e "${blueColour}\n\n[+]Uso: \n-n (nombre de la maquina) \n-d (Dificultad de las maquinas)\n\n${endColour}"
fi
