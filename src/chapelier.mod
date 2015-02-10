/*
Auteur : François Hallereau
Date : 10 février 2015
Licence 3 informatique
Université de Nantes
*/

#déclarations des ensembles utilisés

param lastAtelier; #indice du dernier atelier
set Ateliers :=1..lastAtelier; #ensemble d'atelier

param lastCasquette; #indice de la dernière casquette
set Casquettes := 1..lastCasquette; # ensemble des casquettes

var productionCasquette{Casquettes}>=0 integer; #nombre de casquettes produite

param profitCasquette{Casquettes}; #profit réalisé par casquette

param heures{Ateliers}; #heures disponibles pour chaque atelier

param duree{Ateliers,Casquettes}; #coefficient des opérations pour chaque atelier


# fonction objective

maximize profit : sum{i in Casquettes} productionCasquette[i]*profitCasquette[i];

#les contraintes

s.t. ctr_Ateliers{i in Ateliers} : sum {j in Casquettes} productionCasquette[j]*duree[i,j] <= heures[i];


# Résolution (qui est ajoutée en fin de fichier si on ne le précise pas)
	solve;

# Affichage des résultats
	display : productionCasquette;	# affichage des variables
	display : 'z=',sum{i in Casquettes} productionCasquette[i]*profitCasquette[i]; # affichage de la valeur optimale
