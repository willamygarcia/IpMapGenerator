#!/bin/bash
clear
echo '#################################### #COBAX TECNOLOGIA #############################################'
echo ''
echo '  # #    #####                                          #######   ###'
echo '  # #   #     #   ####   #####     ##    #    #            #       #'
echo '####### #        #    #  #    #   #  #    #  #             #       #'
echo '  # #   #        #    #  #####   #    #    ##              #       #'
echo '####### #        #    #  #    #  ######    ##              #       #'
echo '  # #   #     #  #    #  #    #  #    #   #  #             #       #'
echo '  # #    #####    ####   #####   #    #  #    #            #      ###'
echo ''
echo 'by Willamy S. Garcia(by N0g0) and by Claudio Carneiro'
echo 'Contact: willamy.t.i@gmail.com'
echo ''
echo '#################################### IpMapGeneration 1.0 ##########################################'
echo ''
echo 'Informe o Prefixo da src-address:'
read prefixo
echo 'Informe o to-address'
read toaddress
echo 'Informe o Range Inicial:'
read rangeInicial
echo 'Informe o Range Final'
read rangeFinal
cont=1
portaInicial=1025
portaFinal=2000
rm relatorioFireIpGeneration.txt
while [ $rangeInicial -le $rangeFinal ]; do
	if [ $portaInicial -eq 1025 ] && [ $portaFinal -eq 2000 ]
	then
		echo 'ip firewall nat add action=src-nat chain=srcnat protocol=udp src-address='$prefixo.$rangeInicial' to-address='$toaddress' to-ports='$portaInicial-$portaFinal >> relatorioIpMapGeneration.txt
		echo 'ip firewall nat add action=src-nat chain=srcnat protocol=tcp src-address='$prefixo.$rangeInicial' to-address='$toaddress' to-ports='$portaInicial-$portaFinal  >> relatorioIpMapGeneration.txt
		portaInicial=1
	else
		portaAtual=$((portaFinal+1))
		portaInicial=$portaAtual
		portaFinal=$(($portaFinal+1000))
		#echo '192.168.0'.$rangeInicial:$portaInicial-$portaFinal
		echo 'ip firewall nat add action=src-nat chain=srcnat protocol=udp src-address='$prefixo.$rangeInicial' to-address='$toaddress' to-ports='$portaInicial-$portaFinal >> relatorioIpMapGeneration.txt
                echo 'ip firewall nat add action=src-nat chain=srcnat protocol=tcp src-address='$prefixo.$rangeInicial' to-address='$toaddress' to-ports='$portaInicial-$portaFinal >> relatorioIpMapGeneration.txt
		if [ $portaFinal -ge 65000 ]
		then
			echo 'Informe um Novo To-Address'
			read toaddress
			portaInicial=1025
			portaFinal=2000
		fi
	fi

	rangeInicial=$((rangeInicial+cont))

done
cat relatorioIpMapGeneration.txt
echo 'Execução Finalizada'
echo 'Um relatorio.'

