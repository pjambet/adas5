with Mot;use Mot;
--with ListeGen;
with Ada.Text_Io;use Ada.Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package Couple is
   --Definition du type t qui permet ainsi d'analyser les textes en ne
   --selectionnant que les "String" qui doivent etre definies ici
   type T_Couple is private;

   procedure Imprime_Couple(C: in T_Couple);
   --Definition de la fonction d'affichage d'un couple
   --Necessaire pour l'instanciation de la liste generique

   PROCEDURE Set_Mot(C: in out T_Couple; M: in T_Mot);
   --Modifie le mot de C en M
   --Get_Mot(Set_Mot(C,M))=M

   PROCEDURE Set_NbOcc(C: in out T_Couple; E: in Integer);
   --Modifie la nbocc de C en E
   --Get_Nbocc(Set_NbOcc(C,E))=E

   function Get_Mot(C: T_Couple) return T_Mot;
   --Renvoie le mot du couple C

   function Get_NbOcc(C: T_Couple) return Integer;
   --Renvoie le nombre d'occurence du mot du Couple C



   -- ... A completer eventuellement par la suite

private

   type T_Couple is record
      Mot: T_Mot;
      NbOcc: Integer;
   end record;



end Couple;
