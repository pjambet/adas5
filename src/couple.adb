package body Couple is

   --Declaration des fonctions utiles a l'instanciation de la liste
   procedure Imprime_Couple(C : in T_Couple) is
   begin
      Put_Line("- " & Get_Chaine(Get_Mot(C))(1 .. Get_Fin(Get_Mot(C))) & Integer'Image(Get_NbOcc(C)));
   end Imprime_Couple;

   function Creer_Couple(M : T_Mot; N : Integer) return T_Couple is
      -- Crée un couple
   begin
      return T_Couple'(M, N);
   end;
   
   procedure Set_Mot(C : in out T_Couple; M : in T_Mot) is
      -- Affecte C.Mot = M
   begin
      C.Mot := M;
   end;

   procedure Set_NbOcc(C : in out T_Couple; E : in Integer) is
      -- Affecte C.NbOcc = E
   begin
      C.NbOcc := E;
   end;

   function Get_Mot(C : T_Couple) return T_Mot is
      --Renvoie le mot du couple C
   begin
      return C.Mot;
   end Get_Mot;

   function Get_NbOcc(C : T_Couple) return Integer is
      --Renvoie le nombre d'occurence du mot du Couple C
   begin
      return C.Nbocc;
   end Get_NbOcc;

end couple;
