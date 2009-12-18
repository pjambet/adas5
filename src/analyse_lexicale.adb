WITH Ada.Text_IO, Couple;
use Ada.Text_IO, Couple;

package body analyse_lexicale is

   FUNCTION CaractereAutorise(C: IN Character) RETURN Boolean IS
      -- Renvoit vrai si le caractere est autorise en tant que caractere d'un mot, faux sinon
   BEGIN
      IF C = Character'Val(32) THEN -- ' '
         RETURN False;
      ELSIF C = Character'Val(33) THEN -- '!'
         RETURN False;
      ELSIF C = Character'Val(34) THEN -- '"'
         RETURN False;
      ELSIF C = Character'Val(35) THEN -- '#'
         RETURN False;
      ELSIF C = Character'Val(36) THEN -- '$'
         RETURN False;
      ELSIF C = Character'Val(37) THEN -- '%'
         RETURN False;
      ELSIF C = Character'Val(38) THEN -- '&'
         RETURN False;
      ELSIF C = Character'Val(40) THEN -- '('
         RETURN False;
      ELSIF C = Character'Val(41) THEN -- ')'
         RETURN False;
      ELSIF C = Character'Val(42) THEN -- '*'
         RETURN False;
      ELSIF C = Character'Val(43) THEN -- '+'
         RETURN False;
      ELSIF C = Character'Val(44) THEN -- ','
         RETURN False;
      ELSIF C = Character'Val(46) THEN -- '.'
         RETURN False;
      ELSIF C = Character'Val(47) THEN -- '/'
         RETURN False;
      ELSIF C = Character'Val(58) THEN -- ':'
         RETURN False;
      ELSIF C = Character'Val(59) THEN -- ';'
         RETURN False;
      ELSIF C = Character'Val(60) THEN -- '<'
         RETURN False;
      ELSIF C = Character'Val(61) THEN -- '='
         RETURN False;
      ELSIF C = Character'Val(62) THEN -- '>'
         RETURN False;
      ELSIF C = Character'Val(63) THEN -- '?'
         RETURN False;
      ELSIF C = Character'Val(64) THEN -- '@'
         RETURN False;
      ELSIF C = Character'Val(91) THEN -- '['
         RETURN False;
      ELSIF C = Character'Val(92) THEN -- '\'
         RETURN False;
      ELSIF C = Character'Val(93) THEN -- ']'
         RETURN False;
      ELSIF C = Character'Val(94) THEN -- '^'
         RETURN False;
      ELSIF C = Character'Val(95) THEN -- '_'
         RETURN False;
      ELSIF C = Character'Val(96) THEN -- '`'
         RETURN False;
      ELSIF C = Character'Val(10) THEN -- LF
         RETURN False;
      ELSIF C = Character'Val(13) THEN -- CR
         RETURN False;
      ELSE
         RETURN True;
      END IF;
   END;
                     
   procedure query_liste_couple(L: in out TListe_Couple; NomFic: in String) is
      --Renvoit une liste comprenant tous les couples(mot;occurence) du fichier texte NomFic
      Orig : File_Type; -- Fichier source
      C : Character;
      Mot : String(1 .. 30);
      Indice : Integer;
      Couple : T_Couple;
   BEGIN
      Indice := 0;
      C := Character'Val(0);
      Open(Orig, In_File, NomFic);
      While not End_Of_File(Orig) loop
         IF End_Of_Line(Orig) THEN
            Put_Line("SkipLine"); --TEST
            Skip_Line(Orig);
         ELSE
            While CaractereAutorise(C) Loop
               Get(Orig, C);
               if CaractereAutorise(C) then -- On crée le mot
                  Indice := Indice + 1;
                  Mot(Indice) := C;
                  
                  Put("C : " & C); Put_Line(" - Mot 1 .." & Integer'Image(Indice) & " : " & Mot(1 .. Indice)); --TEST
                     
               END IF;
            END LOOP;
            Put("C : " & C); Put_Line(" - Mot 1 .." & Integer'Image(Indice) & " : " & Mot(1 .. Indice)); --TEST
            Skip_Line;
            IF EstMotSignificatif(Mot(1 .. Indice)) THEN
               Set_Mot(Couple, Mot(1 .. Indice));
               Set_NbOcc(Couple, 1);
               Set_Fin(Couple, Indice);
               InsererTriee_Couple(L, Couple); -- Ajoute dans la liste le premier mot significatif      
            END IF;
            Indice := 0;
            C := Character'Val(0);            
         end if;
      end loop;
      Close(Orig);
   end;

   function query_NbOcc(l: TListe_Couple; m: String) return Integer is
   --Requete renvoyant le nombre d'occurence du mot m dans le texte
   BEGIN
      if EstVide(l) then
         return 0;
      elsif Get_Mot(Valeur(L)) = m then
         return 1+query_NbOcc(Suivant(L), m);
      else
         return query_NbOcc(Suivant(L), m);
      end if;
   end;

   procedure query_NbPref(l: in TListe_Couple; s: in String; nbMot: out Integer; nbOcc: out Integer) is
   --Requete renvoyant le nombre de mot ayant s pour préfixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
   temp : TListe_Couple;
   res : Integer;
   BEGIN
      res := 0;
      temp := l;
      while not EstVide(Temp) loop
         if Estprefixede(Get_Mot(Valeur(Temp)), s) then
            res := res + 1;
         end if;
         temp := Suivant(Temp);
      end loop;
      nbMot := res;
      nbOcc := query_nbOcc(L,s);
   end;

   procedure query_NbSuff(l: in TListe_Couple; s: in String; nbMot: out Integer; nbOcc: out Integer) is
   --Requete renvoyant le nombre de mot ayant s pour suffixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
   temp : TListe_Couple;
   res : Integer;
   BEGIN
      res := 0;
      temp := l;
      while not Estvide(Temp) loop
         if Estsuffixede(Get_Mot(Valeur(Temp)), s) then
            res := res + 1;
         end if;
         temp := Suivant(Temp);
      end loop;
      nbMot := res;
      nbOcc := query_nbOcc(L,s);
   end;

   procedure query_NbFact(l: in TListe_Couple; s: in String; nbMot: out Integer; nbOcc: out Integer) is
   --Requete renvoyant le nombre de mot ayant s pour facteur et le nombre d'occurence de s (Appel de query_NbOcc(s))
   temp : TListe_Couple;
   res : Integer;
   BEGIN
      res := 0;
      temp := l;
      while not EstVide(Temp) loop
         if Estfacteurde(Get_Mot(Valeur(Temp)), s) then
            res := res + 1;
         end if;
         temp := Suivant(Temp);
      end loop;
      nbMot := res;
      nbOcc := query_nbOcc(L,s);
   end;

   procedure Creer_Fichier_Listemot(L: in TListe_Couple) is
   --Procedure qui crée le fichier listeMot a partir de la liste de couple l
   --Le Fichier créé est de la forme suivante
   ------------------------------------------
   --Mot1 Nbocc1
   --Mot2 NbOcc2
   --etc ...
   ------------------------------------------
   begin
      --TODO
      null;
   end;

   procedure Recup_Liste(L: out TListe_Couple) is
   --procedure qui recrée la liste de couple a partir du fichier "liste-mot.txt"
   --le fichier n'est pas passé en parametre car il sera créé auparavant par la fonction Creer_Fichier_Listemot
   --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
   --declenche une exception si le fichier n'existe pas
   begin
      --TODO
      null;
   end;


end analyse_lexicale;

