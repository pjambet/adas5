WITH Analyse_Lexicale;
USE Analyse_Lexicale;
WITH Liste_Couple;
USE Liste_Couple;
WITH Ada.Text_IO;
USE Ada.Text_Io;
WITH Ada.Integer_Text_IO;
USE Ada.Integer_Text_IO;

PROCEDURE Main IS

   Menu   : Boolean;
   Choix  : Integer;
   L,P    : TListe_Couple;
   Buffer : String (1 .. 30);
   Last   : Natural;
   NomFic : Boolean;

   FUNCTION Existe (
         Name : IN     String)
     RETURN Boolean IS
      File : File_Type;
   BEGIN
      Open(File, In_File, Name);
      Close(File);
      RETURN True;
   EXCEPTION
      WHEN Name_Error =>
         RETURN False;
      WHEN OTHERS =>
         RAISE;
   END Existe;

BEGIN

   Menu := True;
   WHILE Menu LOOP
      Put_Line("Entrez 1 pour analyser un texte");
      Put_Line("Entrez 2 pour XXX");
      Get(Choix);
      Skip_Line;
      New_Line;

      CASE Choix IS
         WHEN 1 =>

            Menu := False;
            NomFic := True;
            WHILE NomFic LOOP
               Put_Line("Veuillez entrer le nom du fichier");
               Get_Line(Buffer, Last);
               New_Line;
               IF Existe(Buffer(1 .. Last)) THEN
                  NomFic := False;
                  Query_Liste_Couple(L, Buffer(1 .. Last)); -- Remplissage de la liste avec les mots significatifs du texte
                  Creer_Fichier_Listemot(L);
                  Recup_Liste(P);
                  --Creer_Fichier_Listemot(P);
               ELSE
                  Put_Line("Nom de fichier invalide !");
                  New_Line;
               END IF;
            END LOOP;

         WHEN 2 =>

            Menu := False;
            Put_Line("XXX");

         WHEN OTHERS =>

            Put_Line("Valeur non valide !");
            New_Line;

      END CASE;

   END LOOP;
   
END;


