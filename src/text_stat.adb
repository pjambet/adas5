with Mot, Couple, Triplet, Liste_Couple, Liste_Triplet, Arbre_Binaire_Couple, Arbre_Binaire_Triplet, Trie;
use Mot, Couple, Triplet, Liste_Couple.L, Liste_Triplet.LT, Arbre_Binaire_Couple.AB, Arbre_Binaire_Triplet.ABT, Trie;

package body Text_Stat is

   function Num_Mot_Tot(L : TListe_Couple) return Integer is
      N : Integer;
      Ltemp : TListe_Couple;
   begin
      Ltemp := L;
      N := 0;
      while not EstVide(Ltemp) loop
         N := N + Get_NbOcc(Valeur(Ltemp));
         Ltemp := Suivant(Ltemp);
      end loop;
      return N;
   end;

   function Num_Mot_Tot(L : TListe_Triplet) return Integer is
      N : Integer;
      Ltemp : TListe_Triplet;
   begin
      Ltemp := L;
      N := 0;
      while not EstVide(Ltemp) loop
         N := N + Get_NbOcc_Txt1(Valeur(Ltemp)) + Get_NbOcc_Txt2(Valeur(Ltemp));
         Ltemp := Suivant(Ltemp);
      end loop;
      return N;
   end;

   function Num_Mot_Tot(A : TABR_Couple) return Integer is
   begin
      if Arbre_Vide(A) then return 0;
      else return 1 + Num_Mot_Tot(Sag(A))+ Num_Mot_Tot(Sad(A));
      end if;
   end;

   function Num_Mot_Tot(A : TABR_Triplet) return Integer is
   begin
      if Arbre_Vide(A) then return 0;
      else return 1 + Num_Mot_Tot(Sag(A))+ Num_Mot_Tot(Sad(A));
      end if;
   end Num_Mot_Tot;

   procedure Num_Mot_Tot_Txt1(T : T_Trie; S : in out Integer) is
   begin
      if TrieVide(T) then
         S := 0;
      else
         for I in Tindice loop
            if not STVide(T, I) then
               if Get_MotsTxt1(Get_ST(T, I)) > 0 then
                  S := S + Get_MotsTxt1(Get_ST(T, I));
               end if;
               Num_Mot_Tot_Txt1(Get_ST(T, I), S);
            end if;
         end loop;
      end if;
   end;
   
   procedure Num_Mot_Tot_Txt2 (T : in T_Trie; S : in out Integer) is
   begin
      null;
   end;
   
   -- #################################################################################

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

   function Num_Occ_Moy(A : TABR_Couple) return Float is
      --N, Total: Integer;
   begin
      if Arbre_Vide(A) then return 0.0;
      else
         null;
         --return Float(Get_NbOcc(Lire_Racine(A))) + Num_Occ_Moy(SAG(A)) + Num_Occ_Moy(SAD(A));
      end if;
      return 0.0;
   end;

   function Num_Occ_Moy(A : TABR_Triplet) return Float is
   begin
      return Float'Value(Get_Chaine(Get_Mot_T(Lire_Racine(A)))); --TODO
   end Num_Occ_Moy;

   procedure Num_Occ_Moy_Txt1 (T : in T_Trie; S : in out Float) is
   begin
      null;
   end;
   
   procedure Num_Occ_Moy_Txt2 (T : in T_Trie; S : in out Float) is
   begin
      null;
   end;

   -- #################################################################################

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

   function Long_Moy(A : TABR_Couple) return Float is
   begin
      return Float'Value(Get_Chaine(Get_Mot(Lire_Racine(A)))); --TODO
   end;

   function Long_Moy(A : TABR_Triplet) return Float is
   begin
      return Float'Value(Get_Chaine(Get_Mot_T(Lire_Racine(A)))); --TODO
   end Long_Moy;

   procedure Long_Moy_Txt1 (T : in T_Trie; S : in out Float) is
   begin
      null;
   end;
   
   procedure Long_Moy_Txt2 (T : in T_Trie; S : in out Float) is
   begin
      null;
   end;
   
   -- #################################################################################

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

   function Num_Mot_Sup(A : TABR_Couple; N : Integer) return Integer is
   begin
      if Arbre_Vide(A) then return 0;
      elsif Get_Fin(Get_Mot(Lire_Racine(A))) >= N then
         return 1 + Num_Mot_Sup(Sag(A),N) + Num_Mot_Sup(Sad(A),N);
      else
         return Num_Mot_Sup(Sag(A),N) + Num_Mot_Sup(Sad(A),N);
      end if;
   end;

   function Num_Mot_Sup(A : TABR_Triplet; N : Integer) return Integer is
   begin
      if Arbre_Vide(A) then return 0;
      elsif Get_Fin(Get_Mot_T(Lire_Racine(A))) >= N then
         return 1 + Num_Mot_Sup(Sag(A),N) + Num_Mot_Sup(Sad(A),N);
      else
         return Num_Mot_Sup(Sag(A),N) + Num_Mot_Sup(Sad(A),N);
      end if;
   end Num_Mot_Sup;

   procedure Num_Mot_Sup_Txt1 (T : in T_Trie; N : in Integer; S : in out Integer) is
   begin
      null;
   end;
   
   procedure Num_Mot_Sup_Txt2 (T : in T_Trie; N : in Integer; S : in out Integer) is
   begin
      null;
   end;
   
end Text_Stat;
