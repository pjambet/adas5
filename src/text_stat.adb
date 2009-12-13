package body Text_Stat is

   function Num_Mot_Tot(L: TListe_Couple) return Integer is
      n: Integer;
      Ltemp: TListe_Couple;
   begin
      Ltemp := L;
      while Ltemp /= null loop
         N:=N+1;
         Ltemp := Ltemp.Suiv;
      end loop;
      return N;
   end;

   function Num_Occ_Moy(L: TListe_Couple) return Float is
      n,total: Float;
      Ltemp: TListe_Couple;
   begin
      N:=0.0;Total:=0.0;
      Ltemp := L;
      while Ltemp /= null loop
         N:=N+Ltemp.Occ;
         Total:=Total+1.0;
         Ltemp := Ltemp.Suiv;
      end loop;
      return n/total;
   end;

   function Long_Moy(L: TListe_Couple) return Float is
      n,total: Float;
      Ltemp: TListe_Couple;
   begin
      N:=0.0;Total:=0.0;
      Ltemp := L;
      while Ltemp /= null loop
         N:=N+Get_Mot(Ltemp.all.Val)'Length;
         Total:=Total+1.0;
         Ltemp := Ltemp.Suiv;
      end loop;
      return N/Total;
   end;

   function Num_Mot_Sup(L: TListe_Couple;N: Integer) return Integer is
      x: Integer;
      Ltemp: TListe_Couple;
   begin
      x :=0;
      Ltemp:= L;
      while Ltemp /= null loop
         if Get_Mot(Ltemp.all.Val)'Length > N then x:=x+1;
         end if;
         Ltemp := Ltemp.Suiv;
      end loop;
      return X;
   end;

end text_stat;
