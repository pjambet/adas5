with Listegen;
with Mot;use Mot;
with Triplet;use Triplet;
with Ada.Text_Io;use Ada.Text_Io;

package Liste_Triplet is
   -----------------------------------------------------------------
   --instanciation du paquetage Listegen
   package L is new ListeGen(T_Elem => T_Triplet,Imprime => Imprime_Triplet);
   --utilisation de la liste instancié
   use L;
   --declaration su sous type
   subtype TListe_Triplet is L.T_Liste;

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

   procedure Traitement_Doublon_Triplet(L: in out TListe_Triplet;Txt: Integer);
   --Gere les actions a executer en cas de doublon dans la liste
   --Le parametre Txt correspond au texte sur lequel on travail
   --Exemple: On analyse le texte 1, le parametre txt doit etre a 1 pour
   --que les occurences soient gérées pour le texte 1

   procedure Fusion_Triplet is new L.Fusion(Modif_FusionTriplet);

   ------TRI LEXICALE-------------------------------------------------
   procedure InsererTriee_Triplet_Lex is new L.InsererTriee(Superieur_Triplet_Lex,Egale_Triplet_Lex,Inferieur_Triplet_Lex,Traitement_Doublon_Triplet);
   function CopieTriee_Triplet_Lex is new L.CopieTriee(InsererTriee_Triplet_Lex);

   -----TRI PAR OCCURENCE DU TEXTE 1----------------------------------
   procedure InsererTriee_Triplet_Occ1 is new L.InsererTriee(Superieur_Triplet_Occ1,Egale_Triplet_Occ1,Inferieur_Triplet_Occ1,Traitement_Doublon_Triplet);
   function CopieTriee_Triplet_Occ1 is new L.CopieTriee(InsererTriee_Triplet_Occ1);

   -----TRI PAR OCCURENCE DU TEXTE 2----------------------------------
   procedure InsererTriee_Triplet_Occ2 is new L.InsererTriee(Superieur_Triplet_Occ2,Egale_Triplet_Occ2,Inferieur_Triplet_Occ2,Traitement_Doublon_Triplet);
   function CopieTriee_Triplet_Occ2 is new L.CopieTriee(InsererTriee_Triplet_Occ2);

   -----TRI PAR SOMME DES OCCURENCES----------------------------------
   procedure InsererTriee_Triplet_OccS is new L.InsererTriee(Superieur_Triplet_OccS,Egale_Triplet_OccS,Inferieur_Triplet_OccS,Traitement_Doublon_Triplet);
   function CopieTriee_Triplet_OccS is new L.CopieTriee(InsererTriee_Triplet_OccS);


   -----------------------------------------------------------------
   -----------------------------------------------------------------

end Liste_Triplet;
