#!/bin/bash

# Utilizzo:
# con il terminare navigare nella cartella contenente gli script
# eseguire il comando chmod +x setup_2.sh delete.sh (necessario solo
# la prima volta)
# eseguire gli scirpt come di seguito
# ./setup_2.sh
# ./delete.sh

##############################################################################
# Questa sezione serve solo a creare un po' di contenuti nella nostra azienda,
# ignorate i comandi qui.
#
# IMPORTANTE: per ragioni che vedremo tra un po' non potete vedere
# i file su cui lavorate all'interno della cartella azienda, ma fidatevi,
# sono effettivamente li!
mkdir azienda vostro_nome paolo
cd azienda 
git init --bare

cd ../vostro_nome
git init
echo "Contenuto del file.txt" > file.txt
git add file.txt
git commit -m "Primo commit per inizializzare il computer dell'azienda."

# Creo il dev branch che mi server per dopo
git branch dev

git push ../azienda main
git push ../azienda dev
rm -rf .git file.txt
cd ..
##############################################################################

cd vostro_nome 
git clone ../azienda
cd azienda
echo "Contenuto di altro_file.txt." >> altro_file.txt
git add altro_file.txt
git commit -m "Aggiunto altro_file.txt alla codebase aziendale."
git push ../../azienda
cd ../../

cd paolo 
git clone ../azienda
cd azienda
echo "Contenuto di codice_brutto.txt." >> codice_brutto.txt
git add codice_brutto.txt
git commit -m "Aggiunto codice_brutto.txt alla codebase aziendale."
git push ../../azienda
cd ../../

cd vostro_nome 
cd azienda
git pull
git branch cambio-nome
git checkout cambio-nome
# Per windows è: rename "codice_brutto.txt" "codice_bello.txt"
mv  codice_brutto.txt codice_bello.txt
git add . # Il punto fa si che aggiungo tutti i file modificati.
git commit -m "Rinominato file."

# Prima mi sposto nel branch 'target'
git checkout dev
# Poi includo un altro branch nel mio branch target
git merge cambio-nome
# Quando faccio il push, specifico che voglio fare l'update
# del branch dev anche nella repository remota
git push ../../azienda dev

echo "Script finished"