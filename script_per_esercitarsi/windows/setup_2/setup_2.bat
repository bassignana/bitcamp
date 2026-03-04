:: setup
mkdir azienda vostro_nome paolo
cd azienda 
git init --bare
:: hack per poter usare sempre "main" come nome del branch principale.
:: Se volete approfondire, ne pariliamo.
git symbolic-ref HEAD refs/heads/main

cd ../vostro_nome
git init
echo "Contenuto del file.txt" > file.txt
git add file.txt
git commit -m "Primo commit per inizializzare il computer dell'azienda."
git branch -M main

git branch dev

git remote add origin ..\azienda
git push -u origin main
git push -u origin dev

rmdir /s /q .git 
del file.txt
cd ..
:: setup

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
rename "codice_brutto.txt" "codice_bello.txt"
git add . 
git commit -m "Rinominato file."

:: Prima mi sposto nel branch 'target'
git checkout dev
:: Poi includo un altro branch nel mio branch target
git merge cambio-nome
:: Quando faccio il push, specifico che voglio fare l'update
:: del branch dev anche nella repository remota
git push ../../azienda dev

echo "Script finished"

cmd /k