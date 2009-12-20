with Analyse_Lexicale;
use Analyse_Lexicale;
with Liste_Couple;
use Liste_Couple;
with Couple;
use Couple;
with Mot;
use Mot;
with Listegen;
with Text_Stat;
use Text_Stat;
with Ada.Text_IO;
use Ada.Text_Io;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Main is

   Menu   : Boolean;
   Choix  : Integer;
   L      : TListe_Couple;
   Buffer : String (1 .. 30);
   Last   : Natural;
   NomFic : Boolean;
   NbMot  : Integer;
   Buf2,
   Buf3   : String (1 .. 30);
   Last2,
   Last3  : Natural;
   C1,
   C2     : T_Couple;
   M1,
   M2     : T_Mot;
   use Liste_Couple.L;
begin

   Menu := True;
   while Menu loop
      Put_Line("Entrez 1 pour analyser un texte.");
      Put_Line("Entrez 2 pour enregistrer la liste dans le fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
      Put_Line("Entrez 3 pour recuperer la liste a partir du fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
      Put_Line("Entrez 4 pour afficher les mots les plus utilises.");
      Put_Line("Entrez 5 pour afficher la liste.");
      Put_Line("Entrez 6 pour fusionner un mot dans un autre");
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
            AffichageN(L, NbMot);

         when 5 =>

            Affiche(L);

         when 6 =>

            Get_Line(Buf2,Last2);
            Get_Line(Buf3,Last3);
            M1 := Creer_Mot(Buf2(1..Last2));
            Set_Mot(C1,M1);
            M2 := Creer_Mot(Buf3(1..Last3));
            Set_Mot(C2,M2);
            Fusion_Couple(L,C1,C2);

         when others =>

            Put_Line("Valeur non valide !");
            New_Line;

      end case;

   end loop;

end;
