package body Text_Stat is

   function Num_Mot_Tot(L : TListe_Couple) return Integer is
      N : Integer;
      Ltemp : TListe_Couple;
   begin
      Ltemp := L;
      N := 0;
      while not EstVide(ltemp) loop
         -- interdit : Ltemp est du type TListe_Couple, autre nompour le type privé Tlist de couples
         -- or vous l'utilisez comme un type acces !!
         -- il faut ecrire
         -- while not estvide(ltemp) loop
         N := N + 1;
          Ltemp := Suivant(Ltemp); -- meme remarque : il va fallier ajouter une fonction suivant...
      end loop;
      return N;
   end;

   function Num_Occ_Moy(L : TListe_Couple) return Float is
      N, Total : Integer;
      Ltemp : TListe_Couple;
   begin
      N := 0;
	  Total := 0;
      Ltemp := L;
      while not EstVide(Ltemp) loop
         N := N + Get_Nbocc(Valeur(Ltemp));
         Total := Total+1;
         Ltemp := Suivant(Ltemp);
      end loop;
      return Float(N) / Float(Total);
   end;

   function Long_Moy(L : TListe_Couple) return Float is
      N, Total : Integer;
      Ltemp : TListe_Couple;
   begin
      N := 0;
	  Total := 0;
      Ltemp := L;
      while not EstVide(Ltemp) loop
         N := N + Get_Fin(Get_Mot(Valeur(Ltemp)));
         Total := Total + 1;
         Ltemp := Suivant(Ltemp);
      end loop;
      return Float(N) / Float(Total);
   end;

   function Num_Mot_Sup(L : TListe_Couple; N : Integer) return Integer is
      X : Integer;
      Ltemp : TListe_Couple;
   begin
      X := 0;
      Ltemp := L;
      while not EstVide(Ltemp) loop
         if Get_Fin(Get_Mot(Valeur(Ltemp))) >= N then
		    X := X + 1;
         end if;
         Ltemp := Suivant(Ltemp);
      end loop;
      return X;
   end;

end text_stat;
