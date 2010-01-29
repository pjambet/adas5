-- #################################################################################
-- #                                                                               #
-- #   Nom : couple.ads                                                            #
-- #   Auteur : JAMBET Pierre                                                      #
-- #   Date de création : 06/12/2009                                               #
-- #   Date de modification : 28/01/2010                                           #   
-- #                                                                               #
-- #################################################################################

-- Le type Couple est un agrégat d'un T_Mot et du nombre d'occurence de ce mot

with Mot;
use Mot;

package Couple is

   type T_Couple is private;

   function Creer_Couple(M : in T_Mot; N : in Integer) return T_Couple;
   -- Crée un couple
   
   procedure Imprime_Couple(C : in T_Couple);
   -- Procedure permettant d'afficher le T_Couple

   function ToString(C : in T_Couple) return String;
   -- Fonction qui transforme le T_Couple en String

   -- #################################################################################
   
   -- Accesseurs en écriture aux élements du T_Couple
   
   procedure Set_Mot(C : in out T_Couple; M : in T_Mot); -- Get_Mot(Set_Mot(C,M))=M
   procedure Set_NbOcc(C : in out T_Couple; E : in Integer); -- Get_Nbocc(Set_NbOcc(C,E))=E

   -- #################################################################################
   
   -- Accesseurs en lecture aux éléments du T_Couple
   
   function Get_Mot(C : T_Couple) return T_Mot;
   function Get_NbOcc(C : T_Couple) return Integer;

   -- #################################################################################
   
   -- Redéfinition des fonctions "<", ">" et "=" (Tri par ordre lexicographique)
   
   function Inferieur_Couple_Lex(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   function Superieur_Couple_Lex(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   function Egale_Couple_Lex(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;

   -- #################################################################################
   
   -- Redéfinition des fonctions "<", ">" et "=" (Tri par nombre d'occurence décroissante)
   
   function Inferieur_Couple_Occ(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   function Superieur_Couple_Occ(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   function Egale_Couple_Occ(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;

private

   type T_Couple is record
      Mot: T_Mot;
      NbOcc: Integer;
   end record;

end Couple;
