-- #################################################################################
-- #                                                                               #
-- #   Nom : liste_couple.ads                                                      #
-- #   Auteur : JAMBET Pierre                                                     #
-- #   Date de création : 13/12/2009                                               #
-- #   Date de modification : 28/01/2010                                           #   
-- #                                                                               #
-- #################################################################################

--Ce paquetage est une instancation de listegen sur le type couple

with Listegen, Couple;
use Couple;

package Liste_Couple is

   -- Instanciation du paquetage Listegen
   package L is new ListeGen(T_Elem => T_Couple, Imprime => Imprime_Couple);
   -- Utilisation de la liste instancié
   use L;
   -- Declaration su sous type
   subtype TListe_Couple is L.T_Liste;  

   -- #################################################################################
   
   -- Instanciation des fonctions génériques
   
   procedure Modif_FusionCouple(L : in out T_Liste; T1, T2 : in out T_Couple);
   -- Modifie L1 en y ajoutant les occurence de L2, L2 sera supprimé
   -- mais cela sera fait dans la fonction Fusion definie dans listegen
   
   procedure Traitement_Doublon_Couple(L : in out TListe_Couple);
   
   procedure Fusion_Couple is new L.Fusion(Modif_FusionCouple);

   -- #################################################################################
   
   -- Instanciation des fonctions relatives à l'insertion par ordre lexicographique
   
   procedure InsererTriee_Couple_Lex is new L.InsererTriee(Superieur_Couple_Lex, Inferieur_Couple_Lex, Traitement_Doublon_Couple);
   function CopieTriee_Couple_Lex is new L.CopieTriee(InsererTriee_Couple_Lex);
   
   -- #################################################################################
   
   -- Instanciation des fonctions relatives à l'insertion par nombre d'occurence décroissante
   
   procedure InsererTriee_Couple_Occ is new L.InsererTriee(Superieur_Couple_Occ, Inferieur_Couple_Occ, Traitement_Doublon_Couple);   
   function CopieTriee_Couple_Occ is new L.CopieTriee(InsererTriee_Couple_Occ);

end Liste_Couple;
