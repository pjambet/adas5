with Analyse_Lexicale, Mot, Triplet, Ada.Text_IO, Ada.Characters.Handling, Liste_Triplet;
use Analyse_Lexicale, Mot, Triplet, Ada.Text_IO, Ada.Characters.Handling, Liste_Triplet.LT;

package body Analyse_Lexicale_Triplet is

   procedure Query_Liste_Triplet_Txt1 (L : in out TListe_Triplet; NomFic : in String) is
      -- Renvoit une liste comprenant tous les couples(mot;occurence) du fichier texte NomFic
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
                  --Set_Fin(Couple, Indice);
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
   
   procedure Query_Liste_Triplet_Txt2 (L : in out TListe_Triplet; NomFic : in String) is
      -- Renvoit une liste comprenant tous les couples(mot;occurence) du fichier texte NomFic
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
                  --Set_Fin(Couple, Indice);
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

   function Query_NbOcc_Txt1 (L : TListe_Triplet; M : String) return Integer is
      -- Requete renvoyant le nombre d'occurence du mot m dans le texte 1
   begin
      if EstVide(L) then
         return 0;
      elsif Compare_Chaine_Mot(M, Get_Mot_T(Valeur(L))) then
         return Get_NbOcc_Txt1(Valeur(L));
      else
         return Query_NbOcc_Txt1(Suivant(L), M);
      end if;
   end;

   function Query_NbOcc_Txt2 (L : TListe_Triplet; M : String) return Integer is
      --Requete renvoyant le nombre d'occurence du mot m dans le texte 2
   begin
      if EstVide(L) then
         return 0;
      elsif Compare_Chaine_Mot(M, Get_Mot_T(Valeur(L))) then
         return Get_NbOcc_Txt2(Valeur(L));
      else
         return Query_NbOcc_Txt2(Suivant(L), M);
      end if;
   end;

   procedure Creer_Fichier_Listemot_T (L : in TListe_Triplet) is
      --Procedure qui crée le fichier liste-mot.txt-y a partir de la liste de triplet l
      --Le Fichier créé est de la forme suivante
      --Mot1 NboccTxt1 NbOccTxt2
      --Mot2 NbOccTxt1 NbOccTxt2
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

   procedure Recup_Liste_T (L : in out TListe_Triplet) is
      --procedure qui recrée la liste de couple a partir du fichier "liste-mot-t.txt"
      --le fichier n'est pas passé en parametre car il sera créé auparavant par la fonction Creer_Fichier_Listemot_T
      --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
      --declenche une exception si le fichier n'existe pas
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
   
   procedure AffichageN_T (L : in TListe_Triplet; N : in Integer) is
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

   procedure Query_Intersection (T : in TListe_Triplet) is
      Temp : TListe_Triplet;
   begin
      Temp := T;
      while not EstVide(Temp) loop
         if (Get_NbOcc_Txt1(Premier(Temp)) /= 0) and then (Get_NbOcc_Txt2(Premier(Temp)) /= 0) then
            Imprime_Triplet(Premier(Temp));
         end if;
         Temp := Suivant(Temp);
      end loop;
      New_Line;
   end;

   procedure Query_Difference (T : in TListe_Triplet) is
      Temp : TListe_Triplet;
   begin
      Temp := T;
      while not EstVide(Temp) loop
         if (Get_NbOcc_Txt1(Premier(Temp)) /= 0) xor (Get_NbOcc_Txt2(Premier(Temp)) /= 0) then
            Imprime_Triplet(Premier(Temp));
         end if;
         Temp := Suivant(Temp);
      end loop;
      New_Line;
   end;
   
end Analyse_Lexicale_Triplet;
