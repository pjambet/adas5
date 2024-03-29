-- #################################################################################
-- #                                                                               #
-- #   Nom : arbre_binaire_triplet.ads                                             #
-- #   Auteur : JAMBET Pierre                                                      #
-- #   Date de creation : 19/01/2010                                               #
-- #   Date de modification : 28/01/2010                                           #   
-- #                                                                               #
-- #################################################################################

--Ce paquetage est une instanciation du paquetage arbre_binaire avec le type triplet

with Arbre_Binaire, Triplet;
use Triplet;

package Arbre_Binaire_Triplet is

   -- Instanciation du paquetage Arbre_Binaire
   package ABT is new Arbre_Binaire(T_Elem => T_Triplet, Imprime => Imprime_Triplet, ">" => Superieur_Triplet_Lex, "=" => Egale_Triplet_Lex);

   use ABT;
   subtype TABR_Triplet is ABT.T_ABR;

   -- #################################################################################
   
   -- Instanciation des fonctions g�n�riques

   procedure Traitement_Doublon_Triplet_Txt1(A: in out Tabr_Triplet);
   -- Gere les actions a executer en cas de doublon dans l'arbre
   -- Quand on tombe sur un doublon, on increment le NbOcc1 du Triplet

   procedure Traitement_Doublon_Triplet_Txt2(A: in out TAbr_Triplet);
   -- Gere les actions a executer en cas de doublon dans l'arbre
   -- Quand on tombe sur un doublon, on increment le NbOcc1 du Triplet
   
   procedure Traitement_Doublon_Triplet_Som(A : in out TAbr_Triplet);
   -- Gere les actions a executer en cas de doublon dans l'arbre
   -- Quand on tombe sur un doublon, on increment le NbOcc2 du Triplet
   
   procedure Modif_Fusion_Triplet(A : in out TABR_Triplet; E1,E2 : in T_Triplet);
   
   procedure Fusion_Triplet is new Fusion(Modif_Fusion => Modif_Fusion_Triplet);
   
   -- #################################################################################
   
   -- Instanciation des procedures relatives � l'affichage d'un �l�ment
   
   procedure Affiche_Triplet(A: in TABR_Triplet);
   procedure Affiche_Post is new Postfixe(Traitement => Affiche_Triplet);
   procedure Affiche_Inf is new Infixe(Traitement => Affiche_Triplet);
   procedure Affiche_Pre is new Prefixe(Traitement => Affiche_Triplet);

   -- #################################################################################
   
   -- Instanciation des procedures relatives � l'insertion d'un �l�ment
   
   procedure Inserer_ABR_Triplet_Txt1 is new Inserer_ABR(Superieur_Triplet_Lex, Egale_Triplet_Lex, Inferieur_Triplet_Lex, Traitement_Doublon_Triplet_Txt1);
   procedure Inserer_ABR_Triplet_Txt2 is new Inserer_ABR(Superieur_Triplet_Lex, Egale_Triplet_Lex, Inferieur_Triplet_Lex, Traitement_Doublon_Triplet_Txt2);
   procedure Inserer_ARN_Triplet_Txt1 is new Inserer_ARN(Superieur_Triplet_Lex, Egale_Triplet_Lex, Inferieur_Triplet_Lex, Traitement_Doublon_Triplet_Txt1);
   procedure Inserer_ARN_Triplet_Txt2 is new Inserer_ARN(Superieur_Triplet_Lex, Egale_Triplet_Lex, Inferieur_Triplet_Lex, Traitement_Doublon_Triplet_Txt2);
   procedure Inserer_ARN_Triplet_OccS is new Inserer_ARN(Superieur_Triplet_OccS, Egale_Triplet_OccS, Inferieur_Triplet_OccS, Traitement_Doublon_Triplet_Txt1);
   
end Arbre_Binaire_Triplet;
