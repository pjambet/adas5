with Analyse_Lexicale, Analyse_Lexicale_Trie, Trie, Mot;
use Analyse_Lexicale, Analyse_Lexicale_Trie, Trie, Mot;

with Analyse_Lexicale_Couple, Liste_Couple, Couple, Text_Stat_Couple, Arbre_Binaire_Couple;
use Analyse_Lexicale_Couple, Liste_Couple, Couple, Text_Stat_Couple, Arbre_Binaire_Couple;

with Analyse_Lexicale_Triplet, Liste_Triplet, Arbre_Binaire_Triplet, Text_Stat_Triplet;
use Analyse_Lexicale_Triplet, Liste_Triplet, Arbre_Binaire_Triplet, Text_Stat_Triplet;

with Ada.Text_Io, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use Ada.Text_Io, Ada.Integer_Text_IO, Ada.Float_Text_IO;

procedure Main is

   Menu : Boolean;
   SMenu : Boolean;
   Choix : Integer;
   L : TListe_Couple;
   LT : Tliste_Triplet;
   AB : TABR_Couple;
   ABT : TABR_Triplet;
   Buffer : String(1 .. 30);
   Last : Natural;
   NomFic : Boolean;
   NbMot : Integer;
   C1, C2 : T_Couple;
   M : T_Mot;
   Num : Integer;
   T : T_Trie;

   use Liste_Couple.L;
   use Liste_Triplet.Lt;
   use Arbre_Binaire_Triplet.AB;

begin

   Put_line("********************************************************************");
   Put_line("********************************************************************");
   Put_Line("*                                                                  *");
   Put_Line("*                  ANALYSEUR LEXICALE v2                           *");
   Put_Line("*                      PROJET ADA S5                               *");
   Put_Line("*                                                                  *");
   Put_Line("* Auteurs :                                                        *");
   Put_Line("*   JAMBET PIERRE                                                  *");
   Put_Line("*   DREYER QUENTIN                                                 *");
   Put_Line("*                                                                  *");
   Put_Line("* Note : (Signification de l'etat memoire)                         *");
   Put_Line("*   (*) -> Il y a une liste de couples en memoire                  *");
   Put_Line("*   (**) -> Il y a une liste de triplets en memoire                *");
   Put_Line("*                                                                  *");
   Put_line("********************************************************************");
   Put_line("********************************************************************");
   New_Line;

   Menu := True;
   while Menu loop

      Put_Line("1 -> Entrez 1 pour utiliser la structure de donnee " & Character'Val(34) & "Liste" & Character'Val(34) & ".");
      Put_Line("2 -> Entrez 2 pour utiliser la structure de donnee " & Character'Val(34) & "ABR" & Character'Val(34) & ".");
      Put_Line("3 -> Entrez 3 pour utiliser la structure de donnee " & Character'Val(34) & "Trie" & Character'Val(34) & ".");
      Put_Line("0 -> Entrez 0 pour quitter.");
      New_Line;
      Get(Choix);
      Skip_Line;
      New_Line;

      case Choix is

         when 0 =>

            Menu := False;

         when 1 =>

            SMenu := True;
            while SMenu loop

               Put("Etat memoire :");
               if not EstVide(L) then
                  Put(" (*)");
               elsif not EstVide(LT) then
                  Put(" (**)");
               end if;

               New_Line;
               Put_Line("1 -> Entrez 1 pour analyser un texte.");
               Put_Line("2 -> Entrez 2 pour effectuer des requetes.");
               Put_Line("3 -> Entrez 3 pour enregistrer la liste dans le fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
               Put_Line("4 -> Entrez 4 pour recuperer la liste a partir du fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
               Put_Line("5 -> Entrez 5 pour afficher la liste des couples.");
               Put_Line("6 -> Entrez 6 pour effacer la liste des couples.");
               New_Line;
               Put_Line("7 -> Entrez 7 pour comparer 2 textes");
               Put_Line("8 -> Entrez 8 pour effectuer des requetes.");
               Put_Line("9 -> Entrez 9 pour enregistrer la liste dans le fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
               Put_Line("10 -> Entrez 10 pour recuperer la liste a partir du fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
               Put_Line("11 -> Entrez 11 pour afficher la liste des triplets.");
               Put_Line("12 -> Entrez 12 pour effacer la liste des triplets.");
               New_Line;
               Put_Line("0 -> Entrez 0 pour retourner au menu principal.");
               New_Line;
               Get(Choix);
               Skip_Line;
               New_Line;

               case Choix is

                  when 0 =>

                     SMenu := False;

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

                  when 2 =>

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

                     Skip_Line;
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
                     
                     begin
                        Fusion_Couple(L, C1, C2);
                     exception
                        when Constraint_Error => 
                           Put_Line("Erreur de contrainte");
                        when Liste_Couple.L.Listevideexception =>
                           Put_Line("Probleme : Element non trouvés dans la liste");
                     end;
                     

                  when 3 =>

                     Creer_Fichier_Listemot(L);

                  when 4 =>

                     Recup_Liste(L);

                  when 5 =>

                     Affiche(L);

                  when 6 =>

                     ViderListe(L);

                  when 7 =>

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

                  when 8 =>

                     Put_Line("Veuillez entrer un entier.");
                     Get(Num);
                     New_Line;

                     Put_Line("Nombre de mot total :" & Integer'Image(Num_Mot_Tot(LT)) & ".");
                     Put("Nombre d'occurence moyen : "); Put(Num_Occ_Moy(LT), 2, 1, 0); Put_Line(".");
                     Put("Longueur moyenne des mots :"); Put(Long_Moy(LT), 2, 1, 0); Put_Line(".");
                     Put_Line("Nombre de mot superieur a" & Integer'Image(Num) & " :" & Integer'Image(Num_Mot_Sup(LT, Num)) & ".");
                     New_Line;

                     Put_Line("Affichage des N premiers mots en fonction de leur nombre d'occurence :");
                     Put_Line("Veuillez entrer le nombre N de mots a afficher.");
                     Get(NbMot);
                     AffichageN_T(LT, NbMot);

                     Skip_Line;
                     Put_Line("Veuillez entrer un mot afin de connaitre son nombre d'occurence dans chacun des textes.");
                     Get_Line(Buffer, Last);
                     New_Line;

                     Put_Line("Le nombre d'occurence de " & Character'Val(34) & Buffer(1 .. Last) & Character'Val(34) & " du premier texte est :" & Integer'Image(Query_NbOcc_Txt1(LT, Buffer(1 .. Last))) & ".");
                     Put_Line("Le nombre d'occurence de " & Character'Val(34) & Buffer(1 .. Last) & Character'Val(34) & " du deuxieme texte est :" & Integer'Image(Query_NbOcc_Txt2(LT, Buffer(1 .. Last))) & ".");
                     New_Line;

                     Put_Line("Les mots employés par les deux auteurs sont :");
                     Query_Intersection(LT);

                     Put_Line("Les mots employés par un auteur et pas par l'autre sont :");
                     Query_Difference(LT);

                  when 9 =>

                     Creer_Fichier_Listemot_T(LT);

                  when 10 =>

                     Recup_Liste_T(LT);

                  when 11 =>

                     Affiche(LT);

                  when 12 =>

                     ViderListe(LT);

                  when others =>

                     Put_Line("Valeur non valide !");
                     New_Line;

               end case;

            end loop;

         when 2 =>
            --ABR-RN
            SMenu := True;
            --while SMenu loop

--               Put("Etat memoire :");
--               if not EstVide(L) then
--                  Put(" (*)");
--               elsif not EstVide(LT) then
--                  Put(" (**)");
--               end if;

--               New_Line;
--               Put_Line("1 -> Entrez 1 pour analyser un texte.");
--               Put_Line("2 -> Entrez 2 pour effectuer des requetes.");
--               Put_Line("3 -> Entrez 3 pour enregistrer l'arbre dans le fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
--               Put_Line("4 -> Entrez 4 pour recuperer l'arbre a partir du fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
--               Put_Line("5 -> Entrez 5 pour afficher l'arbre des couples.");
--               Put_Line("6 -> Entrez 6 pour effacer l'arbre des couples.");
--               New_Line;
--               Put_Line("7 -> Entrez 7 pour comparer 2 textes");
--               Put_Line("8 -> Entrez 8 pour effectuer des requetes.");
--               Put_Line("9 -> Entrez 9 pour enregistrer l'arbre dans le fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
--               Put_Line("10 -> Entrez 10 pour recuperer l'arbre a partir du fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
--               Put_Line("11 -> Entrez 11 pour afficher l'arbre des triplets.");
--               Put_Line("12 -> Entrez 12 pour effacer l'arbre des triplets.");
--               New_Line;
--               Put_Line("0 -> Entrez 0 pour retourner au menu principal.");
--               New_Line;
--               Get(Choix);
--               Skip_Line;
--               New_Line;

--               case Choix is

--                  when 0 =>

--                     SMenu := False;

--                  when 1 =>

--                     NomFic := True;
--                     while NomFic loop
--                        Put_Line("Veuillez entrer le nom du fichier.");
--                        Get_Line(Buffer, Last);
--                        New_Line;
--                        if Existe(Buffer(1 .. Last)) then
--                           NomFic := False;
--                           -- Rajout d'une fonction qui insere dans l'arbreQuery_Liste_Couple(L, Buffer(1 .. Last)); --Remplissage de l'arbre avec les mots significatifs du texte
--                        else
--                           Put_Line("Nom de fichier invalide !");
--                           New_Line;
--                        end if;
--                     end loop;

--                  when 2 =>
--                        null;
--                     Put_Line("Veuillez entrer un entier.");
--                     Get(Num);
--                     New_Line;

--                     Put_Line("Nombre de mot total :" & Integer'Image(Num_Mot_Tot(AB)) & ".");
--                     Put("Nombre d'occurence moyen : "); Put(Num_Occ_Moy(AB), 2, 1, 0); Put_Line(".");
--                     Put("Longueur moyenne des mots :"); Put(Long_Moy(AB), 2, 1, 0); Put_Line(".");
--                     Put_Line("Nombre de mot superieur a" & Integer'Image(Num) & " :" & Integer'Image(Num_Mot_Sup(AB, Num)) & ".");
--                     New_Line;

--                     Put_Line("Affichage des N premiers mots en fonction de leur nombre d'occurence :");
--                     Put_Line("Veuillez entrer le nombre N de mots a afficher.");
--                     Get(NbMot);
--                     AffichageN(AB, NbMot);

--                     Skip_Line;
--                     Put_Line("Veuillez entrer le premier mot.");
--                     Get_Line(Buffer, Last);
--                     New_Line;
--                     M := Creer_Mot(Buffer(1 .. Last));
--                     Set_Mot(C1, M);

--                     Put_Line("Veuillez entrer le deuxieme mot.");
--                     Get_Line(Buffer, Last);
--                     New_Line;
--                     M := Creer_Mot(Buffer(1 .. Last));
--                     Set_Mot(C2, M);
--                     
----                     begin
----                        --a implementer   
----                        --Fusion_Couple(AB, C1, C2);
----                     exception
----                        when Constraint_Error => 
----                           Put_Line("Erreur de contrainte");
----                        when Liste_Couple.L.Listevideexception =>
----                           Put_Line("Probleme : Element non trouvés dans la liste");
----                     end;
--                     

--                  when 3 =>

--                     Creer_Fichier_arbremot(A);

--                  when 4 =>

--                     Recup_Arbre(A);

--                  when 5 =>

--                     Affiche(A);

--                  when 6 =>

--                     ViderArbre(A);

--                  when 7 =>

--                     NomFic := True;
--                     while NomFic loop
--                        Put_Line("Veuillez entrer le nom du premier fichier.");
--                        Get_Line(Buffer, Last);
--                        New_Line;
--                        if Existe(Buffer(1 .. Last)) then
--                           NomFic := False;
--                           --Query_Liste_Triplet_Txt1(LT, Buffer(1 .. Last)); --Remplissage de la liste avec les mots significatifs du texte
--                        else
--                           Put_Line("Nom de fichier invalide !");
--                           New_Line;
--                        end if;
--                     end loop;

--                     NomFic := True;
--                     while NomFic loop
--                        Put_Line("Veuillez entrer le nom du deuxieme fichier.");
--                        Get_Line(Buffer, Last);
--                        New_Line;
--                        if Existe(Buffer(1 .. Last)) then
--                           NomFic := False;
--                           --Query_Liste_Triplet_Txt2(LT, Buffer(1 .. Last));--Remplissage de la liste avec les mots significatifs du texte
--                        else
--                           Put_Line("Nom de fichier invalide !");
--                           New_Line;
--                        end if;
--                     end loop;

--                  when 8 =>

--                     Put_Line("Veuillez entrer un entier.");
--                     Get(Num);
--                     New_Line;

--                     Put_Line("Nombre de mot total :" & Integer'Image(Num_Mot_Tot(ABT)) & ".");
--                     Put("Nombre d'occurence moyen : "); Put(Num_Occ_Moy(ABT), 2, 1, 0); Put_Line(".");
--                     Put("Longueur moyenne des mots :"); Put(Long_Moy(ABT), 2, 1, 0); Put_Line(".");
--                     Put_Line("Nombre de mot superieur a" & Integer'Image(Num) & " :" & Integer'Image(Num_Mot_Sup(ABT, Num)) & ".");
--                     New_Line;

--                     Put_Line("Affichage des N premiers mots en fonction de leur nombre d'occurence :");
--                     Put_Line("Veuillez entrer le nombre N de mots a afficher.");
--                     Get(NbMot);
--                     AffichageN_T(ABT, NbMot);

--                     Skip_Line;
--                     Put_Line("Veuillez entrer un mot afin de connaitre son nombre d'occurence dans chacun des textes.");
--                     Get_Line(Buffer, Last);
--                     New_Line;

--                     Put_Line("Le nombre d'occurence de " & Character'Val(34) & Buffer(1 .. Last) & Character'Val(34) & " du premier texte est :" & Integer'Image(Query_NbOcc_Txt1(ABT, Buffer(1 .. Last))) & ".");
--                     Put_Line("Le nombre d'occurence de " & Character'Val(34) & Buffer(1 .. Last) & Character'Val(34) & " du deuxieme texte est :" & Integer'Image(Query_NbOcc_Txt2(ABT, Buffer(1 .. Last))) & ".");
--                     New_Line;

--                     Put_Line("Les mots employés par les deux auteurs sont :");
--                     Query_Intersection(ABT);

--                     Put_Line("Les mots employés par un auteur et pas par l'autre sont :");
--                     Query_Difference(ABT);

--                  when 9 =>

--                     Creer_Fichier_Listemot_T(ABT);

--                  when 10 =>

--                     Recup_Arbre_T(ABT);

--                  when 11 =>

--                     Affiche(ABT);

--                  when 12 =>

--                     ViderArbre(ABT);

--                  when others =>

--                     Put_Line("Valeur non valide !");
--                     New_Line;

               --end case;

           --end loop;      

         when 3 =>

            SMenu := True;
            while SMenu loop

               Put("Etat memoire : TODO");

               New_Line;
               Put_Line("1 -> Entrez 1 pour analyser un texte.");
               Put_Line("2 -> Entrez 2 pour effectuer des requetes.");
               Put_Line("3 -> Entrez 3 pour enregistrer le trie dans le fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
               Put_Line("4 -> Entrez 4 pour recuperer le trie a partir du fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
               Put_Line("5 -> Entrez 5 pour afficher le trie.");
               Put_Line("6 -> Entrez 6 pour effacer le trie.");
               New_Line;
               Put_Line("7 -> Entrez 7 pour comparer 2 textes");
               Put_Line("8 -> Entrez 8 pour effectuer des requetes.");
               Put_Line("9 -> Entrez 9 pour enregistrer le trie dans le fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
               Put_Line("10 -> Entrez 10 pour recuperer le trie a partir du fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
               Put_Line("11 -> Entrez 11 pour afficher le trie.");
               Put_Line("12 -> Entrez 12 pour effacer le trie.");
               New_Line;
               Put_Line("0 -> Entrez 0 pour retourner au menu principal.");
               New_Line;
               Get(Choix);
               Skip_Line;
               New_Line;

               case Choix is

                  when 0 =>

                     SMenu := False;

                  when 1 =>

                     NomFic := True;
                     while NomFic loop
                        Put_Line("Veuillez entrer le nom du fichier.");
                        Get_Line(Buffer, Last);
                        New_Line;
                        if Existe(Buffer(1 .. Last)) then
                           NomFic := False;
                           Query_Trie(T, Buffer(1 .. Last)); --Remplissage de la liste avec les mots significatifs du texte
                        else
                           Put_Line("Nom de fichier invalide !");
                           New_Line;
                        end if;
                     end loop;

                  when 2 =>
                     
                     null;

                  when 3 =>
                     
                     null;

                  when 4 =>
                     
                     null;

                  when 5 =>

                     AfficheTrie(T);
                     New_Line;

                  when 6 =>
                     
                     null;
                     
                  when 7 =>
                     
                     null;
                     
                  when 8 =>
                     
                     null;
                     
                  when 9 =>
                     
                     null;
                     
                  when 10 =>
                     
                     null;
                     
                  when 11 =>
                     
                     null;
                     
                  when 12 =>
                     
                     null;
                     
                  when others =>

                     Put_Line("Valeur non valide !");
                     New_Line;

               end case;

            end loop;

         when others =>

            Put_Line("Valeur non valide !");
            New_Line;

      end case;

   end loop;

end;
