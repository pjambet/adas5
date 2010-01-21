package body Arbre_Binaire_Couple is
   
   procedure Traitement_Doublon_Couple(A: in out Tabr_Couple) is
   --Gere les actions a executer en cas de doublon dans l'arbre 
   --Quand on tombe sur un doublon, on increment le NbOcc1 du Triplet   
   T: T_Couple;
   begin
      T := Lire_Racine(A);
      Set_Nbocc(T, Get_Nbocc(T)+1);
      Modifie(A, T);
   end Traitement_Doublon_Couple;
     
   procedure Affiche_Couple(A: in Tabr_Couple) is
   begin
      Imprime_Couple(Lire_Racine(A));
   end Affiche_Couple;
    

end Arbre_Binaire_Couple;
