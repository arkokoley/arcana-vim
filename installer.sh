mkdir $HOME/tmp-arcana

cd $HOME/tmp-arcana

git clone https://github.com/arkokoley/arcana-vim .

./bootstrap.sh 

cd ..
rm -r -f tmp-arcana
