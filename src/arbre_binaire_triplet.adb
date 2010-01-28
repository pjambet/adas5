with Mot, Ada.Text_Io;
use Mot, Ada.Text_Io;
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
      Set_Nbocc_txt2(T, Get_Nbocc_txt2(T)+1);
      Modifie(A, T);
   end Traitement_Doublon_Triplet_Txt2;
   
   procedure Traitement_Doublon_Triplet_Som(A : in out TAbr_Triplet) is
   --Gere les actions a executer en cas de doublon dans l'arbre
   --Quand on tombe sur un doublon, on increment le NbOcc2 du Triplet
   begin
      --TODO, enfin si ya qqchose a faire, la fonction est peut etre inutile ...
      A := Creer_Arbre;--juste pour eviter le warning,
      null;
   end Traitement_Doublon_Triplet_Som;

   procedure Affiche_Triplet(A: in Tabr_Triplet) is
   begin
      Imprime_Triplet(Lire_racine(A));
   end;    

   procedure Modif_Fusion_Triplet(A : in out TAbr_Triplet; E1,E2 : T_Triplet) is
      T : T_Triplet;
      Ptr_sur_E1,Ptr_sur_E2 : TABR_Triplet;
   begin
      Ptr_Sur_E1 := Recherche_Abr(A,E1);
      Ptr_Sur_E2 := Recherche_Abr(A,E2);
      if not Arbre_Vide(Ptr_Sur_E1) and then not Arbre_Vide(Ptr_Sur_E2) then
         T := Lire_Racine(Ptr_Sur_E1);
         Set_Nbocc_Txt1(T, Get_Nbocc_Txt1(T) + Get_Nbocc_Txt1(Lire_Racine(Ptr_Sur_E2)));
         Set_Nbocc_Txt2(T, Get_Nbocc_Txt2(T) + Get_Nbocc_Txt2(Lire_Racine(Ptr_sur_E2)));
         Modifie(Ptr_Sur_E1,T);
         Supprimer_Abr(A, Lire_Racine(Ptr_Sur_E2));
         Put_Line("Le mot " & Get_Chaine(Get_Mot(E2))(1 .. Get_Fin(Get_Mot(E2))) & " a ete supprime !");
      end if;
   end Modif_Fusion_Triplet;

end Arbre_Binaire_Triplet;
