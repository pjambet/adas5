with Mot;use Mot;
with Ada.Text_Io;use Ada.Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package Triplet is

   type T_Triplet is private;

   procedure Imprime_Triplet(C: in T_Triplet);
   --Definition de la fonction d'affichage d'un couple
   --Necessaire pour l'instanciation de la liste generique

   function Creer_Triplet(M: T_Mot;N1: Integer;N2: Integer)return T_Triplet;
   --Crée Un triplet

   procedure Set_Mot_T(T: in out T_Triplet; M: in T_Mot);
   --Modifie le mot de C en M
   --Get_Mot(Set_Mot(C,M))=M

   procedure Set_NbOcc1(T: in out T_Triplet; E: in Integer);
   --Modifie la nbocc de C en E
   --Get_Nbocc(Set_NbOcc(C,E))=E

   procedure Set_NbOcc2(T: in out T_Triplet; E: in Integer);
   --Modifie la nbocc de C en E
   --Get_Nbocc(Set_NbOcc(C,E))=E

   function Get_Mot_T(T: T_Triplet) return T_Mot;
   --Renvoie le mot du couple C

   function Get_NbOcc1(T: T_Triplet) return Integer;
   --Renvoie le nombre d'occurence du mot du Couple C

   function Get_NbOcc2(T: T_Triplet) return Integer;
   --Renvoie le nombre d'occurence du mot du Couple C

   private

      type T_Triplet is record
         Mot: T_Mot;
         NbOcc1: Integer;
         NbOcc2: Integer;
      end record;

end Triplet;
