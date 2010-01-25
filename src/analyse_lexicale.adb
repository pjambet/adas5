with Mot, Couple, Triplet, Liste_Couple, Liste_Triplet, Arbre_Binaire_Couple, Arbre_Binaire_Triplet, Trie, Ada.Text_IO, Ada.Characters.Handling, Ada.Calendar;
use Mot, Couple, Triplet, Liste_Couple.L, Liste_Triplet.LT, Arbre_Binaire_Couple.AB, Arbre_Binaire_Triplet.ABT, Trie, Ada.Text_IO, Ada.Characters.Handling, Ada.Calendar;

package body Analyse_Lexicale is

   function CaractereAutorise (C : in Character) return Boolean is
   begin
      if C = Character'Val(32) then -- ' '
         return False;
      elsif C = Character'Val(33) then -- '!'
         return False;
      elsif C = Character'Val(34) then -- '"'
         return False;
      elsif C = Character'Val(35) then -- '#'
         return False;
      elsif C = Character'Val(36) then -- '$'
         return False;
      elsif C = Character'Val(37) then -- '%'
         return False;
      elsif C = Character'Val(38) then -- '&'
         return False;
      elsif C = Character'Val(40) then -- '('
         return False;
      elsif C = Character'Val(41) then -- ')'
         return False;
      elsif C = Character'Val(42) then -- '*'
         return False;
      elsif C = Character'Val(43) then -- '+'
         return False;
      elsif C = Character'Val(44) then -- ','
         return False;
      elsif C = Character'Val(46) then -- '.'
         return False;
      elsif C = Character'Val(47) then -- '/'
         return False;
      elsif C = Character'Val(58) then -- ':'
         return False;
      elsif C = Character'Val(59) then -- ';'
         return False;
      elsif C = Character'Val(60) then -- '<'
         return False;
      elsif C = Character'Val(61) then -- '='
         return False;
      elsif C = Character'Val(62) then -- '>'
         return False;
      elsif C = Character'Val(63) then -- '?'
         return False;
      elsif C = Character'Val(64) then -- '@'
         return False;
      elsif C = Character'Val(91) then -- '['
         return False;
      elsif C = Character'Val(92) then -- '\'
         return False;
      elsif C = Character'Val(93) then -- ']'
         return False;
      elsif C = Character'Val(94) then -- '^'
         return False;
      elsif C = Character'Val(95) then -- '_'
         return False;
      elsif C = Character'Val(96) then -- '`'
         return False;
      elsif C = Character'Val(10) then -- LF
         return False;
      elsif C = Character'Val(13) then -- CR
         return False;
      else
         return True;
      end if;
   end;

   function Existe (Name : in String) return Boolean is
      File : File_Type;
   begin
      Open(File, In_File, Name);
      Close(File);
      return True;
   exception
      when Name_Error =>
         return False;
      when others =>
         raise;
   end Existe;

   -- #################################################################################

   procedure Query_Struct (L: in out TListe_Couple; NomFic : in String) is
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

   procedure Query_Struct_Txt1 (L : in out TListe_Triplet; NomFic : in String) is
      Orig : File_Type; -- Fichier source
      C : Character;
      Mot : String(1 .. 30);
      Indice : Integer;
      Triplet : T_Triplet;
      M : T_Mot;
   begin
      Indice := 0;
      C := Character'Val(0);
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
                  Triplet := Creer_Triplet(M, 1, 0);
                  InsererTriee_Triplet_Lex_Txt1(L, Triplet); -- Ajoute dans la liste le premier mot significatif
               end if;
               Indice := 0;
               C := Character'Val(0);
            end if;
         end if;
      end loop;
      Close(Orig);
      New_Line;
      Put_Line("Fin lecture !");
      Skip_Line;
   end;

   procedure Query_Struct_Txt2 (L : in out TListe_Triplet; NomFic : in String) is
      Orig : File_Type; -- Fichier source
      C : Character;
      Mot : String(1 .. 30);
      Indice : Integer;
      Triplet : T_Triplet;
      M : T_Mot;
   begin
      Indice := 0;
      C := Character'Val(0);
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
                  Triplet := Creer_Triplet(M, 0, 1);
                  InsererTriee_Triplet_Lex_Txt2(L, Triplet); -- Ajoute dans la liste le premier mot significatif
               end if;
               Indice := 0;
               C := Character'Val(0);
            end if;
         end if;
      end loop;
      Close(Orig);
      New_Line;
      Put_Line("Fin lecture !");
      Skip_Line;
   end;

   procedure Query_Struct (A : in out TABR_Couple; NomFic : in String) is
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
                  Inserer_ARN_Couple(A, Couple); -- Ajoute dans la liste le premier mot significatif
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

   procedure Query_Struct_Txt1 (A : in out TABR_Triplet; NomFic : in String) is
      Orig : File_Type; -- Fichier source
      C : Character;
      Mot : String(1 .. 30);
      Indice : Integer;
      Triplet : T_Triplet;
      M : T_Mot;

   begin
      Indice := 0;
      C := Character'Val(0);
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
                  Triplet := Creer_Triplet(M, 0, 1);
                  Inserer_ARN_Triplet_txt1(A, Triplet); -- Ajoute dans la liste le premier mot significatif
               end if;
               Indice := 0;
               C := Character'Val(0);
            end if;
         end if;
      end loop;
      Close(Orig);
      New_Line;
      Put_Line("Fin lecture !");
      Skip_Line;

   end;

   procedure Query_Struct_Txt2 (A : in out TABR_Triplet; NomFic : in String) is
      Orig : File_Type; -- Fichier source
      C : Character;
      Mot : String(1 .. 30);
      Indice : Integer;
      Triplet : T_Triplet;
      M : T_Mot;

   begin
      Indice := 0;
      C := Character'Val(0);
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
                  Triplet := Creer_Triplet(M, 0, 1);
                  Inserer_ARN_Triplet_Txt2(A, Triplet); -- Ajoute dans la liste le premier mot significatif
               end if;
               Indice := 0;
               C := Character'Val(0);
            end if;
         end if;
      end loop;
      Close(Orig);
      New_Line;
      Put_Line("Fin lecture !");
      Skip_Line;

   end;

   procedure Query_Struct_Txt1(T : in out T_Trie; NomFic : in String) is
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
                  T := AjouterMot_Txt1(T, M, 1); -- Ajoute dans le trie le premier mot significatif
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

   procedure Query_Struct_Txt2(T : in out T_Trie; NomFic : in String) is
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
                  T := AjouterMot_Txt2(T, M, 1); -- Ajoute dans le trie le premier mot significatif
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

   -- #################################################################################

   procedure Creer_Fichier (L : in TListe_Couple) is
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

   procedure Creer_Fichier (L : in TListe_Triplet) is
      Dest : File_Type;
      Temp : TListe_Triplet;
   begin
      Temp := L;
      Create(Dest, Name => "liste-mot2.txt");
      Put("Debut creation");
      while not EstVide(Temp) loop
         Put(Dest, Get_Chaine(Get_Mot_T(Premier(Temp)))(1 .. Get_Fin(Get_Mot_T(Premier(Temp)))));
         Put_Line(Dest, Integer'Image(Get_NbOcc_Txt1(Premier(Temp))) & Integer'Image(Get_NbOcc_Txt2(Premier(Temp))));
         Temp := Suivant(Temp);
         Put(".");
      end loop;
      New_Line(Dest); -- antibug
      Close(Dest);
      New_Line;
      Put_Line("Fin creation !");
      Skip_Line;
   end;

   procedure Creer_Fichier (A : in out TABR_Couple) is
   begin
      null;
   end;

   procedure Creer_Fichier (A : in out TABR_Triplet) is
   begin
      null;
   end;

   procedure Creer_Fichier_Txt1(T : in T_Trie) is
      Dest : File_Type;
      Chaine : String(1 .. 30);
   begin
      Put("Debut creation");
      Create(Dest, Name => "liste-mot.txt");
      Ecriture_Dest_Txt1(T, Chaine, 0, Dest);
      New_Line(Dest);
      New_Line;
      Put_Line("Fin creation !");
      Close(Dest);
      Skip_Line;
   end;

   procedure Creer_Fichier_Txt2(T : in T_Trie) is
      Dest : File_Type;
      Chaine : String(1 .. 30);
   begin
      Put("Debut creation");
      Create(Dest, Name => "liste-mot2.txt");
      Ecriture_Dest_Txt2(T, Chaine, 0, Dest);
      New_Line(Dest);
      New_Line;
      Put_Line("Fin creation !");
      Close(Dest);
      Skip_Line;
   end;

   -- #################################################################################
   
   procedure Ecriture_Dest_Txt1(T : in T_Trie; C : in String; F : in Natural; D : in File_Type) is
      Chaine : String(1 .. 30);
      Fin : Natural;
   begin
      if not TrieVide(T) then
         Chaine := C;
         Fin := F;
         for I in Tindice loop
            if not STVide(T, I) then
               if Get_Prefixes(Get_ST(T, I)) > 0 then
                  Fin := Fin + 1;
                  Chaine(Fin) := I;
               end if;
               if Get_NbOcc_Txt1(Get_ST(T, I)) > 0 then -- nbOcc = 1 ou +
                  Put(".");
                  Put(D, Chaine(Chaine'First .. Fin));
                  Put_Line(D, Integer'Image(Get_NbOcc_Txt1(Get_ST(T, I))));
               end if;
               Ecriture_Dest_Txt1(Get_ST(T, I), Chaine, Fin, D);
               Fin := Fin - 1;
            end if;
         end loop;
      end if;
   end;

   procedure Ecriture_Dest_Txt2(T : in T_Trie; C : in String; F : in Natural; D : in File_Type) is
      Chaine : String(1 .. 30);
      Fin : Natural;
   begin
      if not TrieVide(T) then
         Chaine := C;
         Fin := F;
         for I in Tindice loop
            if not STVide(T, I) then
               if Get_Prefixes(Get_ST(T, I)) > 0 then
                  Fin := Fin + 1;
                  Chaine(Fin) := I;
               end if;
               if Get_NbOcc_Txt1(Get_ST(T, I)) > 0 or else Get_NbOcc_Txt2(Get_ST(T, I)) > 0 then -- nbOccTxt1 = 1+ ou nbOccTxt2 = 1+
                  Put(".");
                  Put(D, Chaine(Chaine'First .. Fin));
                  Put_Line(D, Integer'Image(Get_NbOcc_Txt1(Get_ST(T, I))) & Integer'Image(Get_NbOcc_Txt2(Get_ST(T, I))));
               end if;
               Ecriture_Dest_Txt2(Get_ST(T, I), Chaine, Fin, D);
               Fin := Fin - 1;
            end if;
         end loop;
      end if;
   end;

   -- #################################################################################

   procedure Recup_Fichier (L : in out TListe_Couple) is
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

   procedure Recup_Fichier (L : in out TListe_Triplet) is
      Orig : File_Type;
      C : Character;
      Mot : String(1 .. 30);
      Indice : Integer;
      NbOcc1 : Integer;
      NbOcc2 : Integer;
      Triplet : T_Triplet;
      M : T_Mot;
   begin
      Indice := 0;
      if Existe("liste-mot2.txt") then
         Open(Orig, In_File, "liste-mot2.txt");
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
                  loop
                     Get(Orig, C);
                     Indice := Indice + 1;
                     Mot(Indice) := C;
                     exit when C = Character'Val(32); -- C = ' '
                  end loop;
                  NbOcc1 := Integer'Value(Mot(1 .. Indice));
                  Indice := 0;
                  while not End_Of_Line(Orig) loop
                     Get(Orig, C);
                     Indice := Indice + 1;
                     Mot(Indice) := C;
                  end loop;
                  NbOcc2 := Integer'Value(Mot(1 .. Indice));
                  Indice := 0;
               end if;
            else
               Triplet := Creer_Triplet(M, NbOcc1, NbOcc2);
               InsererTriee_Triplet_OccS(L, Triplet);
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

   procedure Recup_Fichier (A : in out TABR_Couple) is
   begin
      null;
   end;

   procedure Recup_Fichier (A : in out TABR_Triplet) is
   begin
      null;
   end;

   procedure Recup_Fichier_Txt1(T : in out T_Trie) is
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
               T := AjouterMot_Txt1(T, M, NbOcc);
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

   procedure Recup_Fichier_Txt2(T : in out T_Trie) is
      Orig : File_Type;
      C : Character;
      Mot : String(1 .. 30);
      Indice : Integer;
      NbOcc1 : Integer;
      NbOcc2 : Integer;
      M : T_Mot;
   begin
      Indice := 0;
      if Existe("liste-mot2.txt") then
         Open(Orig, In_File, "liste-mot2.txt");
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
                  loop
                     Get(Orig, C);
                     Indice := Indice + 1;
                     Mot(Indice) := C;
                     exit when C = Character'Val(32); -- C = ' '
                  end loop;
                  NbOcc1 := Integer'Value(Mot(1 .. Indice));
                  Indice := 0;
                  while not End_Of_Line(Orig) loop
                     Get(Orig, C);
                     Indice := Indice + 1;
                     Mot(Indice) := C;
                  end loop;
                  NbOcc2 := Integer'Value(Mot(1 .. Indice));
                  Indice := 0;
               end if;
            else
               T := AjouterMot_Txt1(T, M, NbOcc1);
               T := AjouterMot_Txt2(T, M, NbOcc2);
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

   -- #################################################################################

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


   procedure AffichageN (L : in TListe_Triplet; N : in Integer) is
      -- affiche les N premiers mots de la liste
      Compteur : Integer;
      Temp : TListe_Triplet;
   begin
      Compteur := 0;
      Temp := CopieTriee_Triplet_OccS(L);
      while not EstVide(Temp) and then Compteur < N loop
         Imprime_Triplet(Premier(Temp));
         Compteur := Compteur + 1;
         Temp := Suivant(Temp);
      end loop;
      New_Line;
   end;

   procedure AffichageN (A : in TABR_Couple; N : in Integer) is
   begin
      null;
   end;
      
   procedure AffichageN (A : in TABR_Triplet; N : in Integer) is
   begin
      null;
   end;
   
   procedure AffichageN (T : in T_Trie; N : in Integer; C : in String; F : in Natural) is
      -- affiche les N premiers mots du trie
      Chaine : String(1 .. 30);
      Fin : Natural;
   begin
      if not TrieVide(T) and then N > 0 then
         Chaine := C;
         Fin := F;
         for I in Tindice loop
            if not STVide(T, I) then
               if Get_Prefixes(Get_ST(T, I)) > 0 then
                  Fin := Fin + 1;
                  Chaine(Fin) := I;
               end if;
               if Get_NbOcc_Txt1(Get_ST(T, I)) > 0 then -- nbOcc = 1 ou +
                  Put(Chaine(Chaine'First .. Fin));
                  Put_Line(Integer'Image(Get_NbOcc_Txt1(Get_ST(T, I))));
               end if;
               AffichageN(Get_ST(T, I), N-1, Chaine, Fin);
               Fin := Fin - 1;
            end if;
         end loop;
      end if;
   end;
   
   -- #################################################################################


   function Query_NbOcc_Txt1 (L : TListe_Triplet; M : T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif Compare_Mots(M, Get_Mot_T(Valeur(L))) then
         return Get_NbOcc_Txt1(Valeur(L));
      else
         return Query_NbOcc_Txt1(Suivant(L), M);
      end if;
   end;

   function Query_NbOcc_Txt2 (L : TListe_Triplet; M : T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif Compare_Mots(M, Get_Mot_T(Valeur(L))) then
         return Get_NbOcc_Txt2(Valeur(L));
      else
         return Query_NbOcc_Txt2(Suivant(L), M);
      end if;
   end;

   function Query_NbOcc_Txt1 (A : TABR_Triplet; M : T_Mot) return Integer is
   begin
      return 0;
   end;
   
   function Query_NbOcc_Txt2 (A : TABR_Triplet; M : T_Mot) return Integer is
   begin
      return 0;
   end;

   function Query_Nbocc_Txt1(T : in T_Trie; M : in T_Mot) return Integer is
      C : Character;
      Mot : T_Mot;
   begin
      if TrieVide(T) then
         return 0;
      elsif MotVide(M) then
         return Get_NbOcc_Txt1(T);
      else
         C := Get_Char(M);
         Mot := Get_CharSuffixe(M);
         return Query_NbOcc_Txt1(Get_ST(T, C), Mot);
      end if;
   end;

   function Query_NbOcc_Txt2(T : in T_Trie; M : in T_Mot) return Integer is
      C : Character;
      Mot : T_Mot;
   begin
      if TrieVide(T) then
         return 0;
      elsif MotVide(M) then
         return Get_NbOcc_Txt2(T);
      else
         C := Get_Char(M);
         Mot := Get_CharSuffixe(M);
         return Query_Nbocc_Txt2(Get_ST(T, C), Mot);
      end if;
   end;

   -- #################################################################################
   
   procedure Query_Intersection (L : in TListe_Triplet) is
      Temp : TListe_Triplet;
   begin
      Temp := L;
      while not EstVide(Temp) loop
         if (Get_NbOcc_Txt1(Premier(Temp)) /= 0) and then (Get_NbOcc_Txt2(Premier(Temp)) /= 0) then
            Imprime_Triplet(Premier(Temp));
         end if;
         Temp := Suivant(Temp);
      end loop;
      New_Line;
   end;

   procedure Query_Intersection (A : in TABR_Triplet) is
   begin
      null;
   end;

   procedure Query_Intersection (T : in T_Trie; C : in String; F : in Natural) is
      -- affiche les mots communs de deux auteurs
      Chaine : String(1 .. 30);
      Fin : Natural;
   begin
      if not TrieVide(T) then
         Chaine := C;
         Fin := F;
         for I in Tindice loop
            if not STVide(T, I) then
               if Get_Prefixes(Get_ST(T, I)) > 0 then
                  Fin := Fin + 1;
                  Chaine(Fin) := I;
               end if;
               if (Get_NbOcc_Txt1(Get_ST(T, I)) /= 0) and then (Get_NbOcc_Txt2(Get_ST(T, I)) /= 0) then -- nbOcc = 1 ou +
                  Put(Chaine(Chaine'First .. Fin));
                  Put_Line(Integer'Image(Get_NbOcc_Txt1(Get_ST(T, I))) & Integer'Image(Get_NbOcc_Txt2(Get_ST(T, I))));
               end if;
               Query_Intersection(Get_ST(T, I), Chaine, Fin);
               Fin := Fin - 1;
            end if;
         end loop;
      end if;
   end;
   
   -- #################################################################################
   
   procedure Query_Difference (L : in TListe_Triplet) is
      Temp : TListe_Triplet;
   begin
      Temp := L;
      while not EstVide(Temp) loop
         if (Get_NbOcc_Txt1(Premier(Temp)) /= 0) xor (Get_NbOcc_Txt2(Premier(Temp)) /= 0) then
            Imprime_Triplet(Premier(Temp));
         end if;
         Temp := Suivant(Temp);
      end loop;
      New_Line;
   end;
   
   procedure Query_Difference (A : in TABR_Triplet) is
   begin
      null;
   end;

   procedure Query_Difference (T : in T_Trie; C : in String; F : in Natural) is
      -- affiche les mots d'un auteur et pas de l'autre (et vice versa)
      Chaine : String(1 .. 30);
      Fin : Natural;
   begin
      if not TrieVide(T) then
         Chaine := C;
         Fin := F;
         for I in Tindice loop
            if not STVide(T, I) then
               if Get_Prefixes(Get_ST(T, I)) > 0 then
                  Fin := Fin + 1;
                  Chaine(Fin) := I;
               end if;
               if (Get_NbOcc_Txt1(Get_ST(T, I)) /= 0) xor (Get_NbOcc_Txt2(Get_ST(T, I)) /= 0) then -- nbOcc = 1 ou +
                  Put(Chaine(Chaine'First .. Fin));
                  Put_Line(Integer'Image(Get_NbOcc_Txt1(Get_ST(T, I))) & Integer'Image(Get_NbOcc_Txt2(Get_ST(T, I))));
               end if;
               Query_Difference(Get_ST(T, I), Chaine, Fin);
               Fin := Fin - 1;
            end if;
         end loop;
      end if;
   end;

end Analyse_Lexicale;
