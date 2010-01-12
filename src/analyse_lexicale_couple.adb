with Analyse_Lexicale, Mot, Couple, Ada.Text_IO, Ada.Characters.Handling, Liste_Couple, Ada.Calendar;
use Analyse_Lexicale, Mot, Couple, Ada.Text_IO, Ada.Characters.Handling, Liste_Couple.L, Ada.Calendar;

package body Analyse_Lexicale_Couple is

   procedure Query_Liste_Couple (L: in out TListe_Couple; NomFic : in String) is
      -- Renvoit une liste comprenant tous les couples(mot;occurence) du fichier texte NomFic
      Orig : File_Type; -- Fichier source
      C : Character;
      Mot : String(1 .. 30);
      Indice : Integer;
      Couple : T_Couple;
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
                  Couple := Creer_Couple(M, 1);
                  --Set_Fin(Couple, Indice);
                  InsererTriee_Couple_Lex(L, Couple); -- Ajoute dans la liste le premier mot significatif
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
   
   function Query_NbOcc (L : TListe_Couple; M : String) return Integer is
      -- Requete renvoyant le nombre d'occurence du mot m dans le texte
   begin
      if EstVide(L) then
         return 0;
      elsif Compare_Chaine_Mot(M,Get_Mot(Valeur(L))) then
         return Get_NbOcc(Valeur(L));
      else
         return Query_NbOcc(Suivant(L), M);
      end if;
   end;

   procedure Query_NbPref (L : in TListe_Couple; S : in String; NbMot : out Integer; NbOcc : out Integer) is
      -- Requete renvoyant le nombre de mot ayant s pour préfixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
      Temp : TListe_Couple;
      Res : Integer;
      MotS : T_Mot;
   begin
      Res := 0;
      Temp := L;
      MotS := Creer_Mot(S);
      while not EstVide(Temp) loop
         if EstPrefixeDe(Get_Mot(Valeur(Temp)), MotS) then
            Res := Res + 1;
         end if;
         Temp := Suivant(Temp);
      end loop;
      NbMot := Res;
      NbOcc := Query_NbOcc(L, S);
   end;

   procedure Query_NbSuff (L : in TListe_Couple; S : in String; NbMot : out Integer; NbOcc : out Integer) is
      -- Requete renvoyant le nombre de mot ayant s pour suffixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
      Temp : TListe_Couple;
      Res : Integer;
      MotS : T_Mot;
   begin
      Res := 0;
      Temp := L;
      MotS := Creer_Mot(S);
      while not Estvide(Temp) loop
         if EstSuffixeDe(Get_Mot(Valeur(Temp)), MotS) then
            Res := Res + 1;
         end if;
         Temp := Suivant(Temp);
      end loop;
      NbMot := Res;
      NbOcc := Query_NbOcc(L, S);
   end;

   procedure Query_NbFact (L : in TListe_Couple; S : in String; NbMot : out Integer; NbOcc : out Integer) is
      -- Requete renvoyant le nombre de mot ayant s pour facteur et le nombre d'occurence de s (Appel de query_NbOcc(s))
      Temp : TListe_Couple;
      Res : Integer;
      MotS : T_Mot;
   begin
      Res := 0;
      Temp := L;
      MotS := Creer_Mot(S);
      while not EstVide(Temp) loop
         if EstFacteurDe(Get_Mot(Valeur(Temp)), MotS) then
            Res := Res + 1;
         end if;
         Temp := Suivant(Temp);
      end loop;
      NbMot := Res;
      NbOcc := Query_NbOcc(L, S);
   end;

   procedure Creer_Fichier_Listemot (L : in TListe_Couple) is
      --Procedure qui crée le fichier liste-mot.txt a partir de la liste de couple l
      --Le Fichier créé est de la forme suivante
      --Mot1 Nbocc1
      --Mot2 NbOcc2
      Dest : File_Type;
      Temp : TListe_Couple;
   begin
      Temp := L;
      Create(Dest, Name => "liste-mot.txt");
      Put("Debut creation");
      while not EstVide(Temp) loop
         Put(Dest, Get_Chaine(Get_Mot(Premier(Temp)))(1 .. Get_Fin(Get_Mot(Premier(Temp)))));
         Put_Line(Dest, Integer'Image(Get_NbOcc(Premier(Temp))));
         Temp := Suivant(Temp);
         Put(".");
      end loop;
      New_Line(Dest);
      Close(Dest);
      New_Line;
      Put_Line("Fin creation !");
      Skip_Line;
   end;

   procedure Recup_Liste (L : in out TListe_Couple) is
      --procedure qui recrée la liste de couple a partir du fichier "liste-mot.txt"
      --le fichier n'est pas passé en parametre car il sera créé auparavant par la fonction Creer_Fichier_Listemot
      --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
      --declenche une exception si le fichier n'existe pas
      Orig : File_Type;
      C : Character;
      Mot : String(1 .. 30);
      Indice : Integer;
      NbOcc : Integer;
      Couple : T_Couple;
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
               Couple := Creer_Couple(M, NbOcc);
               InsererTriee_Couple_Lex(L, Couple);
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

   procedure AffichageN (L : in TListe_Couple; N : in Integer) is
      -- affiche les N premiers mots de la liste
      Compteur : Integer;
      Temp : TListe_Couple;
   begin
      Compteur := 0;
      Temp := CopieTriee_Couple_Occ(L);
      while not EstVide(Temp) and then Compteur < N loop
         Imprime_Couple(Premier(Temp));
         Compteur := Compteur + 1;
         Temp := Suivant(Temp);
      end loop;
      New_Line;
   end;
   
end Analyse_Lexicale_Couple;
