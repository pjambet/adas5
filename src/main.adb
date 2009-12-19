with Analyse_Lexicale;
use Analyse_Lexicale;
with Liste_Couple;
use Liste_Couple;
with Ada.Text_IO;
use Ada.Text_Io;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Main is

   Menu   : Boolean;
   Choix  : Integer;
   L,
   P      : TListe_Couple;
   Buffer : String (1 .. 30);
   Last   : Natural;
   NomFic : Boolean;

--   function Existe (
--         Name : in     String)
--     return Boolean is
--      File : File_Type;
--   begin
--      Open(File, In_File, Name);
--      Close(File);
--      return True;
--   exception
--      when Name_Error =>
--         return False;
--      when others =>
--         raise;
--   end Existe;

begin

   Menu := True;
   while Menu loop
      Put_Line("Entrez 1 pour analyser un texte.");
      Put_Line("Entrez 2 pour enregistrer la liste dans le fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
      Put_Line("Entrez 3 pour recuperer la liste a partir du fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
      Put_Line("Entrez 0 pour quitter.");
      New_Line;
      Get(Choix);
      Skip_Line;
      New_Line;

      case Choix is
         
         when 0 =>
            
            null; -- return 0 ?!

         when 1 =>

            NomFic := True;
            while NomFic loop
               Put_Line("Veuillez entrer le nom du fichier");
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

            Recup_Liste(P);

         when others =>

            Put_Line("Valeur non valide !");
            New_Line;

      end case;

   end loop;

end;
