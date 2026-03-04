:: setup
mkdir azienda vostro_nome
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
git remote add origin ..\azienda
git push -u origin main

rmdir /s /q .git
del file.txt
cd ..
:: setup

cd vostro_nome 
git clone ../azienda 
cd azienda
echo "Contenuto di altro_file.txt." > altro_file.txt
git add altro_file.txt
git commit -m "Aggiunto altro_file.txt alla codebase aziendale."
git push ../../azienda
cd ..

echo "Script finished"
cmd /k