#!/bin/bash
handle_interrupt() {
    echo
    echo -n "$misterioso> "; sleep 2; escribe_como_humano "¿Así que quieres irte? Muy bien, cierra al salir"
    sleep 1
    exit 1
}

escribe_como_humano() {
    local IFS=
    local mensaje=$1
    local velocidad=0.04

    for (( i=0; i<${#mensaje}; i++ )); do
        echo -n "${mensaje:$i:1}"
        sleep $velocidad
    done
    echo
}

pregunta() {
    local IFS=
    local autor=$1
    local usuario=$2
    local enunciado=$3
    local correcta=$4
    echo -n "$autor> "; escribe_como_humano $enunciado
    read -p "$usuario> " respuesta
    if [ $respuesta != $correcta ]; then
        echo -n "$autor> "
        escribe_como_humano "Respuesta incorrecta. Adiós"
        sleep 1
        exit 1
    fi
}

trap handle_interrupt SIGINT

misterioso='?????'

echo -n "$misterioso> "; escribe_como_humano "¿Quién eres?"
read -p "> " nombre

echo -n "$misterioso> "; escribe_como_humano "$nombre, ya veo... Supongo que te envía Richard, ¿es así?"
read -p "$nombre> " respuesta
respuesta=${respuesta,,}

case $respuesta in
    sí|si|s)
        echo -n "$misterioso> "; escribe_como_humano "Está bien, pero Richard no enviaría a cualquiera arriesgándose a que sea un secuaz de M$"
        echo -n "$misterioso> "; escribe_como_humano "Veamos lo que sabes de Linux"
        ;;
    *)
        echo -n "$misterioso> "
        escribe_como_humano "Entonces no se te ha perdido nada aquí. Adiós"
        sleep 1
        exit 1
        ;;
esac

pregunta "$misterioso" $nombre "¿Qué comando usarías para ver el contenido de un directorio?" "ls"
pregunta "$misterioso" $nombre "Muy bien. ¿Y qué comando usarías para ver el contenido de un fichero?" "cat"

echo -n "$misterioso> "; escribe_como_humano "Perfecto, parece que Richard eligió a la persona adecuada"
echo -n "$misterioso> "; escribe_como_humano "Encantado de conocerte, $nombre. Me llamo Linus"; sleep 2
misterioso='Linus'
echo -n "$misterioso> "; escribe_como_humano "No hace falta que digas nada, no hay tiempo que perder"
echo -n "$misterioso> "; escribe_como_humano "Te doy acceso al sistema y me voy, M$ me está buscando"
echo -n "$misterioso> "; sleep 2; escribe_como_humano "Esto no es un adiós"; sleep 3
clear

touch ~/.test_passed
sed -i "s/#NOMBRE#/$nombre/g" ~/leeme.txt