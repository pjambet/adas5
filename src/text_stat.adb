package body Text_Stat is
   function Num_Mot_Tot(txt: Fichier_Texte) return Integer is
   n: Integer;
   begin
      while not(Fin_Texte) loop
         N:=N+1;
      end loop
         return N;
   end;
   
   function Num_Occ_Moy(L: Liste_Couple) return Float is
   n,total: Integer
   begin
      N:=0;
      while not(Fin_Liste) loop
         N:=N+L(I).Occ;
         Total:=Total+1;
      end loop;
      return n/total;
   end;
   
   function Long_Moy(L: Liste_Couple) return Float is
   n,total: Integer;
   begin
      N:=0;Total:=0;
      while not(Fin_Liste) loop
         N:=N+L(I).Length;
         Total:=Total+1;
      end loop;
      return N/Total;
   end;
            
   function Num_Mot_Sup(L: ListeCouple;N: Integer) return Integer is
   n: Integer;
   begin
      n :=0;
      while not(Fin_Liste) loop
         if L(I).Length > N then N:=N+1;
         end if;
      end loop;
   end;

end text_stat;
