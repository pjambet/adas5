with Mot, Couple, Liste_Couple,Triplet, Liste_Triplet, Ada.Text_IO;
use Mot, Couple, Liste_Couple,Triplet, Liste_Triplet, Ada.Text_IO;

package Text_Stat is
   --Ce paquetage permet d'effectuer des opérations "statistiques" sur le texte analysé
   --nombre total de mots, nombre de mots de longueur supérieur ou égale a un entier positif donné,
   --longueur moyenne d'un mot, et surement d'autres plus tard

   use Liste_Couple.L;
   use Liste_Triplet.Lt;
   
   function Num_Mot_Tot(L : TListe_Couple) return Integer;
   --Calcule le nombre total de mot du texte

   function Num_Mot_Tot(L : TListe_Triplet) return Integer;
   --Calcule le nombre total de mot du texte

   function Num_Occ_Moy(L : TListe_Couple) return Float;
   --Calcule le nombre d'occurence moyen a partir de la liste obtenu des mots
   --dans le texte

   function Num_Occ_Moy(L : TListe_Triplet) return Float;
   --Calcule le nombre d'occurence moyen a partir de la liste obtenu des mots
   --dans le texte(se base sur la somme des occurences dans les 2 textes pour chaque mot)

   function Long_Moy(L : TListe_Couple) return Float;
   --Calcule la longueur moyenne d'un mot dans le texte

   function Long_Moy(L : TListe_Triplet) return Float;
   --Calcule la longueur moyenne d'un mot dans le texte

   function Num_Mot_Sup(L : TListe_Couple; N : Integer) return Integer;
   --Calcule le nombre de mot dont la longueur est supérieur ou égale a un entier positif donné
   
   function Num_Mot_Sup(L : TListe_Triplet; N : Integer) return Integer;
   --Calcule le nombre de mot dont la longueur est supérieur ou égale a un entier positif donné


end Text_Stat;
