with Mot, Ada.Text_IO;
use Mot, Ada.Text_IO;

package body liste_couple is

   package Es_Entier is new Ada.Text_Io.Integer_Io(Integer);
   use Es_Entier; 

   procedure Modif_FusionCouple(L : in out TListe_Couple; T1, T2 : in out T_Couple) is
      --Modifie L1 en y ajoutant les occurence de L2, L2 sera supprime
      --mais cela sera fait dans la fonction Fusion definie dans listegen
      C : T_Couple;
      L1, L2 : T_Liste;
   begin
      --Placement de L1
      L1 := L;
      while not EstVide(L1) and then not Compare_Mots(Get_Mot(Valeur(L1)), Get_Mot(T1)) loop
         L1 := Suivant(L1);
      end loop;

      --Placement De L2
      L2 := L;
      while not EstVide(L2) and then not Compare_Mots(Get_Mot(Valeur(L2)), Get_Mot(T2)) loop
         L2 := Suivant(L2);
      end loop;

      C := Valeur(L1);
      Set_NbOcc(C, Get_NbOcc(C)+Get_NbOcc(Valeur(L2)) );
      Modifie(L1,C);
      Supprimer(L, Valeur(L2));
      Put_Line("Le mot " & Get_Chaine(Get_Mot(T2))(1 .. Get_Fin(Get_Mot(T2))) & " a ete supprime !");
   end;

   procedure Traitement_Doublon_Couple(L : in out TListe_Couple) is
      C : T_Couple;
   begin
      C := Valeur(L);
      Set_NbOcc(C, Get_NbOcc(Valeur(L))+1);
      Modifie(L, C);
   end Traitement_Doublon_Couple;

end Liste_Couple;
