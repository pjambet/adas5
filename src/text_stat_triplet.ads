with Liste_Triplet, Arbre_Binaire_Triplet;
use Liste_Triplet, Arbre_Binaire_Triplet;

package Text_Stat_Triplet is
   
   --Ce paquetage permet d'effectuer des opérations "statistiques" sur le texte analysé
   --nombre total de mots, nombre de mots de longueur supérieur ou égale a un entier positif donné,
   --longueur moyenne d'un mot, et surement d'autres plus tard

   function Num_Mot_Tot(L : TListe_Triplet) return Integer;
   --Calcule le nombre total de mot du texte

   function Num_Occ_Moy(L : TListe_Triplet) return Float;
   --Calcule le nombre d'occurence moyen a partir de la liste obtenu des mots
   --dans le texte

   function Long_Moy(L : TListe_Triplet) return Float;
   --Calcule la longueur moyenne d'un mot dans le texte

   function Num_Mot_Sup(L : TListe_Triplet; N : Integer) return Integer;
   --Calcule le nombre de mot dont la longueur est supérieur ou égale a un entier positif donné

   function Num_Mot_Tot(A : TABR_Triplet) return Integer;
   --Calcule le nombre total de mot du texte

   function Num_Occ_Moy(A : TABR_Triplet) return Float;
   --Calcule le nombre d'occurence moyen a partir de la liste obtenu des mots
   --dans le texte

   function Long_Moy(A : TABR_Triplet) return Float;
   --Calcule la longueur moyenne d'un mot dans le texte

   function Num_Mot_Sup(A : TABR_Triplet; N : Integer) return Integer;
   --Calcule le nombre de mot dont la longueur est supérieur ou égale a un entier positif donné

end Text_Stat_Triplet;
