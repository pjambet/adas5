-- #################################################################################
-- #                                                                               #
-- #   Nom : text_stat.ads                                                         #
-- #   Auteur : DREYER Quentin                                                     #
-- #   Date de création : 06/12/2009                                               #
-- #   Date de modification : 25/01/2010                                           #   
-- #                                                                               #
-- #################################################################################

--Ce paquetage permet d'effectuer des opérations "statistiques" sur le texte analysé
--nombre total de mots, nombre de mots de longueur supérieur ou égale a un entier positif donné,
--longueur moyenne d'un mot
--La majorité des fonctions ont été surchargés afin d'etre utilisable sur nos trois
--structures de données

with Liste_Couple, Liste_Triplet, Arbre_Binaire_Couple, Arbre_Binaire_Triplet, Trie;
use Liste_Couple, Liste_Triplet, Arbre_Binaire_Couple, Arbre_Binaire_Triplet, Trie;

package Text_Stat is
   
   function Div_Float(N : in Integer; M : in Integer) return Float;
   --Effecture la division reelle de N par M

   -- #################################################################################
   
   -- Calcule le nombre total de mot du texte
   
   function Num_Mot_Tot (L : TListe_Couple) return Integer;
   function Num_Mot_Tot (L : TListe_Triplet) return Integer;  
   function Num_Mot_Tot (A : TABR_Couple) return Integer;
   function Num_Mot_Tot (A : TABR_Triplet) return Integer;
   procedure Num_Mot_Tot_Txt1 (T : in T_Trie; S : in out Integer);
   procedure Num_Mot_Tot_Txt2 (T : in T_Trie; S : in out Integer);
   
   -- #################################################################################

   -- Calcule le nombre d'occurence moyen a partir de la liste obtenu des mots dans le texte
   -- Le parametre N correspond au nombre de mot total de la structure

   function Num_Occ_Moy (L : TListe_Couple) return Float;
   function Num_Occ_Moy (L : TListe_Triplet) return Float;
   function Num_Occ_Moy (A : TABR_Couple; N : Integer) return Float;   
   function Num_Occ_Moy (A : TABR_Triplet; N : Integer) return Float;
   function Num_Occ_Moy_Txt1 (T : T_Trie; N : Integer) return Float;
   function Num_Occ_Moy_Txt2 (T : T_Trie; N : Integer) return Float;

   -- #################################################################################
   
   -- Calcule la longueur moyenne d'un mot dans le texte
   
   function Long_Moy (L : TListe_Couple) return Float;
   function Long_Moy (L : TListe_Triplet) return Float;
   function Long_Moy (A : TABR_Couple; N : Integer) return Float;
   function Long_Moy (A : TABR_Triplet; N : Integer) return Float;
   function Long_Moy_Txt1 (T : T_Trie; N : Integer) return Float;
   function Long_Moy_Txt2 (T : T_Trie; N : Integer) return Float;

   -- #################################################################################
   
   -- Calcule le nombre de mot dont la longueur est supérieur ou égale a un entier positif donne
   
   function Num_Mot_Sup(L : TListe_Couple; N : Integer) return Integer;
   function Num_Mot_Sup(A : TABR_Couple; N : Integer) return Integer;
   function Num_Mot_Sup(L : TListe_Triplet; N : Integer) return Integer;
   function Num_Mot_Sup(A : TABR_Triplet; N : Integer) return Integer;
   procedure Num_Mot_Sup_Txt1 (T : in T_Trie; N : Integer; S : in out Integer);
   procedure Num_Mot_Sup_Txt2 (T : in T_Trie; N : Integer; S : in out Integer);        

end Text_Stat;
