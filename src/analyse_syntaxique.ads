with Mot;use Mot;
package Analyse_Syntaxique is
   --Surement le package principal qui permettra d'analyser le texte et
   --d'effectuer les requetes dessus
   
   procedure lecture_texte(texte);
   --Procedure qui permet de lire un texte et de filtrer les mots significatifs

   function query_liste_couple(texte) return liste;
   --Renvoit une liste comprenant tous les couples(mot;occurence) du texte, la
   --liste est triée par ordre alphabetique

   procedure affiche_liste(l: liste);
   --affiche les n premiers elements de la liste, n est saisie au clavier par
   --l'utilisateur

   procedure fusion(l: liste;m1: T_Mot;m2: T_Mot);
   --fusionne le mot m2 dans m1, m2 est supprimé de la liste
   
   function query_occ_mot(m: T_Mot) return Integer;
   --Requete renvoyant le nombre d'occurence du mot m dans le texte

   function query_numb_pref(s: T_Mot) return Integer;
   --Requete renvoyant le nombre d'occurence de mot ayant s pour prefixe
   
   --En fait ca j'ai pas bien compris ...
   function query_occ_pref(s: T_Mot) return Integer;
   --Requete renvoyant le nombre d'occurence du mot s dans le texte
    
   function query_numb_suff(s: T_Mot) return Integer;
   --Requete renvoyant le nombre d'occurence de mot ayant s pour suffixe

   --En fait ca j'ai pas bien compris ...
   function query_occ_suff(s: T_Mot) return Integer;
   --...
   
   function query_num_fact(s: T_Mot) return Integer;
   --Requete renvoyant le nombre d'occurence de mot ayant s pour facteur

   --En fait ca j'ai pas bien compris ...
   function query_occ_fact(s: T_Mot) return Integer;
   --...


end Analyse_Sy  ntaxique;
