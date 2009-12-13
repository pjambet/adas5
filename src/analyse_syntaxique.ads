with Text_Stat; use Text_Stat;

package Analyse_Syntaxique is
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

end Analyse_Syntaxique;

