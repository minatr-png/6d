if [ $# -gt 0 ]; then

	accesos=0
	mayLoginInt=99999999
	vacio=0

	for nombres in $(cat usuarios.txt | awk '{print $2}'); do
		
		if [[ $nombres == $1* ]]; then
		
			 echo "$nombres" >> resultado.txt
			 
			 acceso=`cat usuarios.txt | grep $nombres | awk '{print $3}'`
			 accesos=$(($accesos+acceso))
			 
			 if [ $acceso -lt $mayLoginInt ]; then
			 
				mayLoginInt=$acceso
				mayLoginString=$nombres
				vacio=1
				
			 fi
		
		fi

	done

	if [ $vacio -eq 1 ]; then

		echo "La cantidad de accesos por usuarios que empiezan por ’$1’ es: $accesos"

		echo "El login que empieza por ’$1’ y que tiene menos accesos es: $mayLoginString"
		
	else
		
		echo "No hay ningún login que empiece por $1"
		
	fi
	
else

	echo "Debes ded introducir 1 argumento"

fi

