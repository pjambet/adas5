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

begin

   Menu := True;
   While Menu loop
      Put_Line("Entrez 1 pour analyser un texte");
      Put_Line("Entrez 2 pour XXX");
      New_Line;
      Get(Choix);
      Skip_Line;
      
      case Choix is
         when 1 =>

            Menu := False;
            Put_Line("Veuillez entrer le nom du fichier");
            Get_Line(Buffer, Last);
            Query_Liste_Couple(L, Buffer(1 .. Last)); -- Remplissage de la liste avec les mots significatifs du texte
            
            
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


