with Liste_Couple, Arbre_Binaire_Couple;
use Liste_Couple, Arbre_Binaire_Couple;

package Text_Stat_Couple is

   --use Arbre_Binaire_Couple.AB;
   --Ce paquetage permet d'effectuer des opérations "statistiques" sur le texte analysé
   --nombre total de mots, nombre de mots de longueur supérieur ou égale a un entier positif donné,
   --longueur moyenne d'un mot, et surement d'autres plus tard

   function Num_Mot_Tot(L : TListe_Couple) return Integer;
   --Calcule le nombre total de mot du texte

   function Num_Occ_Moy(L : TListe_Couple) return Float;
   --Calcule le nombre d'occurence moyen a partir de la liste obtenu des mots
   --dans le texte

   function Long_Moy(L : TListe_Couple) return Float;
   --Calcule la longueur moyenne d'un mot dans le texte

   function Num_Mot_Sup(L : TListe_Couple; N : Integer) return Integer;
   --Calcule le nombre de mot dont la longueur est supérieur ou égale a un entier positif donne
   

   -----------ARBRES------------------------------------
   function Num_Mot_Tot(A : TABR_Couple) return Integer;
   --Calcule le nombre total de mot du texte

   function Num_Occ_Moy(A : TABR_Couple) return Float;
   --Calcule le nombre d'occurence moyen a partir de la liste obtenu des mots
   --dans le texte

   function Long_Moy(A : TABR_Couple) return Float;
   --Calcule la longueur moyenne d'un mot dans le texte

   function Num_Mot_Sup(A : TABR_Couple; N : Integer) return Integer;
   --Calcule le nombre de mot dont la longueur est supérieur ou égale a un entier positif donne



end Text_Stat_Couple;
