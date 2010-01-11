package body Triplet is

   function From_Couple_to_Triplet(L1: TListe_Couple; L2 : TListe_Couple) return TListe_Triplet is
      --Crée une liste de couple a partir d'une liste de triplet
   begin
      --TODO
      return null;
   end From_Couple_To_Triplet;

   function Creer_Triplet(M: T_Mot; N1: Integer; N2: Integer)return T_Triplet is
      --Crée Un triplet
   begin
      return T_Triplet'(M, N1, N2);
   end Creer_Triplet;

   procedure Imprime_Triplet(C: in T_Couple) is
      --Definition de la fonction d'affichage d'un Triplet
      --Necessaire pour l'instanciation de la liste generique
   begin
      Put(Get_Chaine(Get_Mot_T(C))(1 .. Get_Fin(Get_Mot_T(C))));
      Put(Integer'Image(Get_NbOcc(C)));Put(" ");Put_Line(Integer(Image(Get_NbOcc2)));
   end Imprime_Triplet;

   procedure Set_Mot_T(T: in out T_Triplet; M: in T_Mot) is
      --Modifie le mot de T en M
      --Get_Mot(Set_Mot(T,M))=M
   begin
      T.Mot := M;
   end Set_Mot_T;

   procedure Set_NbOcc1(T: in out T_Triplet; E: in Integer) is
      --Modifie la nbocc de T en E
      --Get_Nbocc1(Set_NbOcc1(T,E))=E
   begin
      T.NbOcc1 := E;
   end Set_NbOcc1;

   procedure Set_NbOcc2(T: in out T_Triplet; E: in Integer) is
      --Modifie la nbocc de T en E
      --Get_Nbocc2(Set_NbOcc2(T,E))=E
   begin
      T.NbOcc2 := E;
   end Set_NbOcc2;

   function Get_Mot_T(T: T_Triplet) return T_Mot is
      --Renvoie le mot du couple T
   begin
      return T.Mot;
   end Get_Mot_T;

   function Get_NbOcc1(T: T_Triplet) return Integer is
      --Renvoie le nombre d'occurence du mot du Couple C
   begin
      return T.NbOcc1;
   end Get_NbOcc1;

   function Get_NbOcc2(T: T_Triplet) return Integer is
      --Renvoie le nombre d'occurence du mot du Couple C
   begin
      return T.NbOcc2;
   end Get_NbOcc2;

end Triplet;
