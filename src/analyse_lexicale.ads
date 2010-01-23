with Liste_Couple, Liste_Triplet, Trie;
use Liste_Couple, Liste_Triplet, Trie;

package Analyse_Lexicale is

   function CaractereAutorise (C : in Character) return Boolean;
   function Existe (Name : in String) return Boolean;

   procedure Query_Liste_Couple (L : in out TListe_Couple; NomFic : in String);
   --Renvoit une liste comprenant tous les couples(mot;occurence) du texte, la
   --liste est triée par ordre alphabetique
   --je pense qu'il faudrait faire qu'on parcourt tout le texte
   --et qu'a chaque mot trouvé on l'insere de maniere triéee dans la liste qu'on renvoit
   --si on le trouve dans la liste alors on fait juste augmenter le nbOcc

   procedure Creer_Fichier_Listemot (L : in TListe_Couple);
   --Procedure qui crée le fichier "liste-mot.txt" a partir de la liste de couple l
   --Le Fichier créé est de la forme suivante
   --Mot1 Nbocc1
   --Mot2 NbOcc2

   procedure Recup_Liste (L : in out TListe_Couple);
   --procedure qui recrée la liste de couple a partir du fichier "liste-mot.txt"
   --le fichier n'est pas passé en parametre car il sera créé auparavant par la fonction Creer_Fichier_Listemot
   --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
   --declenche une exception si le fichier n'existe pas
   
   procedure Query_Liste_Triplet_Txt1 (L : in out TListe_Triplet; NomFic : in String);
   procedure Query_Liste_Triplet_Txt2 (L : in out TListe_Triplet; NomFic : in String);

   function Query_NbOcc_Txt1 (L : TListe_Triplet; M : String) return Integer;
   --Requete renvoyant le nombre d'occurence du mot m dans le texte 1

   function Query_NbOcc_Txt2 (L : TListe_Triplet; M : String) return Integer;
   --Requete renvoyant le nombre d'occurence du mot m dans le texte 2

   procedure Creer_Fichier_Listemot_T (L : in TListe_Triplet);
   --Procedure qui crée le fichier liste-mot.txt-y a partir de la liste de triplet l
   --Le Fichier créé est de la forme suivante
   --Mot1 NboccTxt1 NbOccTxt2
   --Mot2 NbOccTxt1 NbOccTxt2

   procedure Recup_Liste_T (L : in out TListe_Triplet);
   --procedure qui recrée la liste de couple a partir du fichier "liste-mot-t.txt"
   --le fichier n'est pas passé en parametre car il sera créé auparavant par la fonction Creer_Fichier_Listemot_T
   --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
   --declenche une exception si le fichier n'existe pas

   procedure AffichageN_T (L : in TListe_Triplet; N : in Integer);
   -- affiche les N premiers mots de la liste   
   
   procedure Query_Intersection (T : in TListe_Triplet);
   -- affiche les mots communs de deux auteurs

   procedure Query_Difference (T : in TListe_Triplet);
   -- affiche les mots d'un auteur et pas de l'autre (et vice versa)
   
   procedure Query_Trie_Txt1 (T : in out T_Trie; NomFic : in String);
   --Renvoit un trie comprenant tous les mots et occurences du texte
   procedure Query_Trie_Txt2 (T : in out T_Trie; NomFic : in String);

   procedure Creer_Fichier_Trie_Txt1 (T : in T_Trie);
   --Procedure qui crée le fichier "liste-mot.txt" a partir du trie T
   --Le fichier créé est de la forme suivante
   --Mot1 Nbocc1
   --Mot2 NbOcc2
   procedure Creer_Fichier_Trie_Txt2 (T : in T_Trie);
   
   procedure Recup_Trie_Txt1 (T : in out T_Trie);
   --procedure qui recrée le trie a partir du fichier "liste-mot.txt"
   --le fichier n'est pas passé en parametre car il sera créé auparavant par la fonction Creer_Fichier_Listemot
   --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
   --declenche une exception si le fichier n'existe pas

   procedure Recup_Trie_Txt2 (T : in out T_Trie);
   
   procedure AffichageN(L : in TListe_Couple; N : in Integer);
   -- affiche les N premiers mots de la liste 
   
end Analyse_Lexicale;
