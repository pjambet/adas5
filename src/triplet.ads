with Mot;
use Mot;

package Triplet is

   type T_Triplet is private;

   procedure Imprime_Triplet(C : in T_Triplet);
   --Definition de la fonction d'affichage d'un couple
   --Necessaire pour l'instanciation de la liste generique

   function Creer_Triplet(M : T_Mot; N1 : Integer; N2 : Integer) return T_Triplet;
   --Crée un triplet

   procedure Set_Mot_T(T : in out T_Triplet; M : in T_Mot);
   --Modifie le mot de C en M
   --Get_Mot(Set_Mot(C,M))=M

   procedure Set_NbOcc_Txt1(T : in out T_Triplet; E : in Integer);
   --Modifie la nbocc de C en E
   --Get_Nbocc(Set_NbOcc(C,E))=E

   procedure Set_NbOcc_Txt2(T : in out T_Triplet; E : in Integer);
   --Modifie la nbocc de C en E
   --Get_Nbocc(Set_NbOcc(C,E))=E

   function Get_Mot_T(T : T_Triplet) return T_Mot;
   --Renvoie le mot du couple C

   function Get_NbOcc_Txt1(T : T_Triplet) return Integer;
   --Renvoie le nombre d'occurence du mot du Couple C

   function Get_NbOcc_Txt2(T : T_Triplet) return Integer;
   --Renvoie le nombre d'occurence du mot du Couple C

   -----------------------------------------------------------------
   --------FONCTION CONCERNANT L'ORDE LEXICALE----------------------

   function Inferieur_Triplet_Lex(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par ordre lexicographique

   function Superieur_Triplet_Lex(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par ordre lexicographique

   function Egale_Triplet_Lex(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par ordre lexicographique

   -----------------------------------------------------------------
   --------FONCTION CONCERNANT LES OCCURENCES DU TEXTE 1------------
   function Inferieur_Triplet_Occ1(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par nombre d'occurence(du texte1) décroissante

   function Superieur_Triplet_Occ1(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte1) décroissante

   function Egale_Triplet_Occ1(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte1) décroissante

   -----------------------------------------------------------------
   --------FONCTION CONCERNANT LES OCCURENCES DU TEXTE 2------------
   function Inferieur_Triplet_Occ2(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par nombre d'occurence(du texte2) décroissante

   function Superieur_Triplet_Occ2(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte2) décroissante

   function Egale_Triplet_Occ2(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte2) décroissante

   -----------------------------------------------------------------
   --------FONCTION CONCERNANT LES OCCURENCES DES 2 TEXTES----------
   function Inferieur_Triplet_OccS(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par nombre d'occurence(somme des occ) décroissante

   function Superieur_Triplet_OccS(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(somme des occ) décroissante

   function Egale_Triplet_OccS(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean;
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(somme des occ) décroissante
   -----------------------------------------------------------------

   private

      type T_Triplet is record
         Mot : T_Mot;
         NbOccTxt1 : Integer;
         NbOccTxt2 : Integer;
      end record;

end Triplet;
