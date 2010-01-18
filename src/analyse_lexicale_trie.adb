with Analyse_Lexicale, Trie, Mot, Ada.Text_IO, Ada.Characters.Handling, Ada.Calendar;
use Analyse_Lexicale, Trie, Mot, Ada.Text_IO, Ada.Characters.Handling, Ada.Calendar;

package body Analyse_Lexicale_Trie is

   procedure Query_Trie(T : in out T_Trie; NomFic : in String) is
      --Renvoit un trie comprenant tous les mots et occurences du texte
      Orig : File_Type; -- Fichier source
      C : Character;
      Mot : String(1 .. 30);
      Indice : Integer;
      M : T_Mot;
      Chrono_start : Integer;
      Chrono_end : Integer;
   begin
      Indice := 0;
      C := Character'Val(0);
      Chrono_start := Integer(seconds(Clock));
      Open(Orig, In_File, NomFic);
      Put("Debut lecture");
      while not End_Of_File(Orig) loop
         if End_Of_Line(Orig) then
            Indice := 0;
            Skip_Line(Orig);
         else -- non(End_Of_Line(Orig))
            Get(Orig, C);
            if CaractereAutorise(C) then -- On crée le mot
               Indice := Indice + 1;
               if Is_Upper(C) then
                  C := To_Lower(C);
               end if;
               Mot(Indice) := C;
            else -- non(CaractereAutorise(C))
               Put(".");
               M := Creer_Mot(Mot(1 .. Indice));
               if EstMotSignificatif(M) then
                  --Set_Fin(Couple, Indice);
                  T := AjouterMot(T, M); -- Ajoute dans le trie le premier mot significatif
               end if;
               Indice := 0;
               C := Character'Val(0);
            end if;
         end if;
      end loop;
      Close(Orig);
      Chrono_end := Integer(seconds(Clock));
      New_Line;
      Put_Line("Fin lecture !");
      Put_Line("Temps d'analyse : " & Integer'Image(Chrono_end-Chrono_start));
      Skip_Line;
   end;

--      function Query_NbOcc(T : T_Trie; M : String) return Integer is
--      Requete renvoyant le nombre d'occurence du mot m dans le texte
--      begin
--         if EstVide(T) then
--            return 0;
--         elsif Compare_Chaine_Mot(M,Get_Mot(Valeur(L))) then
--            return Get_NbOcc(Valeur(L));
--         else
--            return Query_NbOcc(Suivant(L), M);
--         end if;
--      end;

--      procedure Query_NbPref(L : in TListe_Couple; S : in String; NbMot : out Integer; NbOcc : out Integer) is
--          Requete renvoyant le nombre de mot ayant s pour préfixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
--         Temp : TListe_Couple;
--         Res : Integer;
--         MotS : T_Mot;
--      begin
--         Res := 0;
--         Temp := L;
--         MotS := Creer_Mot(S);
--         while not EstVide(Temp) loop
--            if EstPrefixeDe(Get_Mot(Valeur(Temp)), MotS) then
--               Res := Res + 1;
--            end if;
--            Temp := Suivant(Temp);
--         end loop;
--         NbMot := Res;
--         NbOcc := Query_NbOcc(L, S);
--      end;

--      procedure Query_NbSuff(L : in TListe_Couple; S : in String; NbMot : out Integer; NbOcc : out Integer) is
--          Requete renvoyant le nombre de mot ayant s pour suffixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
--         Temp : TListe_Couple;
--         Res : Integer;
--         MotS : T_Mot;
--      begin
--         Res := 0;
--         Temp := L;
--         MotS := Creer_Mot(S);
--         while not Estvide(Temp) loop
--            if EstSuffixeDe(Get_Mot(Valeur(Temp)), MotS) then
--               Res := Res + 1;
--            end if;
--            Temp := Suivant(Temp);
--         end loop;
--         NbMot := Res;
--         NbOcc := Query_NbOcc(L, S);
--      end;

--      procedure Query_NbFact(L : in TListe_Couple; S : in String; NbMot : out Integer; NbOcc : out Integer) is
--          Requete renvoyant le nombre de mot ayant s pour facteur et le nombre d'occurence de s (Appel de query_NbOcc(s))
--         Temp : TListe_Couple;
--         Res : Integer;
--         MotS : T_Mot;
--      begin
--         Res := 0;
--         Temp := L;
--         MotS := Creer_Mot(S);
--         while not EstVide(Temp) loop
--            if EstFacteurDe(Get_Mot(Valeur(Temp)), MotS) then
--               Res := Res + 1;
--            end if;
--            Temp := Suivant(Temp);
--         end loop;
--         NbMot := Res;
--         NbOcc := Query_NbOcc(L, S);
--      end;

--   procedure Creer_Fichier_Trie(T : in T_Trie) is
--      Procedure qui crée le fichier "liste-mot.txt" a partir du trie T
--      Le fichier créé est de la forme suivante
--      Mot1 Nbocc1
--      Mot2 NbOcc2
--      Dest : File_Type;
--   begin
--      Create(Dest, Name => "liste-mot.txt");
--      Put("Debut creation");
--      Ecriture_Dest(T, Dest);
--      New_Line(Dest);
--      Close(Dest);
--      New_Line;
--      Put_Line("Fin creation !");
--      Skip_Line;
--   end;

--   procedure Ecriture_Dest(T : in T_Trie; Dest : in File_Type) is
--   begin
--      if not TrieVide(T) then
--         for I in Tindice loop
--            if T.ST(I) /= null then
--               Put(Dest, I);
--               if T.ST(I).Mots > 0 then
--                  Put_Line(Dest, Integer'Image(T.ST(I).Mots));
--               end if;
--            end if;
--            Ecriture_Dest(T.ST(I), Dest);
--         end loop;
--      end if;
--   end;

   procedure Recup_Trie(T : in out T_Trie) is
   --procedure qui recrée le trie a partir du fichier "liste-mot.txt"
   --le fichier n'est pas passé en parametre car il sera créé auparavant par la fonction Creer_Fichier_Listemot
   --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
   --declenche une exception si le fichier n'existe pas
      Orig : File_Type;
      C : Character;
      Mot : String(1 .. 30);
      Indice : Integer;
      NbOcc : Integer;
      M : T_Mot;
   begin
      Indice := 0;
      if Existe("liste-mot.txt") then
         Open(Orig, In_File, "liste-mot.txt");
         Put("Debut recuperation");
         while not End_Of_File(Orig) loop
            if not End_Of_Line(Orig) then
               Get(Orig, C);
               if C /= Character'Val(32) then -- C /= ' '
                  Indice := Indice + 1;
                  Mot(Indice) := C;
               else
                  M := Creer_Mot(Mot(1 .. Indice));
                  Indice := 0;
                  while not End_Of_Line(Orig) loop
                     Get(Orig, C);
                     Indice := Indice + 1;
                     Mot(Indice) := C;
                  end loop;
                  NbOcc := Integer'Value(Mot(1 .. Indice));
                  Indice := 0;
               end if;
            else
               T := AjouterMot(T, M);
               --Set_NbOcc(T, NbOcc);
               Put(".");
               Skip_Line(Orig);
            end if;
         end loop;
         Close(Orig);
         New_Line;
         Put_Line("Fin recuperation !");
         Skip_Line;
      else
         Put_Line("Le fichier " & Character'Val(34) & "liste-mot.txt" & Character'Val(34) & " n'existe pas !");
      end if;
   end;

end Analyse_Lexicale_Trie;
