WITH Analyse_Lexicale; USE Analyse_Lexicale;
with Liste_couple; use Liste_couple;
WITH Ada.Text_IO; USE Ada.Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure main is
   
   Menu : Boolean;
   Choix : Integer;
   L: TListe_Couple;
   Buffer : String(1 .. 30);
   Last : Natural;
   NomFic : Boolean;
   
   function Existe (Name : in String) return boolean is
      File : File_Type;
   begin
      open(File, In_File, Name);
      Close(File);
      return True;
   exception
      when Name_Error =>
           return False;
      When others =>
           raise;
   end Existe;

begin

   Menu := True;
   While Menu loop
      Put_Line("Entrez 1 pour analyser un texte");
      Put_Line("Entrez 2 pour XXX");
      Get(Choix);
      Skip_Line;
      New_Line;
      
      case Choix is
         when 1 =>

            Menu := False;
            NomFic := True;
            While NomFic loop
               Put_Line("Veuillez entrer le nom du fichier");
               Get_Line(Buffer, Last);
               IF Existe(Buffer(1 .. Last)) THEN
                  NomFic := False;
                  Query_Liste_Couple(L, Buffer(1 .. Last)); -- Remplissage de la liste avec les mots significatifs du texte
               ELSE
                  Put_Line("Nom de fichier invalide !");
                  New_Line;
               END IF;
               end loop;          
            
         when 2 =>

            Menu := False;
            Put_Line("XXX");

         when others =>

            Put_Line("Valeur non valide !");
            New_Line;

      end case;

   end loop;
   Get(Buffer);
end;


