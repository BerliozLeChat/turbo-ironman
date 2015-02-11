/*
Auteur : François Hallereau
Date : 10 février 2015
Licence 3 informatique
Université de Nantes
*/

#déclarations des ensembles utilisés

/*
une tranche horaire couvre 2h
la première commence à 6h
*/

param lastTranche; #indice de la dernière tranche horaire
set Horaires :=0..lastTranche; #ensemble de tranche horaires

param minNurses{Horaires}; #nombre minimal d'infirmières par tranche horaire

var nurses{Horaires} >=0 integer; #nombre d'infirmière commençant leur journée à une tranche horaire
var nursesSup{Horaires} >=0 integer; #nombre d'infirmière commençant leur journée à une tranche horaire

#fonction objective

minimize profit : sum{i in Horaires}nurses[i];

#Les contraintes
s.t. ctr_Sup{i in Horaires} : nursesSup[i]<=nurses[i];
s.t. ctr_Nurses{i in Horaires} :  nurses[i]+nurses[(i+11)mod(12)]+nurses[(i+9)mod(12)]+nurses[(i+8)mod(12)]+nursesSup[(i+7)mod(12)]>= minNurses[i];
s.t. ctr_Total : sum{i in Horaires}nurses[i]<=80;

# Résolution (qui est ajoutée en fin de fichier si on ne le précise pas)
	solve;

# Affichage des résultats
	display : nurses;	# affichage des variables
	display : nursesSup;	# affichage des variables
	display : 'z=',sum{i in Horaires}nurses[i]; # affichage de la valeur optimale
