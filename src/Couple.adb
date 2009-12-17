package body couple is

   ----------------------------------------------------------------
   --Declaration des fonctions utiles a l'instanciation de la liste
   procedure Imprime_Couple(C: in T_Couple) is
   begin
      Put(Get_Mot(C));Put("/t");Put(Get_NbOcc(C));
   end Imprime_Couple;


   function Get_Mot(C: T_Couple) return String is
      --Renvoie le mot du couple C
   begin
      return C.Mot;
   end Get_Mot;

   function Get_NbOcc(C: T_Couple) return Integer is
      --Renvoie le nombre d'occurence du mot du Couple C
   begin
      return C.Nbocc;
   end Get_NbOcc;

   procedure Set_NbOcc(A: in Integer;C: in out T_Couple) is
      --Modifie la nbocc de C en A
      --Get_Nbocc(Set_NbOcc(A,C))=A
   begin
      C.Nbocc := A;
   end;

   function Estmot(S: String)return Boolean is
      --j'suis pas sur qu'il faille mettre ca ...
      --Renvoie vrai si la chaine S est un mot,
      --par exemple "Bonjour" est un mot mais "hello world" n'en est pas un
   begin
      --pour le moment je mets rien
      return true;
   end;

   function EstMotSignificatif(T: String)return boolean is
      --Renvoie vrai si le mot T est significatif. un mot est significatif si il
      --est de longueur supérieur a 3 ou si il est de longeur de 3 et qu'il est
      --est un "petit mot important" (cf petits-mots.txt)
   begin
      return EstLongMot(T) or else Estpetitmotimp(T) ;
   end;

   function Estlongmot(T: String) return Boolean is
      --Renvoie vrai si le mot T est de longueur strictement supérieur a 3
   begin
      return T'length > 3;
   end;

   function Estpetitmotimp(T: String) return Boolean is
      --Renvoie true si T est de longueur 3 et qu'il fait parti du fichier
      --petits-mots.txt

      Fic_Mots: File_Type;
      Ligne: String(1..30);
      Last: Integer;
   begin
      if (T'Length = 3) then
         Open(Fic_Mots,In_File,"petits-mots.txt");
         while not End_Of_File(Fic_Mots) loop
            Get_Line(Fic_Mots,Ligne,Last);
            if Ligne = T then
               return True;
            end if;
         end loop;
      end if;
      return False;
   end;

   function Estsuffixede(T1: String;T2: String)return Boolean is
      --precondition : taille(T1)<taille(T2)
      --
      --Renvoie true si T1 est suffixe de T2, false sinon
      --exemple : T1 : "ment" T2 = "lentement"
      --La fonction renvoie vrai
      I: Integer;
      Continue: Boolean;
   begin
      I := T2'Length-T1'Length+1;--on rajoute le +1 pour etre sur la case correspondant au debut du suffixe
      Continue := True;
      While I <= T1'Length and then continue loop
         if T1(I) /= T2(I) then
            Continue := False;
         end if;
         I := I+1;
      end loop;
      return Continue;
   end Estsuffixede;

   function Estprefixede(T1: String;T2: String)return Boolean is
      --precondition : taille(T1)<taille(T2)
      --
      --Renvoie true si T1 est prefixe de T2, false sinon
      --exemple : T1 = "lent" T2="lentement"
      --La fonction renvoie vrai
      I: Integer;
      Continue : Boolean;
   begin
      I := 1;
      Continue := True;
      while I <= T1'Length and then Continue loop
         if T1(I) /= T2(I) then
            Continue := False;
         end if;
         I := I+1;
      end loop;
      return Continue;
   end Estprefixede;

   function Estfacteurde(T1: String;T2: String)return Boolean is
      --precondition : taille(T1)<taille(T2)
      --
      --Renvoie true si T2 est facteur de T2, false sinon
      --exemple : T1 = "bbb" T2 = "abbba"
      --La fonction renvoie vrai
      I,J: Integer;
      Continue: Boolean;
   begin
      I:=1;
      while I+T1'Length-1 <= T2'Length loop
         Continue := True;
         J := I;
         while J <= I+T1'Length-1 and then Continue loop
            if T1(J) /= T2(J) then
               Continue := False;
            end if;
            J := J+1;
         end loop;
         --Si Continue n'a pas été mis a faux, alors on est sorti de
         --la boucle uniquement a cause de la premier condition(fin du
         --tableau) donc T1 est facteur de T2
         if Continue = True then
            return True;
         end if;
         I := I+1;
      end loop;
      return False;
   end;

end couple;
