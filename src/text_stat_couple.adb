with Mot, Couple, Liste_Couple;
use Mot, Couple, Liste_Couple.L;

package body Text_Stat_Couple is

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
   
   -----------ARBRES------------------------------------

   function Num_Mot_Tot(A : TABR_Couple) return Integer is
   --Calcule le nombre total de mot du texte                    
   begin
      if Arbre_Vide(A) then return 0;
      else return 1 + Num_Mot_Tot(Sag(A))+ Num_Mot_Tot(Sad(A));
      end if;
   end;
   
   function Num_Occ_Moy(A : TABR_Couple) return Float is
   --Calcule le nombre d'occurence moyen a partir de la liste obtenu des mots
   --dans le texte
      N,Total: Integer;      
   begin
      if Arbre_Vide(A) then return 0.0;
      else
         null;
         --return Float(Get_NbOcc(Lire_Racine(A))) + Num_Occ_Moy(SAG(A)) + Num_Occ_Moy(SAD(A));
      end if;
      return 0.0;
   end;
   
   function Long_Moy(A : TABR_Couple) return Float is
   --Calcule la longueur moyenne d'un mot dans le texte
   begin
      return 0.0;
   end;
   
   function Num_Mot_Sup(A : TABR_Couple; N : Integer) return Integer is
   --Calcule le nombre de mot dont la longueur est supérieur ou égale a un entier positif donne
   begin
      if Arbre_Vide(A) then return 0;
      elsif Get_Fin(Get_Mot(Lire_Racine(A))) >= N then
         return 1 + Num_Mot_Sup(Sag(A),N) + Num_Mot_Sup(Sad(A),N);
      else
         return Num_Mot_Sup(Sag(A),N) + Num_Mot_Sup(Sad(A),N);
      end if;
   end;

   
end text_stat_couple;
