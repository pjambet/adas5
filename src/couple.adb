package body Couple is

   ----------------------------------------------------------------
   --Declaration des fonctions utiles a l'instanciation de la liste
   procedure Imprime_Couple(C: in T_Couple) is
      --I: Integer;
   begin
--      for I in 1..Get_Fin(C.Mot) loop
--         Put(Get_Chaine(C.Mot)(I));
--      end loop;
--      Put(" ");Put(Get_NbOcc(C));Put(" ");Put("Fin: ");Put(Get_Fin(C.Mot));New_Line;
-- Code chelou
      Put(Get_Chaine(Get_Mot(C))(1 .. Get_Fin(Get_Mot(C))));
      Put_Line(Integer'Image(Get_NbOcc(C)));
   end Imprime_Couple;

   PROCEDURE Set_Mot(C: in out T_Couple;M: in T_Mot) is
      -- Affecte C.Mot = M
   begin
      C.Mot := M;
   END;

   PROCEDURE Set_NbOcc(C: in out T_Couple; E: in Integer) is
   -- Affecte C.NbOcc = E
   BEGIN
      C.NbOcc := E;
   END;

   function Get_Mot(C: T_Couple) return T_Mot is
      --Renvoie le mot du couple C
   begin
      return C.Mot;
   end Get_Mot;

   function Get_NbOcc(C: T_Couple) return Integer is
      --Renvoie le nombre d'occurence du mot du Couple C
   begin
      return C.Nbocc;
   end Get_NbOcc;



end couple;
