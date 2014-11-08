#!/bin/bash

clear
echo "########## Debut des tests ##########"
for taille_vecteur in 1000 10000 100000 1000000 ; do
	for nb_thread in 1 2 4 8 16 ; do
		./creer_vecteur --size $taille_vecteur > vect1.txt
		temps_tri_sequentiel=$(./tri_sequentiel --time --quiet < vect1.txt)
		temps_tri_thread=$(./tri_threads --parallelism $nb_thread --time --quiet < vect1.txt)
		acceleration=$(echo "scale=4 ; $temps_tri_sequentiel/$temps_tri_thread" | bc)
		echo "$acceleration"
	done
done




