with Analyse_Lexicale, Analyse_Lexicale_Couple, Analyse_Lexicale_Triplet, Liste_Couple, Liste_Triplet, Couple, Mot, Text_Stat, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use Analyse_Lexicale, Analyse_Lexicale_Couple, Analyse_Lexicale_Triplet, Liste_Couple, Liste_Triplet, Couple, Mot, Text_Stat, Ada.Text_Io, Ada.Integer_Text_IO, Ada.Float_Text_IO;

procedure Main is

   Menu : Boolean;
   Choix : Integer;
   L : TListe_Couple;
   LT : TListe_Triplet;
   Buffer : String(1 .. 30);
   Last : Natural;
   NomFic : Boolean;
   NbMot : Integer;
   C1, C2 : T_Couple;
   M : T_Mot;
   Num : Integer;

   use Liste_Couple.L;
   use Liste_Triplet.LT;

begin

   Menu := True;
   while Menu loop

      Put_Line("Entrez 1 pour analyser un texte.");
      Put_Line("Entrez 2 pour enregistrer la liste dans le fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
      Put_Line("Entrez 3 pour recuperer la liste a partir du fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
      Put_Line("Entrez 4 pour afficher la liste des couplets.");
      Put_Line("Entrez 5 pour effacer la liste des couplets.");
      New_Line;
      Put_Line("Entrez 6 pour comparer 2 textes");
      Put_Line("Entrez 7 pour enregistrer la liste dans le fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
      Put_Line("Entrez 8 pour recuperer la liste a partir du fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
      Put_Line("Entrez 9 pour afficher la liste des triplets.");
      Put_Line("Entrez 10 pour effacer la liste des triplets.");
	New_Line;
      Put_Line("Entrez 0 pour quitter.");
      New_Line;
      Get(Choix);
      Skip_Line;
      New_Line;

      case Choix is

         when 0 =>

            Menu := False;

         when 1 =>

            NomFic := True;
            while NomFic loop
               Put_Line("Veuillez entrer le nom du fichier.");
               Get_Line(Buffer, Last);
               New_Line;
               if Existe(Buffer(1 .. Last)) then
                  NomFic := False;
                  Query_Liste_Couple(L, Buffer(1 .. Last)); --Remplissage de la liste avec les mots significatifs du texte
               else
                  Put_Line("Nom de fichier invalide !");
                  New_Line;
               end if;
            end loop;

            Put_Line("Veuillez entrer un entier.");
            Get(Num);
            New_Line;

            Put_Line("Nombre de mot total :" & Integer'Image(Num_Mot_Tot(L)) & ".");
            Put("Nombre d'occurence moyen : "); Put(Num_Occ_Moy(L), 2, 1, 0); Put_Line(".");
            Put("Longueur moyenne des mots :"); Put(Long_Moy(L), 2, 1, 0); Put_Line(".");
            Put_Line("Nombre de mot superieur a" & Integer'Image(Num) & " :" & Integer'Image(Num_Mot_Sup(L, Num)) & ".");
            New_Line;
            
            Put_Line("Affichage des N premiers mots en fonction de leur nombre d'occurence :");
            Put_Line("Veuillez entrer le nombre N de mots a afficher.");
            Get(NbMot);
            AffichageN(L, NbMot);

         when 2 =>

            Creer_Fichier_Listemot(L);

         when 3 =>

            Recup_Liste(L);

         when 4 =>

            Affiche(L);

         when 5 =>

            ViderListe(L);

         when 6 =>

            NomFic := True;
            while NomFic loop
               Put_Line("Veuillez entrer le nom du premier fichier.");
               Get_Line(Buffer, Last);
               New_Line;
               if Existe(Buffer(1 .. Last)) then
                  NomFic := False;
                  Query_Liste_Triplet_Txt1(LT, Buffer(1 .. Last)); --Remplissage de la liste avec les mots significatifs du texte
               else
                  Put_Line("Nom de fichier invalide !");
                  New_Line;
               end if;
            end loop;

            NomFic := True;
            while NomFic loop
               Put_Line("Veuillez entrer le nom du deuxieme fichier.");
               Get_Line(Buffer, Last);
               New_Line;
               if Existe(Buffer(1 .. Last)) then
                  NomFic := False;
                  Query_Liste_Triplet_Txt2(LT, Buffer(1 .. Last));--Remplissage de la liste avec les mots significatifs du texte
               else
                  Put_Line("Nom de fichier invalide !");
                  New_Line;
               end if;
            end loop;

            Put_Line("Veuillez entrer un mot.");
            Get_Line(Buffer, Last);
            New_Line;

            Put_Line("Le nombre d'occurence de " & Character'Val(34) & Buffer(1 .. Last) & Character'Val(34) & " du premier texte est :" & Integer'Image(Query_NbOcc_Txt1(LT, Buffer(1 .. Last))) & ".");
            Put_Line("Le nombre d'occurence de " & Character'Val(34) & Buffer(1 .. Last) & Character'Val(34) & " du deuxieme texte est :" & Integer'Image(Query_NbOcc_Txt2(LT, Buffer(1 .. Last))) & ".");
            New_Line;
			
            Put_Line("Les mots employés par les deux auteurs sont :");
            Query_Intersection(LT);
			
            Put_Line("Les mots employés par un auteur et pas par l'autre sont :");
            Query_Difference(LT);

         when 7 =>

            Creer_Fichier_Listemot_T(LT); 

         when 8 =>

            Recup_Liste_T(LT);

         when 9 =>
		 
            Affiche(LT);

         when 10 => 
           
            ViderListe(LT);

         when 20 =>

            Put_Line("Veuillez entrer le premier mot.");
            Get_Line(Buffer, Last);
            New_Line;
            M := Creer_Mot(Buffer(1 .. Last));
            Set_Mot(C1, M);

            Put_Line("Veuillez entrer le deuxieme mot.");
            Get_Line(Buffer, Last);
            New_Line;
            M := Creer_Mot(Buffer(1 .. Last));
            Set_Mot(C2, M);

            Fusion_Couple(L, C1, C2);		 
               
         when others =>

            Put_Line("Valeur non valide !");
            New_Line;

      end case;

   end loop;

end;
