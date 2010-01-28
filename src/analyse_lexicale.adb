with Mot, Couple, Triplet, Liste_Couple, Liste_Triplet, Arbre_Binaire_Couple, Arbre_Binaire_Triplet, Trie, Ada.Text_IO, Ada.Characters.Handling, Ada.Calendar;
use Mot, Couple, Triplet, Liste_Couple.L, Liste_Triplet.LT, Arbre_Binaire_Couple.AB, Arbre_Binaire_Triplet.ABT, Trie, Ada.Text_IO, Ada.Characters.Handling, Ada.Calendar;

package body Analyse_Lexicale is

   function CaractereAutorise (C : in Character) return Boolean is
   begin
      return (C >= Character'Val(97) and then C <= Character'Val(122)) or else C = Character'Val(45) or else C = Character'Val(39); -- >= a or <= z or - or '	  
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
            if Is_Upper(C) then
               C := To_Lower(C);
            end if;			
            if CaractereAutorise(C) then -- On crée le mot
               Indice := Indice + 1;
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
            if Is_Upper(C) then
               C := To_Lower(C);
            end if;			
            if CaractereAutorise(C) then -- On crée le mot
               Indice := Indice + 1;
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
            if Is_Upper(C) then
               C := To_Lower(C);
            end if;			
            if CaractereAutorise(C) then -- On crée le mot			
               Indice := Indice + 1;
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
            if Is_Upper(C) then
               C := To_Lower(C);
            end if;			
            if CaractereAutorise(C) then -- On crée le mot
               Indice := Indice + 1;
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
            if Is_Upper(C) then
               C := To_Lower(C);
            end if;			
            if CaractereAutorise(C) then -- On crée le mot
               Indice := Indice + 1;
               Mot(Indice) := C;
            else -- non(CaractereAutorise(C))
               Put(".");
               M := Creer_Mot(Mot(1 .. Indice));
               if EstMotSignificatif(M) then
                  Triplet := Creer_Triplet(M, 1, 0);
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
            if Is_Upper(C) then
               C := To_Lower(C);
            end if;			
            if CaractereAutorise(C) then -- On crée le mot
               Indice := Indice + 1;
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
            if Is_Upper(C) then
               C := To_Lower(C);
            end if;			
            if CaractereAutorise(C) then -- On crée le mot
               Indice := Indice + 1;
               Mot(Indice) := C;
            else -- non(CaractereAutorise(C))
               Put(".");
               M := Creer_Mot(Mot(1 .. Indice));
               if EstMotSignificatif(M) then
                  T := AjouterMot_Txt1(T, M, 1, Indice); -- Ajoute dans le trie le premier mot significatif
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
            if Is_Upper(C) then
               C := To_Lower(C);
            end if;			
            if CaractereAutorise(C) then -- On crée le mot
               Indice := Indice + 1;
               Mot(Indice) := C;
            else -- non(CaractereAutorise(C))
               Put(".");
               M := Creer_Mot(Mot(1 .. Indice));
               if EstMotSignificatif(M) then
                  T := AjouterMot_Txt2(T, M, 1, Indice); -- Ajoute dans le trie le premier mot significatif
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
         Put(Dest, Get_Chaine(Get_Mot(Premier(Temp)))(1 .. Get_Fin(Get_Mot(Premier(Temp)))));
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
      Dest : File_Type;      
   begin     
      Create(Dest, Name => "liste-mot.txt");      
      Put("Debut creation");
      Ecriture_Dest_Txt1(A, Dest);
      New_Line(Dest);
      New_Line;
      Put_Line("Fin creation !");
      Close(Dest);
      Skip_Line;
   end;

   procedure Creer_Fichier (A : in out TABR_Triplet) is
      Dest : File_Type;
   begin
      Create(Dest, Name => "liste-mot2.txt");
      Put("Debut creation");
      Ecriture_Dest_Txt2(A, Dest);
      New_Line(Dest);
      New_Line;
      Put_Line("Fin creation !");
      Close(Dest);
      Skip_Line;
   end;

   procedure Creer_Fichier_Txt1(T : in T_Trie) is
      Dest : File_Type;
      Chaine : String(1 .. 30);
   begin
      Chaine := "                              "; --anti-warning
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
      Chaine := "                              "; --anti-warning
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

   procedure Ecriture_Dest_Txt1(AB : in TABR_Couple; D : in File_Type) is      
   begin
      if not Arbre_Vide(AB) then
         Ecriture_Dest_Txt1(sag(ab),D);
         Put(".");
         Put(D, Get_Chaine(Get_Mot(Lire_Racine(AB)))(1 .. Get_Fin(Get_Mot(Lire_Racine(AB)))));
         Put_Line(D, Integer'Image(Get_Nbocc(Lire_Racine(AB))));
         Ecriture_Dest_Txt1(sad(ab),D);
      end if;
   end;

   procedure Ecriture_Dest_Txt2(AB : in TABR_Triplet; D : in File_Type) is      
   begin
      if not Arbre_Vide(AB) then
         Ecriture_Dest_Txt2(sag(ab),D);
         Put(".");
         Put(D, Get_Chaine(Get_Mot(Lire_Racine(AB)))(1 .. Get_Fin(Get_Mot(Lire_Racine(AB)))));
         Put_Line(D, Integer'Image(Get_Nbocc_Txt1(Lire_Racine(AB))) & Integer'Image(Get_NbOcc_Txt2(Lire_racine(AB))));
         Ecriture_Dest_Txt2(sad(ab),D);
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
               Inserer_ARN_Couple(A, Couple);
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

   procedure Recup_Fichier (A : in out TABR_Triplet) is
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
               Inserer_ARN_Triplet_OccS(A, Triplet);
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

   procedure Recup_Fichier_Txt1(T : in out T_Trie) is
      Orig : File_Type;
      C : Character;
      Mot : String(1 .. 30);
      Indice, NbOcc : Integer;
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
               T := AjouterMot_Txt1(T, M, NbOcc, 0);
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
               T := AjouterMot_Txt1(T, M, NbOcc1, Indice);
               T := AjouterMot_Txt2(T, M, NbOcc2, Indice);
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

   procedure ABRToListe(A : in TABR_Couple; L : in out TListe_Couple) is
   begin
      if not Arbre_Vide(A) then
         InsererTriee_Couple_Occ(L, Lire_Racine(A));
         ABRToListe(SAG(A),L);    
         ABRToListe(SAD(A),L);    
      end if;
   end ABRToListe;
      
   procedure ABRToListe(A : in TABR_Triplet; L : in out TListe_Triplet) is
   begin
      if not Arbre_Vide(A) then
         InsererTriee_Triplet_OccS(L, Lire_Racine(A));
         ABRToListe(SAG(A),L);
         ABRToListe(SAD(A),L);    
         end if;
   end ABRToListe;
   
   procedure TrieToListe_Txt1 (T : T_Trie; L : in out TListe_Couple; C : in String; F : in Natural) is
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
			   if Get_NbOcc_Txt1(Get_ST(T, I)) > 0 then
			      InsererTriee_Couple_Occ(L, Creer_Couple(Creer_Mot(Chaine), Get_NbOcc_Txt1(Get_ST(T, I))));

			   end if;
			   TrieToListe_Txt1(Get_ST(T, I), L, Chaine, Fin);
			   Fin := Fin - 1;
			end if;
	     end loop;
	  end if;
   end;

   procedure TrieToListe_Txt2 (T : T_Trie; L : in out TListe_Triplet; C : in String; F : in Natural) is
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
			   if Get_NbOcc_Txt1(Get_ST(T, I)) > 0 or Get_NbOcc_Txt2(Get_ST(T, I)) > 0 then
			      InsererTriee_Triplet_OccS(L, Creer_Triplet(Creer_Mot(Chaine), Get_NbOcc_Txt1(Get_ST(T, I)), Get_NbOcc_Txt2(Get_ST(T, I))));
			   end if;
			   TrieToListe_Txt2(Get_ST(T, I), L, Chaine, Fin);
			   Fin := Fin - 1;
			end if;
	     end loop;
	  end if;
   end;

   procedure AffichageN (A : in Tabr_Couple; N : in Integer) is
      L : TListe_Couple;
      Temp : TListe_Couple;
      Compteur : Integer;
   begin
      L := CreerListe;
      ABRToListe(A,L);      
      Temp := L;
      Compteur := 0;
      while not EstVide(Temp) and then Compteur < N loop
         Imprime_Couple(Premier(Temp));
         Compteur := Compteur + 1;
         Temp := Suivant(Temp);
      end loop;
      New_Line;               
   end AffichageN;
      
   procedure AffichageN (A : in TABR_Triplet; N : in Integer) is
      L : TListe_Triplet;
      Temp : TListe_Triplet;
      Compteur : Integer;
   begin
      L := CreerListe;
      ABRToListe(A,L);      
      Temp := L;
      Compteur := 0;
      while not EstVide(Temp) and then Compteur < N loop
         Imprime_Triplet(Premier(Temp));
         Compteur := Compteur + 1;
         Temp := Suivant(Temp);
      end loop;
      New_Line;               
   end AffichageN;

   procedure AffichageN_Txt1 (T : in T_Trie; N : in Integer) is
      L : TListe_Couple;
      Temp : TListe_Couple;
      Compteur : Integer;
      Chaine : String(1 .. 30);
   begin
      L := CreerListe;
      TrieToListe_Txt1(T, L, Chaine, 0);
      Temp := L;
      Compteur := 0;
      Chaine := "                              ";
      while not EstVide(Temp) and then Compteur < N loop
         Imprime_Couple(Premier(Temp));
         Compteur := Compteur + 1;
         Temp := Suivant(Temp);
      end loop;
      New_Line;               
   end AffichageN_Txt1;
   
   procedure AffichageN_Txt2 (T : in T_Trie; N : in Integer) is
      L : TListe_Triplet;
      Temp : TListe_Triplet;
      Compteur : Integer;
      Chaine : String(1 .. 30);
   begin
      L := CreerListe;
      TrieToListe_Txt2(T, L, Chaine, 0);
      Temp := L;
      Compteur := 0;
      Chaine := "                              ";
      while not EstVide(Temp) and then Compteur < N loop
         Imprime_Triplet(Premier(Temp));
         Compteur := Compteur + 1;
         Temp := Suivant(Temp);
      end loop;
      New_Line;               
   end AffichageN_Txt2;

   -- #################################################################################

   function Query_NbOcc (L : in TListe_Couple; M : in T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif Compare_Mots(M, Get_Mot(Valeur(L))) then
         return Get_NbOcc(Valeur(L));
      else
         return Query_NbOcc(Suivant(L), M);
      end if;
   end;

   function Query_NbOcc_Txt1 (L : in TListe_Triplet; M : in T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif Compare_Mots(M, Get_Mot(Valeur(L))) then
         return Get_NbOcc_Txt1(Valeur(L));
      else
         return Query_NbOcc_Txt1(Suivant(L), M);
      end if;
   end;

   function Query_NbOcc_Txt2 (L : in TListe_Triplet; M : in T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif Compare_Mots(M, Get_Mot(Valeur(L))) then
         return Get_NbOcc_Txt2(Valeur(L));
      else
         return Query_NbOcc_Txt2(Suivant(L), M);
      end if;
   end;

   function Query_NbOcc (A : in TABR_Couple; M : in T_Mot) return Integer is
      C : T_Couple;
   begin
      if Arbre_Vide(A) then
         return 0;
      else
         Set_Mot(C, M);
         if Arbre_Vide(Recherche_ABR(A,C)) then
            return 0;
         else
            return Get_NbOcc (Lire_Racine(Recherche_ABR(A, C)));
         end if;
      end if;
   end;

   function Query_NbOcc_Txt1 (A : in TABR_Triplet; M : in T_Mot) return Integer is
      C : T_Triplet;
   begin
      if Arbre_Vide(A) then
         return 0;
      else
         Set_Mot(C, M);
         if Arbre_Vide(Recherche_ABR(A,C)) then
            return 0;
         else
            return Get_NbOcc_Txt1(Lire_Racine(Recherche_ABR(A, C)));
         end if;
      end if;
   end;
   
   function Query_NbOcc_Txt2 (A : in TABR_Triplet; M : in T_Mot) return Integer is
      C : T_Triplet;
   begin
      if Arbre_Vide(A) then
         return 0;
      else
         Set_Mot(C, M);
         if Arbre_Vide(Recherche_ABR(A,C)) then
            return 0;
         else
            return Get_NbOcc_Txt2(Lire_Racine(Recherche_ABR(A, C)));
         end if;
      end if;
   end;

   function Query_NbOcc_Txt1(T : in T_Trie; M : in T_Mot) return Integer is
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

   function Query_NbPref (L : in TListe_Couple; M : in T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif EstPrefixeDe(M, Get_Mot(Valeur(L))) then
         return 1 + Query_NbPref(Suivant(L), M);
      else
         return Query_NbPref(Suivant(L), M);
      end if;
   end;

   function Query_NbPref_Txt1 (L : in TListe_Triplet; M : in T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif Get_NbOcc_Txt1(Valeur(L)) > 0 and then EstPrefixeDe(M, Get_Mot(Valeur(L))) then
         return 1 + Query_NbPref_Txt1(Suivant(L), M);
      else
         return Query_NbPref_Txt1(Suivant(L), M);
      end if;
   end;

   function Query_NbPref_Txt2 (L : in TListe_Triplet; M : in T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif Get_NbOcc_Txt2(Valeur(L)) > 0 and then EstPrefixeDe(M, Get_Mot(Valeur(L))) then
         return 1 + Query_NbPref_Txt2(Suivant(L), M);
      else
         return Query_NbPref_Txt2(Suivant(L), M);
      end if;
   end;

   function Query_NbPref (A : in TABR_Couple; M : in T_Mot) return Integer is
   begin
      if Arbre_Vide(A) then
         return 0;
      elsif EstPrefixeDe(M, Get_Mot(Lire_Racine(A))) then
         return 1 + Query_NbPref(SAG(A),M) + Query_NbPref(SAD(A),M);
      else
         return Query_NbPref(SAG(A),M) + Query_NbPref(SAD(A),M);
      end if; 
   end;

   function Query_NbPref_Txt1 (A : in TABR_Triplet; M : in T_Mot) return Integer is
   begin
      if Arbre_Vide(A) then
         return 0;
      elsif Get_NbOcc_Txt1(Lire_Racine(A)) > 0 and then EstPrefixeDe(M, Get_Mot(Lire_Racine(A))) then
         return 1 + Query_NbPref_Txt1(SAG(A),M) + Query_NbPref_Txt1(SAD(A),M);
      else
         return Query_NbPref_Txt1(SAG(A),M) + Query_NbPref_Txt1(SAD(A),M);
      end if; 
   end;

   function Query_NbPref_Txt2 (A : in TABR_Triplet; M : in T_Mot) return Integer is
   begin
      if Arbre_Vide(A) then
         return 0;
      elsif Get_NbOcc_Txt2(Lire_Racine(A)) > 0 and then EstPrefixeDe(M, Get_Mot(Lire_Racine(A))) then
         return 1 + Query_NbPref_Txt2(SAG(A),M) + Query_NbPref_Txt2(SAD(A),M);
      else
         return Query_NbPref_Txt2(SAG(A),M) + Query_NbPref_Txt2(SAD(A),M);
      end if; 
   end;

   procedure Query_NbPref_Txt1 (T : in T_Trie; C : in String; F : in Natural; M : in T_Mot; S : in out Integer) is
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
               if Get_NbOcc_Txt1(Get_ST(T, I)) > 0 and then EstPrefixeDe(M, Creer_Mot(Chaine)) then
                  S := S + 1;
               end if;
               Query_NbPref_Txt1(Get_ST(T, I), Chaine, Fin, M, S);
               Fin := Fin - 1;
            end if;
         end loop;
      end if;
   end;

   procedure Query_NbPref_Txt2 (T : in T_Trie; C : in String; F : in Natural; M : in T_Mot; S : in out Integer) is
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
               if Get_NbOcc_Txt2(Get_ST(T, I)) > 0 and then EstPrefixeDe(M, Creer_Mot(Chaine)) then
                  S := S + 1;
               end if;
               Query_NbPref_Txt2(Get_ST(T, I), Chaine, Fin, M, S);
               Fin := Fin - 1;
            end if;
         end loop;
      end if;
   end;

   -- #################################################################################

   function Query_NbSuff (L : in TListe_Couple; M : in T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif EstSuffixeDe(M, Get_Mot(Valeur(L))) then
         return 1 + Query_NbSuff(Suivant(L), M);
      else
         return Query_NbSuff(Suivant(L), M);
      end if;
   end;

   function Query_NbSuff_Txt1 (L : in TListe_Triplet; M : in T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif Get_NbOcc_Txt1(Valeur(L)) > 0 and then EstSuffixeDe(M, Get_Mot(Valeur(L))) then
         return 1 + Query_NbSuff_Txt1(Suivant(L), M);
      else
         return Query_NbSuff_Txt1(Suivant(L), M);
      end if;
   end;

   function Query_NbSuff_Txt2 (L : in TListe_Triplet; M : in T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif Get_NbOcc_Txt2(Valeur(L)) > 0 and then EstSuffixeDe(M, Get_Mot(Valeur(L))) then
         return 1 + Query_NbSuff_Txt2(Suivant(L), M);
      else
         return Query_NbSuff_Txt2(Suivant(L), M);
      end if;
   end;

   function Query_NbSuff (A : in TABR_Couple; M : in T_Mot) return Integer is
   begin
      if Arbre_Vide(A) then
         return 0;
      elsif EstSuffixeDe(M, Get_Mot(Lire_Racine(A))) then
         return 1 + Query_NbSuff(sag(A),M) + Query_NbSuff(sad(A),M);
      else
         return Query_NbSuff(sag(A),M) + Query_NbSuff(sad(A),M);
      end if; 
   end;

   function Query_NbSuff_Txt1 (A : in TABR_Triplet; M : in T_Mot) return Integer is
   begin
      if Arbre_Vide(A) then
         return 0;
      elsif Get_NbOcc_Txt1(Lire_Racine(A)) > 0 and then EstSuffixeDe(M, Get_Mot(Lire_Racine(A))) then
         return 1 + Query_NbSuff_Txt1(sag(A),M) + Query_NbSuff_Txt1(sad(A),M);
      else
         return Query_NbSuff_Txt1(sag(A),M) + Query_NbSuff_Txt1(sad(A),M);
      end if; 
   end;

   function Query_NbSuff_Txt2 (A : in TABR_Triplet; M : in T_Mot) return Integer is
   begin
      if Arbre_Vide(A) then
         return 0;
      elsif Get_NbOcc_Txt2(Lire_Racine(A)) > 0 and then EstSuffixeDe(M, Get_Mot(Lire_Racine(A))) then
         return 1 + Query_NbSuff_Txt2(sag(A),M) + Query_NbSuff_Txt2(sad(A),M);
      else
         return Query_NbSuff_Txt2(sag(A),M) + Query_NbSuff_Txt2(sad(A),M);
      end if; 
   end;

   procedure Query_NbSuff_Txt1 (T : in T_Trie; C : in String; F : in Natural; M : in T_Mot; S : in out Integer) is
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
               if Get_NbOcc_Txt1(Get_ST(T, I)) > 0 and then EstSuffixeDe(M, Creer_Mot(Chaine)) then
                  S := S + 1;
               end if;
               Query_NbSuff_Txt1(Get_ST(T, I), Chaine, Fin, M, S);
               Fin := Fin - 1;
            end if;
         end loop;
      end if;
   end;

   procedure Query_NbSuff_Txt2 (T : in T_Trie; C : in String; F : in Natural; M : in T_Mot; S : in out Integer) is
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
               if Get_NbOcc_Txt2(Get_ST(T, I)) > 0 and then EstSuffixeDe(M, Creer_Mot(Chaine)) then
                  S := S + 1;
               end if;
               Query_NbSuff_Txt2(Get_ST(T, I), Chaine, Fin, M, S);
               Fin := Fin - 1;
            end if;
         end loop;
      end if;
   end;

   -- #################################################################################

   function Query_NbFact (L : in TListe_Couple; M : in T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif EstFacteurDe(M, Get_Mot(Valeur(L))) then
         return 1 + Query_NbFact(Suivant(L), M);
      else
         return Query_NbFact(Suivant(L), M);
      end if;
   end;

   function Query_NbFact_Txt1 (L : in TListe_Triplet; M : in T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif Get_NbOcc_Txt1(Valeur(L)) > 0 and then EstFacteurDe(M, Get_Mot(Valeur(L))) then
         return 1 + Query_NbFact_Txt1(Suivant(L), M);
      else
         return Query_NbFact_Txt1(Suivant(L), M);
      end if;
   end;

   function Query_NbFact_Txt2 (L : in TListe_Triplet; M : in T_Mot) return Integer is
   begin
      if EstVide(L) then
         return 0;
      elsif Get_NbOcc_Txt2(Valeur(L)) > 0 and then EstFacteurDe(M, Get_Mot(Valeur(L))) then
         return 1 + Query_NbFact_Txt2(Suivant(L), M);
      else
         return Query_NbFact_Txt2(Suivant(L), M);
      end if;
   end;

   function Query_NbFact (A : in TABR_Couple; M : in T_Mot) return Integer is
   begin
      if Arbre_Vide(A) then
         return 0;
      elsif EstFacteurDe(M, Get_Mot(Lire_Racine(A))) then
         return 1 + Query_NbFact(SAG(A),M) + Query_NbFact(SAD(A),M);
      else
         return Query_NbFact(SAG(A),M) + Query_NbFact(SAD(A),M);
      end if; 
   end;

   function Query_NbFact_Txt1 (A : in TABR_Triplet; M : in T_Mot) return Integer is
   begin
      if Arbre_Vide(A) then
         return 0;
      elsif Get_NbOcc_Txt1(Lire_Racine(A)) > 0 and then EstFacteurDe(M, Get_Mot(Lire_Racine(A))) then
         return 1 + Query_NbFact_Txt1(SAG(A),M) + Query_NbFact_Txt1(SAD(A),M);
      else
         return Query_NbFact_Txt1(SAG(A),M) + Query_NbFact_Txt1(SAD(A),M);
      end if; 
   end;

   function Query_NbFact_Txt2 (A : in TABR_Triplet; M : in T_Mot) return Integer is
   begin
      if Arbre_Vide(A) then
         return 0;
      elsif Get_NbOcc_Txt2(Lire_Racine(A)) > 0 and then EstFacteurDe(M, Get_Mot(Lire_Racine(A))) then
         return 1 + Query_NbFact_Txt2(SAG(A),M) + Query_NbFact_Txt2(SAD(A),M);
      else
         return Query_NbFact_Txt2(SAG(A),M) + Query_NbFact_Txt2(SAD(A),M);
      end if; 
   end;

   procedure Query_NbFact_Txt1 (T : in T_Trie; C : in String; F : in Natural; M : in T_Mot; S : in out Integer) is
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
               if Get_NbOcc_Txt1(Get_ST(T, I)) > 0 and then EstFacteurDe(M, Creer_Mot(Chaine)) then
                  S := S + 1;
               end if;
               Query_NbFact_Txt1(Get_ST(T, I), Chaine, Fin, M, S);
               Fin := Fin - 1;
            end if;
         end loop;
      end if;
   end;

   procedure Query_NbFact_Txt2 (T : in T_Trie; C : in String; F : in Natural; M : in T_Mot; S : in out Integer) is
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
               if Get_NbOcc_Txt2(Get_ST(T, I)) > 0 and then EstFacteurDe(M, Creer_Mot(Chaine)) then
                  S := S + 1;
               end if;
               Query_NbFact_Txt2(Get_ST(T, I), Chaine, Fin, M, S);
               Fin := Fin - 1;
            end if;
         end loop;
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
   end;

   procedure Query_Intersection (A : in TABR_Triplet) is
   begin
      if not Arbre_Vide(A) then
         Query_Intersection(SAG(A));
         if (Get_NbOcc_Txt1(Lire_Racine(A)) /= 0) and then (Get_NbOcc_Txt2(Lire_Racine(A)) /= 0) then
               Imprime_Triplet(Lire_Racine(A));
         end if;      
         Query_Intersection(SAD(A));
      end if;
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
      if not Arbre_Vide(A) then
         Query_Difference(Sag(A));
         --Put("Affichage du mot");
         --Imprime_Triplet(Lire_Racine(A));
         if (Get_NbOcc_Txt1(Lire_Racine(A)) /= 0) xor (Get_NbOcc_Txt2(Lire_Racine(A)) /= 0) then
               Imprime_Triplet(Lire_Racine(A));
         end if;      
         Query_Difference(SAD(A));
      end if;
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
