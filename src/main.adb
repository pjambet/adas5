with Analyse_Lexicale;
use Analyse_Lexicale;
with Liste_Couple;
use Liste_Couple;
with Listegen;
with Text_Stat;
use Text_Stat;
with Ada.Text_IO;
use Ada.Text_Io;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Main is

   Menu      : Boolean;
   Choix     : Integer;
   L         : TListe_Couple;
   M         : TListe_Couple;
   Buffer    : String (1 .. 30);
   Last      : Natural;
   NomFic    : Boolean;
   NbMot     : Integer;

begin

   Menu := True;
   while Menu loop
      Put_Line("Entrez 1 pour analyser un texte.");
      Put_Line("Entrez 2 pour enregistrer la liste dans le fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
      Put_Line("Entrez 3 pour recuperer la liste a partir du fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
      Put_Line("Entrez 4 pour afficher les mots les plus utilises.");
      Put_Line("Entrez 5 pour afficher la liste.");
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
                  Query_Liste_Couple(L, Buffer(1 .. Last)); -- Remplissage de la liste avec les mots significatifs du texte
               else
                  Put_Line("Nom de fichier invalide !");
                  New_Line;
               end if;
            end loop;

         when 2 =>

            Creer_Fichier_Listemot(L);

         when 3 =>

            Recup_Liste(L);

         when 4 =>

            Put_Line("Veuillez entrer le nombre de mots a afficher.");
            Get(NbMot);
            New_Line;
            --Tri L par NBOCC
            AffichageN(M, NbMot);

         when 5 =>

            AffichageListe(L);

         when others =>

            Put_Line("Valeur non valide !");
            New_Line;

      end case;

   end loop;

end;
