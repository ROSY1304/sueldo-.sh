echo "Favor de ingresar los siguientes datos"
echo "Ingrese su Nombre"
read nom
echo "Ingrese su direccion"
read direccion
echo "Ingrese su puesto de trabajo"
read puestoTrabajo
echo "Ingrese su sueldo semanal"
read sueldoSemanal
echo "Ingrese los dias trabajados"
read diasTrabajados
echo "Ingrese las horas extras trabajadas"
read horasExtra

sueldoDia=`expr $sueldoSemanal \/ 7`
sueldoHora=`expr $sueldoDia \/ 8`

if [ $horasExtra -ge 0 ] && [ $horasExtra -le 7 ]
	then
	sueldoHorasDobles=`expr $horasExtra \* $sueldoHora \* 2`
	sueldoHorasTriples=`expr $horasExtra \* 0`
else if [ $horasExtra -ge 8 ] 
	then
	horasTriples=`expr $horasExtra \- 8`
	sueldoHorasDobles=`expr $sueldoHora \* 2 \* 8`
	sueldoHorasTriples=`expr $horasTriples \* $sueldoHora \* 3 `
else 
	""
fi
fi

sueldoHorasExtra=`expr $sueldoHorasDobles \+ $sueldoHorasTriples`
sueldoDiasTrabajados=`expr $sueldoDia \* $diasTrabajados`
sueldoTotal=`expr $sueldoDiasTrabajados \+ $sueldoHorasExtra`
cuotaSindical=`expr $sueldoTotal \* 2 \/ 100`

if [ $sueldoTotal -ge 0 ] && [ $sueldoTotal -le 2500 ]
	then
	deduccionISPT=`expr $sueldoTotal \* 6 \/ 100`
else if [ $sueldoTotal -ge 2501 ]
	then
	deduccionISPT=`expr $sueldoTotal \* 7 \/ 100`
else
	""
fi
fi

if [ $sueldoTotal -ge 0 ] && [ $sueldoTotal -le 3000 ]
	then
	deduccionIMSS=`expr $sueldoTotal \* 3 \/ 100`
else if [ $sueldoTotal -ge 3001 ]
	then
	deduccionIMSS=`expr $sueldoTotal \* 4 \/ 100`
else
	""
fi
fi

totalDeducciones=`expr $deduccionISPT \+ $deduccionIMSS \+ $cuotaSindical`
sueldoTotalFinal=`expr $sueldoTotal \- $totalDeducciones`

echo "Empleado: $nom "
echo "Direccion del empleado: "$direccion
echo "Puesto de trabajo: "$puestoTrabajo
echo ".::Pagos y deducciones del Empleado::."
echo "_____________________________________________________"
echo "Sueldo por dias trabajados: "$sueldoDiasTrabajados
echo "Sueldo por horas Extra: "$sueldoHorasExtra
echo "Sueldo sin deducciones: "$sueldoTotal
echo "_____________________________________________________"
echo "Deduccion ISPT: "$deduccionISPT
echo "Deduccion IMSS: "$deduccionIMSS
echo "Deduccion cuota sindical: "$cuotaSindical
echo "Deducciones totales: "$totalDeducciones
echo "_______________________________________________________"
echo "Sueldo total tras deducciones: "$sueldoTotalFinal

