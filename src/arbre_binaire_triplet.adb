package body Arbre_Binaire_Triplet is
   
   procedure Traitement_Doublon_Triplet_Txt1(A: in out Tabr_Triplet) is
   --Gere les actions a executer en cas de doublon dans l'arbre 
   --Quand on tombe sur un doublon, on increment le NbOcc1 du Triplet   
   T: T_Triplet;
   begin
      T := Lire_Racine(A);
      Set_Nbocc_txt1(T, Get_Nbocc_txt1(T)+1);
      Modifie(A, T);
   end Traitement_Doublon_Triplet_Txt1;
   
   procedure Traitement_Doublon_Triplet_Txt2(A: in out TAbr_Triplet) is
   --Gere les actions a executer en cas de doublon dans l'arbre
   --Quand on tombe sur un doublon, on increment le NbOcc1 du Triplet
   T: T_Triplet;
   begin
      T := Lire_Racine(A);
      Set_Nbocc_txt2(T, Get_Nbocc_txt1(T)+1);
      Modifie(A, T);
   end Traitement_Doublon_Triplet_Txt2;

   procedure Affiche_Triplet(A: in Tabr_Triplet) is
   begin
      Imprime_Triplet(Lire_racine(A));
   end;    

end Arbre_Binaire_Triplet;
