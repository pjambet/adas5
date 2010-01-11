with Mot;
use Mot;

package Couple is

   --Definition du type t qui permet ainsi d'analyser les textes en ne selectionnant que les "String" qui doivent etre definies ici
   type T_Couple is private;

   procedure Imprime_Couple(C : in T_Couple);
   --Definition de la fonction d'affichage d'un couple necessaire pour l'instanciation de la liste generique

   function Creer_Couple(M : T_Mot; N : Integer) return T_Couple;
   -- Crée un couple
   
   procedure Set_Mot(C : in out T_Couple; M : in T_Mot);
   --Modifie le mot de C en M
   --Get_Mot(Set_Mot(C,M))=M

   procedure Set_NbOcc(C : in out T_Couple; E : in Integer);
   --Modifie la nbocc de C en E
   --Get_Nbocc(Set_NbOcc(C,E))=E

   function Get_Mot(C : T_Couple) return T_Mot;
   --Renvoie le mot du couple C

   function Get_NbOcc(C : T_Couple) return Integer;
   --Renvoie le nombre d'occurence du mot du Couple C

private

   type T_Couple is record
      Mot: T_Mot;
      NbOcc: Integer;
   end record;

end Couple;
