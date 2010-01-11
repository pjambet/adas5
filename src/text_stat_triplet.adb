with Mot, Triplet, Liste_Triplet;
use Mot, Triplet, Liste_Triplet.LT;

package body Text_Stat_Triplet is

   function Num_Mot_Tot(L : TListe_Triplet) return Integer is
      N : Integer;
      Ltemp : TListe_Triplet;
   begin
      Ltemp := L;
      N := 0;
      while not EstVide(Ltemp) loop
         N := N + 1;
         Ltemp := Suivant(Ltemp);
      end loop;
      return N;
   end;

   function Num_Occ_Moy(L : TListe_Triplet) return Float is
      N, Total : Integer;
      Ltemp : TListe_Triplet;
   begin
      N := 0;
	Total := 0;
      Ltemp := L;
      while not EstVide(Ltemp) loop
         N := N + Get_NbOcc_Txt1(Valeur(Ltemp)) + Get_NbOcc_Txt2(Valeur(LTemp));
         Total := Total + 1;
         Ltemp := Suivant(Ltemp);
      end loop;
      return Float(N) / Float(Total);
   end;

   function Long_Moy(L : TListe_Triplet) return Float is
      N, Total : Integer;
      Ltemp : TListe_Triplet;
   begin
      N := 0;
	Total := 0;
      Ltemp := L;
      while not EstVide(Ltemp) loop
         N := N + Get_Fin(Get_Mot_T(Valeur(Ltemp)));
         Total := Total + 1;
         Ltemp := Suivant(Ltemp);
      end loop;
      return Float(N) / Float(Total);
   end;

   function Num_Mot_Sup(L : TListe_Triplet; N : Integer) return Integer is
      X : Integer;
      Ltemp : TListe_Triplet;
   begin
      X := 0;
      Ltemp := L;
      while not EstVide(Ltemp) loop
         if Get_Fin(Get_Mot_T(Valeur(Ltemp))) >= N then
            X := X + 1;
         end if;
         Ltemp := Suivant(Ltemp);
      end loop;
      return X;
   end;

end text_stat;
