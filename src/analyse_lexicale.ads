with Text_Stat; use Text_Stat;

package Analyse_lexicale is
	--Package permettant d'analyser le texte et d'effectuer les requetes dessus

	function query_liste_couple return liste;
	--Renvoit une liste comprenant tous les couples(mot;occurence) du texte, la
	--liste est triée par ordre alphabetique

	function query_NbOcc(l: liste; m: T_Mot) return Integer;
	--Requete renvoyant le nombre d'occurence du mot m dans le texte

	procedure query_NbPref(l: in liste; s: in T_Mot; nbMot: out Integer; nbOcc: out Integer);
	--Requete renvoyant le nombre de mot ayant s pour préfixe et le nombre d'occurence de s (Appel de query_NbOcc(s))

	procedure query_NbSuff(l: in liste; s: in T_Mot; nbMot: out Integer; nbOcc: out Integer);
	--Requete renvoyant le nombre de mot ayant s pour suffixe et le nombre d'occurence de s	(Appel de query_NbOcc(s))

	procedure query_NbFact(l: in liste; s: in T_Mot; nbMot: out Integer; nbOcc: out Integer);
	--Requete renvoyant le nombre de mot ayant s pour facteur et le nombre d'occurence de s (Appel de query_NbOcc(s))
      
      procedure Creer_Fichier_Listemot(L: in Liste);
      --Procedure qui crée le fichier listeMot a partir de la liste de couple l
      --Le Fichier créé est de la forme suivante
      ------------------------------------------
      --Mot1 Nbocc1
      --Mot2 NbOcc2
      --etc ...
      ------------------------------------------
      
      procedure Recup_Liste(L: out Liste);
      --procedure qui recrée la liste de couple a partir du fichier "liste-mot.txt" 
      --le fichier n'est pas passé en parametre car il sera créé auparavant par la fonction Creer_Fichier_Listemot
      --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
      --declenche une exception si le fichier n'existe pas
   
end Analyse_lexicale;

