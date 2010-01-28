-- #################################################################################
-- #                                                                               #
-- #   Nom : triplet.ads                                                           #
-- #   Auteur : JAMBET Pierre                                                      #
-- #   Date de création : 10/01/2010                                               #
-- #   Date de modification : 19/01/2010                                           #   
-- #                                                                               #
-- #################################################################################

-- Le type T_Triplet est un agrégat d'un T_Mot, d'un entier représentant le nombre d'occurence du mot dans le texte 1
-- et d'un autre entier représentant le nombre d'occurence du mot dans le texte 2

with Mot;
use Mot;

package Triplet is

   type T_Triplet is private;

   procedure Imprime_Triplet(C : in T_Triplet);
   --Definition de la fonction d'affichage d'un couple
   --Necessaire pour l'instanciation de la liste generique

   function Creer_Triplet(M : T_Mot; N1 : Integer; N2 : Integer) return T_Triplet;
   --Cree un triplet

   -- #################################################################################
   
   -- Accesseurs en écriture aux éléments du T_Triplet
   
   procedure Set_Mot(T : in out T_Triplet; M : in T_Mot); -- Get_Mot(Set_Mot(C,M))=M
   procedure Set_NbOcc_Txt1(T : in out T_Triplet; E : in Integer); -- Get_Nbocc(Set_NbOcc(C,E))=E
   procedure Set_NbOcc_Txt2(T : in out T_Triplet; E : in Integer); -- Get_Nbocc(Set_NbOcc(C,E))=E

   -- #################################################################################
   
   -- Accesseurs en lecture aux éléments du T_Triplet
   
   function Get_Mot(T : T_Triplet) return T_Mot;
   function Get_NbOcc_Txt1(T : T_Triplet) return Integer;
   function Get_NbOcc_Txt2(T : T_Triplet) return Integer;

   -- #################################################################################
   
   -- Redéfinition des fonctions "<", ">" et "=" (Tri par ordre lexicographique)
   
   function Inferieur_Triplet_Lex(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   function Superieur_Triplet_Lex(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   function Egale_Triplet_Lex(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;

   -- #################################################################################
   
   -- Redéfinition des fonctions "<", ">" et "=" (Tri par nombre d'occurence du texte 1)
   
   function Inferieur_Triplet_Occ1(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   function Superieur_Triplet_Occ1(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   function Egale_Triplet_Occ1(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;

   -- #################################################################################
   
   -- Redéfinition des fonctions "<", ">" et "=" (Tri par nombre d'occurence du texte 2)
   
   function Inferieur_Triplet_Occ2(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   function Superieur_Triplet_Occ2(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   function Egale_Triplet_Occ2(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;

   -- #################################################################################
   
   -- Redéfinition des fonctions "<", ">" et "=" (Tri par somme des nombres d'occurence)
   
   function Inferieur_Triplet_OccS(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   function Superieur_Triplet_OccS(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   function Egale_Triplet_OccS(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;

private

      type T_Triplet is record
         Mot : T_Mot;
         NbOccTxt1 : Integer;
         NbOccTxt2 : Integer;
      end record;

end Triplet;
