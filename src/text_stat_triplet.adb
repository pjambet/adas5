with Mot, Triplet, Liste_Triplet, Arbre_Binaire_Triplet;
use Mot, Triplet, Liste_Triplet.LT, Arbre_Binaire_Triplet.AB;

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
   
   function Num_Mot_Tot(A : TABR_Triplet) return Integer is
   --Calcule le nombre total de mot du texte
   begin
      if Arbre_Vide(A) then return 0;
      else return 1 + Num_Mot_Tot(Sag(A))+ Num_Mot_Tot(Sad(A));
      end if;
   end Num_Mot_Tot;
   
   function Num_Occ_Moy(A : TABR_Triplet) return Float is
   --Calcule le nombre d'occurence moyen a partir de la liste obtenu des mots
   --dans le texte
   begin
      return Float'Value(Get_Chaine(Get_Mot_T(Lire_Racine(A)))); --TODO
   end Num_Occ_Moy;
   
   function Long_Moy(A : TABR_Triplet) return Float is
   --Calcule la longueur moyenne d'un mot dans le texte
   begin
      return Float'Value(Get_Chaine(Get_Mot_T(Lire_Racine(A)))); --TODO    
   end Long_Moy;
   
   function Num_Mot_Sup(A : TABR_Triplet; N : Integer) return Integer is
   --Calcule le nombre de mot dont la longueur est supérieur ou égale a un entier positif donné
   begin
      if Arbre_Vide(A) then return 0;
      elsif Get_Fin(Get_Mot_T(Lire_Racine(A))) >= N then
         return 1 + Num_Mot_Sup(Sag(A),N) + Num_Mot_Sup(Sad(A),N);
      else
         return Num_Mot_Sup(Sag(A),N) + Num_Mot_Sup(Sad(A),N);
      end if;
   end Num_Mot_Sup;

end Text_Stat_Triplet;

