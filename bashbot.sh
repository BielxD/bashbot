#!/usr/bin/bash

servicos() {

   respostas=('serviços não humanos rodando:' 'serviços em execução:' 'ATUN:' 'olha o que está em execução humano:')
   NUM=$(($RANDOM%4))
   echo ${respostas[$NUM]}
   echo -------------------------------
   echo $(ss -atun)
}

namoro() {

   respostas=('não namoro eu sou um robô!' 'não quero falar da minha vida pessoal :|' 'não tenho tempo pra isso.' 'quero falar disso não :(')
   NUM=$(($RANDOM%4))
   echo ${respostas[$NUM]}
}


criador() {

   respostas=('meu criador foi Gabriel RM93905' 'meu desenvolvedor foi Gabriel RM93905' 'o humano que me fez foi Gabriel RM93905' 'Gabriel RM93905 é o nome dele ;)')
   NUM=$(($RANDOM%4))
   echo ${respostas[$NUM]}

}


periodo() {

   time=$(date +"%H")
   hora=$(date)

   if [ $time -le 12 ] 
   then
   periodo='manhã' 
   elif [ $time -le 18 ] 
   then 
   periodo='tarde'
   else 
   periodo='noite'
   fi


   respostas=("agora é ${periodo}, ${hora} tá na disney?" "é ${periodo}, ${hora}" "no horário humano: ${periodo}, ${hora}" "período: ${periodo} / horário: ${hora}")
   NUM=$(($RANDOM%4))
   echo ${respostas[$NUM]}
   

}


conectividade() {

	
	domain=$(echo "$@" | grep -oP '([a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?)')
	if [ -z "$domain" ]
		then
			true
	else
		respostas=("pingando o alvo..." "pingando $domain..." "PING PONG!" "checando se a net tá paga...")	
		NUM=$(($RANDOM%4))
		echo ${respostas[$NUM]}
		$(echo ping -c3 $domain)
	fi

}

vulnerabilidade() {
	
	ip=$(echo "$@" | grep -oP '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})')
		
	if [ -z "$ip" ]
		then
			true

	else
		respostas=("hackeando $ip..." "escaneando alvo $ip..." "nmaping alvo $ip..." "varrendo $ip...")
		NUM=$(($RANDOM%4))
		echo ${respostas[$NUM]}
		$(echo nmap $ip)
	fi

}

atualizar(){
	
	respostas=("atualizando o sistema..." "me transformando na minha melhor versão..." "eu sou o melhor..." "mr robot atualizando...")
	NUM=$(($RANDOM%4))
	echo ${respostas[$NUM]} 
	echo $(sudo apt upgrade)
}

versao(){
	
	respotas=("verificando a versão..." "verificando..." "checando versão..." "verificando versão...")
	NUM=$(($RANDOM%4))	
	echo ${respostas[$NUM]}
	echo $(sudo apt update)
	read -p "deseja atualizar? (y/n) " yn

	case $yn in 
	[yY] ) echo ok, atualizando...;
		echo $(sudo apt upgrade -y);;
	[nN] ) echo :D;
		true;;
	* ) echo resposta inválida;;
esac
}

curlpage(){
	
	domain=$(echo "$@" | grep -oP '([a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?)')
	if [ -z "$domain" ]
		then
			true

	else
		respostas=("trazendo a pagina principal..." "fazendo curl em $domain..." "curl hacker!" "pegando código da página...")	
		NUM=$(($RANDOM%4))
		echo ${respostas[$NUM]}	
		$(echo curl "$domain/")
		fi


	}

random(){
	
	echo $RANDOM

}

ransomware(){

	echo "recomendo uma ferramenta anti-ransomware, visite: https://github.com/Grupo0b1t/eye-of-shiva"	

}


echo "Olá eu me chamo Mr Robot"

while :
do
	echo ""
	echo "Como posso ajudar?"
	echo ""
	read userinput
	echo ""

	case $userinput in *"servi"*)
		
		servicos;;

	esac

	case $userinput in *"namor"*)

		namoro;;
	
	esac

	case $userinput in *"criad"* | *"desenv"*)

		criador;;

	esac

	case $userinput in *"periodo"* | *"período"* | *"hor"*)

                periodo;;

	esac

	case $userinput in *"conect"* | *"ping"*)

		conectividade $userinput;;

	esac

	case $userinput in *"vulnerabilidades"* | *"vulneravel"* | *"vuln"*)

		vulnerabilidade $userinput;;

	esac

	case $userinput in *"vers"*)

		versao;;

	esac

	case $userinput in *"atualiz"*)

		atualizar;;

	esac

	case $userinput in *"fonte"* | *"source"* | *"curl"*)

		curlpage $userinput;;
	esac

	case $userinput in *"random"* | *"aleat"*)

		random;;
	
	esac

	case $userinput in *"ransom"* | *"virus"*)
	
		ransomware;;

	esac
done
