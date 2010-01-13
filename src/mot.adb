package body Mot is

   function Superieur_Mot(M1, M2 : T_Mot)return Boolean is
   begin
      return M1.Chaine > M2.Chaine;
   end Superieur_Mot;

   function Inferieur_Mot(M1, M2 : T_Mot) return Boolean is
   begin
      return M1.Chaine < M2.Chaine;
   end Inferieur_Mot;

   function Egale_Mot(M1, M2 : T_Mot) return Boolean is
   begin
      return M1.Chaine = M2.Chaine;
   end Egale_Mot;

   function Creer_Mot(S : String) return T_Mot is
      I : Integer;
      M : T_Mot;
      Sret : String(1 .. 30);
      Fin : Integer;
   begin
      Fin := 0;
      I := 1;           
      while I <= S'Length and then S(I) /= Character'Val(32) loop -- character'val(32)' '
         Sret(I) := S(I);
         Fin := Fin+1;
         I := I+1;
      end loop; -- I = S'length+1 ou S(I)=' '
      for I in (Fin+1) .. 30 loop
         Sret(I) := ' ';
      end loop;
      M := T_Mot'(Sret, Fin);
      return M;
   end Creer_Mot;

   procedure Set_Chaine(M : in out T_Mot; S : in String) is
      -- Affecte C.Mot = M
   begin
      if S'Length = 30 then
         M.Chaine := S;
      else
         for I in 1 .. S'length loop
            M.Chaine(I) := S(I);
         end loop;
         M.Fin := S'Length;
         for I in S'Length+1 .. 30 loop
            M.Chaine(I) := ' ';
         end loop;
      end if;
   END;

   function Get_Chaine(M : T_Mot) return String is
      --Renvoie le mot du couple C
   begin
      return M.Chaine;
   end Get_Chaine;

   function Get_Fin(M : T_Mot) return Integer is
   --Renvoie l'indice de fin du mot de C
   begin
      return M.Fin;
   end Get_Fin;

   procedure Set_Fin(M : in out T_Mot; I : in Integer) is
   --Modifie le Fin de C en I
   --Get_Fin(Set_Fin(C,I))=I
   begin
      M.Fin := I;
   end Set_Fin;

   function Compare_Mots(M1, M2 : T_Mot) return boolean is
      --I: Integer;
   begin
      if M1.Fin /= M2.Fin then return False;
      else
         for I in 1 .. M1.Fin loop
            if M1.Chaine(I) /= M2.Chaine(I) then
               return False;
            end if;
         end loop;
         return True;
      end if;
   end Compare_Mots;

   function Compare_Chaine_Mot(S : String; M : T_Mot) return Boolean is
   --Compare une chaine avec le mot contenu dans t_mot
   --renvoie vrai si S = M.mot
   --renvoie faux sinon
   --On a besoin de cette fonction pour utiliser l'indice de fin
   --contenu dans le couple
      Min, Cmp : Integer;
   begin
      if S'Last /= M.Fin then
         return false;
      else
         min := S'last;
         Cmp := 0;
         for I in 1 .. Min loop
            if S(I) /= M.Chaine(I) then
               return False;
            end if;
            Cmp := Cmp+1;
         end loop;
         return Cmp = Min;
      end if;
   end Compare_Chaine_Mot;

   function EstMotSignificatif(M : T_Mot) return boolean is
      --Renvoie vrai si le mot T est significatif. un mot est significatif si il
      --est de longueur supérieur a 3 ou si il est de longeur de 3 et qu'il est
      --est un "petit mot important" (cf petits-mots.txt)
   begin
      return EstLongMot(M) or else EstPetitMotImp(M);
   end;

   function EstLongMot(M : T_Mot) return Boolean is
      --Renvoie vrai si le mot T est de longueur strictement supérieur a 3
   begin
      return Get_Fin(M) > 3;
   end;

   function EstPetitMotImp(M : T_Mot) return Boolean is
      --Renvoie true si T est de longueur 3 et qu'il fait parti du fichier petits-mots.txt
      Fic_Mots : File_Type;
      Ligne : String(1..30);
      Last : Integer;
   begin
      if Get_Fin(M) = 3 then
         Open(Fic_Mots, In_File, "petits-mots.txt");
         while not End_Of_File(Fic_Mots) loop
            Get_Line(Fic_Mots, Ligne, Last);
            if Compare_Chaine_Mot(Ligne, M) then
               Close(Fic_Mots);
               return True;
            end if;
         end loop;
         Close(Fic_Mots);
      end if;
      return False;
   end;

   function EstSuffixeDe(M1 : T_Mot; M2 : T_Mot) return Boolean is
      --precondition : taille(T1)<taille(T2)
      --Renvoie true si T1 est suffixe de T2, false sinon
      --exemple : T1 : "ment" T2 = "lentement"
      --La fonction renvoie vrai
      I : Integer;
      Continue : Boolean;
   begin
      I := Get_Fin(M2) - Get_Fin(M1) + 1; -- on rajoute le +1 pour etre sur la case correspondant au debut du suffixe
      Continue := True;
      While I <= Get_Fin(M2) and then Continue loop
         if Get_Chaine(M1)(I) /= Get_Chaine(M2)(I) then
            Continue := False;
         end if;
         I := I + 1;
      end loop;
      return Continue;
   end Estsuffixede;

   function EstPrefixeDe(M1 : T_Mot; M2 : T_Mot) return Boolean is
      --precondition : taille(T1)<taille(T2)
      --Renvoie true si T1 est prefixe de T2, false sinon
      --exemple : T1 = "lent" T2="lentement"
      --La fonction renvoie vrai
      I : Integer;
      Continue : Boolean;
   begin
      I := 1;
      Continue := True;
      while I <= Get_Fin(M1) and then Continue loop
         if Get_Chaine(M1)(I) /= Get_Chaine(M2)(I) then
            Continue := False;
         end if;
         I := I + 1;
      end loop;
      return Continue;
   end Estprefixede;

   function EstFacteurDe(M1 : T_Mot; M2 : T_Mot) return Boolean is
      --precondition : taille(T1)<taille(T2)
      --Renvoie true si T2 est facteur de T2, false sinon
      --exemple : T1 = "bbb" T2 = "abbba"
      --La fonction renvoie vrai
      I, J, K : Integer;
      Continue : Boolean;
   begin
      I := 1;
      while I + Get_Fin(M1) - 1 <= Get_Fin(M2) loop
         Continue := True;
         J := I;
         K := 1;
         while K <= Get_Fin(M1) and then J <= I+Get_Fin(M1) - 1 and then Continue loop
            if Get_Chaine(M1)(K) /= Get_Chaine(M2)(J) then
               Continue := False;
            end if;
            J := J+1;
            K := K+1;
         end loop;
         --Si Continue n'a pas été mis a faux, alors on est sorti de
         --la boucle uniquement a cause de la premier condition(fin du
         --tableau) donc T1 est facteur de T2
         if Continue = True then
            return True;
         end if;
         I := I + 1;
      end loop;
      return False;
   end;

end Mot;
