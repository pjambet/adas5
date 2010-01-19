with Ada.Text_IO;
use Ada.Text_IO;

package body Triplet is

   function Creer_Triplet(M : T_Mot; N1 : Integer; N2 : Integer) return T_Triplet is
      --Crée un triplet
   begin
      return T_Triplet'(M, N1, N2);
   end Creer_Triplet;

   procedure Imprime_Triplet(C : in T_Triplet) is
      --Definition de la fonction d'affichage d'un Triplet
      --Necessaire pour l'instanciation de la liste generique
   begin
      Put_Line("- " & Get_Chaine(Get_Mot_T(C))(1 .. Get_Fin(Get_Mot_T(C))) & Integer'Image(Get_NbOcc_Txt1(C)) & Integer'Image(Get_NbOcc_Txt2(C)));
   end Imprime_Triplet;

   procedure Set_Mot_T(T : in out T_Triplet; M : in T_Mot) is
      --Modifie le mot de T en M
      --Get_Mot(Set_Mot(T,M))=M
   begin
      T.Mot := M;
   end Set_Mot_T;

   procedure Set_NbOcc_Txt1(T : in out T_Triplet; E : in Integer) is
      --Modifie la nbocc de T en E
      --Get_Nbocc1(Set_NbOcc1(T,E))=E
   begin
      T.NbOccTxt1 := E;
   end Set_NbOcc_Txt1;

   procedure Set_NbOcc_Txt2(T : in out T_Triplet; E : in Integer) is
      --Modifie la nbocc de T en E
      --Get_Nbocc2(Set_NbOcc2(T,E))=E
   begin
      T.NbOccTxt2 := E;
   end Set_NbOcc_Txt2;

   function Get_Mot_T(T : T_Triplet) return T_Mot is
      --Renvoie le mot du couple T
   begin
      return T.Mot;
   end Get_Mot_T;

   function Get_NbOcc_Txt1(T : T_Triplet) return Integer is
      --Renvoie le nombre d'occurence du mot du Couple C
   begin
      return T.NbOccTxt1;
   end Get_NbOcc_Txt1;

   function Get_NbOcc_Txt2(T : T_Triplet) return Integer is
      --Renvoie le nombre d'occurence du mot du Couple C
   begin
      return T.NbOccTxt2;
   end Get_Nbocc_Txt2;
   
   function Inferieur_Triplet_Lex(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean is
     --redefinition de la fonction "<" pour le type Triplet
     --ici on tri les Triplets par ordre lexicographique
   begin
      return Inferieur_Mot(Get_Mot_T(Triplet1), Get_Mot_T(Triplet2));
   end;

   function Superieur_Triplet_Lex(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean is
     --redefinition de la fonction ">" pour le type Triplet
     --ici on trie les Triplets par ordre lexicographique
   begin
      return Superieur_Mot(Get_Mot_T(Triplet1), Get_Mot_T(Triplet2));
   end;

   function Egale_Triplet_Lex(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean is
     --redefinition de la fonction ">" pour le type Triplet
     --ici on trie les Triplets par ordre lexicographique
   begin
      return Egale_Mot(Get_Mot_T(Triplet1), Get_Mot_T(Triplet2));
   end;

   function Inferieur_Triplet_Occ1(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean is
     --redefinition de la fonction "<" pour le type Triplet
     --ici on tri les Triplets par nombre d'occurence décroissante
   begin
      return Get_NbOcc_Txt1(Triplet1) > Get_NbOcc_Txt1(Triplet2);
   end Inferieur_Triplet_Occ1;

   function Superieur_Triplet_Occ1(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean is
     --redefinition de la fonction ">" pour le type Triplet
     --ici on trie les Triplets par nombre d'occurence décroissante
   begin
      return Get_NbOcc_Txt1(Triplet1) <= Get_NbOcc_Txt1(Triplet2);
   end Superieur_Triplet_Occ1;

   function Egale_Triplet_Occ1(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean is
     --redefinition de la fonction "=" pour le type Triplet
     --ici on trie les Triplets par nombre d'occurence décroissante
   begin
      return Get_NbOcc_Txt1(Triplet1) = Get_NbOcc_Txt1(Triplet2);
   end Egale_Triplet_Occ1;

   function Inferieur_Triplet_Occ2(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean is
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par nombre d'occurence(du texte2) décroissante
   begin
      return Get_NbOcc_Txt2(Triplet1) > Get_NbOcc_Txt2(Triplet2);
   end Inferieur_Triplet_Occ2;

   function Superieur_Triplet_Occ2(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean is
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte2) décroissante
   begin
      return Get_NbOcc_Txt2(Triplet1) <= Get_NbOcc_Txt2(Triplet2);
   end Superieur_Triplet_Occ2;

   function Egale_Triplet_Occ2(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean is
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte2) décroissante
   begin
      return Get_NbOcc_Txt2(Triplet1) = Get_NbOcc_Txt2(Triplet2);
   end Egale_Triplet_Occ2;

   function Inferieur_Triplet_OccS(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean is
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par nombre d'occurence(somme des occ) décroissante
   begin
      return Get_NbOcc_Txt2(Triplet1) + Get_NbOcc_Txt1(Triplet1) > Get_NbOcc_Txt1(Triplet2) + Get_NbOcc_Txt2(Triplet2);
   end Inferieur_Triplet_OccS;

   function Superieur_Triplet_OccS(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean is
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(somme des occ) décroissante
   begin
      return Get_NbOcc_Txt2(Triplet1) + Get_NbOcc_Txt1(Triplet1) <= Get_NbOcc_Txt1(Triplet2) + Get_NbOcc_Txt2(Triplet2);
   end Superieur_Triplet_OccS;

   function Egale_Triplet_OccS(Triplet1 : T_Triplet; Triplet2 : T_Triplet) return Boolean is
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(somme des occ) décroissante
   begin
      return Get_NbOcc_Txt2(Triplet1) + Get_NbOcc_Txt1(Triplet1) = Get_NbOcc_Txt1(Triplet2) + Get_NbOcc_Txt2(Triplet2);
   end Egale_Triplet_OccS;

end Triplet;
