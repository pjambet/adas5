with Mot, Ada.Text_IO;
use Mot, Ada.Text_IO;

package body Liste_Triplet is

   procedure Modif_FusionTriplet(L : in out TListe_Triplet; T1, T2: in out T_Triplet) is
     --Modifie L1 en y ajoutant les occurence de L2, L2 sera supprimé
     --mais cela sera fait dans la fonction Fusion definie dans listegen
     T : T_Triplet;
     L1, L2 : TListe_Triplet;
   begin
      --Placement de L1
      Put("Fusion");
	  New_Line;
      L1 := L;
      while not EstVide(L1) and then not Compare_Mots(Get_Mot_T(Valeur(L1)), Get_Mot_T(T1)) loop
         L1 := Suivant(L1);
      end loop;

      --Placement De L2
      L2 := L;
      while not EstVide(L2) and then not Compare_Mots(Get_Mot_T(Valeur(L2)), Get_Mot_T(T2)) loop
         L2 := Suivant(L2);
      end loop;

      T := Valeur(L1);
      Set_NbOcc_Txt1(T, Get_NbOcc_Txt1(T) + Get_NbOcc_Txt1(Valeur(L2)));
      Set_NbOcc_Txt2(T, Get_NbOcc_Txt2(T) + Get_NbOcc_Txt2(Valeur(L2)));
      Modifie(L1,T);
      Supprimer(L,Valeur(L2));
      New_Line;
	  Put_Line("Le mot " & Get_Chaine(Get_Mot_T(T2)) & " a été supprimé");
   end;

   procedure Traitement_Doublon_Triplet_Txt1(L : in out TListe_Triplet) is
     T : T_Triplet;
   begin
      T := Valeur(L);
      Set_NbOcc_Txt1(T, Get_NbOcc_Txt1(Valeur(L)) + 1);
      Modifie(L, T);
   end Traitement_Doublon_Triplet_Txt1;

   procedure Traitement_Doublon_Triplet_Txt2(L : in out TListe_Triplet) is
   --Gere les actions a executer en cas de doublon dans la liste
   --Quand on tombe sur un doublon, on increment le NbOcc2 du Triplet
      T : T_Triplet;
   begin
      T := Valeur(L);
      Set_NbOcc_Txt2(T, Get_NbOcc_Txt2(Valeur(L)) + 1);
      Modifie(L, T);
   end Traitement_Doublon_Triplet_Txt2;

   procedure Traitement_Doublon_Triplet_Som(L : in out Tliste_Triplet) is
   --Gere les actions a executer en cas de doublon dans la liste
   --Quand on tombe sur un doublon, on increment le NbOcc2 du Triplet
   begin
      null; --TODO
   end Traitement_Doublon_Triplet_Som;

end Liste_Triplet;
