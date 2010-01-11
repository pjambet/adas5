with Listegen;
with Mot;use Mot;
with Couple; use Couple;
with Liste_Couple;use Liste_Couple;
with Triplet;use Triplet;
with Ada.Text_Io;use Ada.Text_Io;

package Liste_Triplet is
   -----------------------------------------------------------------
   --instanciation du paquetage Listegen
   package LT is new ListeGen(T_Elem => T_Triplet,Imprime => Imprime_Triplet);
   --utilisation de la liste instancié
   use LT;
   --declaration su sous type
   subtype TListe_Triplet is LT.T_Liste;

   function From_Couple_to_Triplet(L1: TListe_Couple; L2 : TListe_Couple) return TListe_Triplet;
   --Crée une liste de couple a partir d'une liste de triplet

   -----------------------------------------------------------------
   --------FONCTION CONCERNANT L'ORDE LEXICALE----------------------

   function Inferieur_Triplet_Lex(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par ordre lexicographique

   function Superieur_Triplet_Lex(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par ordre lexicographique

   function Egale_Triplet_Lex(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par ordre lexicographique

   -----------------------------------------------------------------
   --------FONCTION CONCERNANT LES OCCURENCES DU TEXTE 1------------
   function Inferieur_Triplet_Occ1(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par nombre d'occurence(du texte1) décroissante

   function Superieur_Triplet_Occ1(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte1) décroissante

   function Egale_Triplet_Occ1(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte1) décroissante

   -----------------------------------------------------------------
   --------FONCTION CONCERNANT LES OCCURENCES DU TEXTE 2------------
   function Inferieur_Triplet_Occ2(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par nombre d'occurence(du texte2) décroissante

   function Superieur_Triplet_Occ2(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte2) décroissante

   function Egale_Triplet_Occ2(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte2) décroissante

   -----------------------------------------------------------------
   --------FONCTION CONCERNANT LES OCCURENCES DES 2 TEXTES----------
   function Inferieur_Triplet_OccS(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par nombre d'occurence(somme des occ) décroissante

   function Superieur_Triplet_OccS(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(somme des occ) décroissante

   function Egale_Triplet_OccS(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(somme des occ) décroissante
   -----------------------------------------------------------------



   ------------------------------------------------------------------
   ---------INSTANCIATION DES FONCTIONS GENERIQUES-------------------
   procedure Modif_FusionTriplet(L: in out T_Liste;T1,T2: in out T_Triplet);
   --Modifie L1 en y ajoutant les occurence de L2, L2 sera supprimé
   --mais cela sera fait dans la fonction Fusion definie dans listegen

   procedure Traitement_Doublon_Triplet_Txt1(L: in out TListe_Triplet);
   --Gere les actions a executer en cas de doublon dans la liste
   --Quand on tombe sur un doublon, on increment le NbOcc1 du Triplet

   procedure Traitement_Doublon_Triplet_Txt2(L: in out Tliste_Triplet);
   --Gere les actions a executer en cas de doublon dans la liste
   --Quand on tombe sur un doublon, on increment le NbOcc2 du Triplet

   procedure Traitement_Doublon_Triplet_Som(L: in out Tliste_Triplet);
   --Gere les actions a executer en cas de doublon dans la liste
   --Quand on tombe sur un doublon, on increment le NbOcc2 du Triplet

   procedure Fusion_Triplet is new LT.Fusion(Modif_FusionTriplet);

   ------TRI LEXICALE-------------------------------------------------
   procedure InsererTriee_Triplet_Lex_Txt1 is new LT.InsererTriee(Superieur_Triplet_Lex,Egale_Triplet_Lex,Inferieur_Triplet_Lex,Traitement_Doublon_Triplet_Txt1);
   function CopieTriee_Triplet_Lex_Txt1 is new LT.CopieTriee(InsererTriee_Triplet_Lex_Txt1);

   procedure InsererTriee_Triplet_Lex_Txt2 is new LT.InsererTriee(Superieur_Triplet_Lex,Egale_Triplet_Lex,Inferieur_Triplet_Lex,Traitement_Doublon_Triplet_Txt2);
   function CopieTriee_Triplet_Lex_Txt2 is new LT.CopieTriee(InsererTriee_Triplet_Lex_Txt2);

   -----TRI PAR OCCURENCE DU TEXTE 1----------------------------------
   procedure InsererTriee_Triplet_Occ1 is new LT.InsererTriee(Superieur_Triplet_Occ1,Egale_Triplet_Occ1,Inferieur_Triplet_Occ1,Traitement_Doublon_Triplet_Txt1);
   function CopieTriee_Triplet_Occ1 is new LT.CopieTriee(InsererTriee_Triplet_Occ1);

   -----TRI PAR OCCURENCE DU TEXTE 2----------------------------------
   procedure InsererTriee_Triplet_Occ2 is new LT.InsererTriee(Superieur_Triplet_Occ2,Egale_Triplet_Occ2,Inferieur_Triplet_Occ2,Traitement_Doublon_Triplet_Txt2);
   function CopieTriee_Triplet_Occ2 is new LT.CopieTriee(InsererTriee_Triplet_Occ2);

   -----TRI PAR SOMME DES OCCURENCES----------------------------------
   procedure InsererTriee_Triplet_OccS is new LT.InsererTriee(Superieur_Triplet_OccS,Egale_Triplet_OccS,Inferieur_Triplet_OccS,Traitement_Doublon_Triplet_Som);
   function CopieTriee_Triplet_OccS is new LT.CopieTriee(InsererTriee_Triplet_OccS);

   -----------------------------------------------------------------
   -----------------------------------------------------------------

end Liste_Triplet;
