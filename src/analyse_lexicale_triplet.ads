with Liste_Triplet;
use Liste_Triplet;

package Analyse_Lexicale_Triplet is --Package permettant d'analyser le texte et d'effectuer les requetes dessus

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
      
end Analyse_Lexicale_Triplet;
