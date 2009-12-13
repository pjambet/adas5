with analyse_syntaxique; use analyse_syntaxique;
with Ada.Text_IO; use Ada.Text_Io;

procedure main is

   Menu : Boolean;
   Choix : Natural(1 .. 2);
   L: Liste;
   Buffer : String(1 .. 30);
   Last : Natural;

   type Couple is record
      Mot : T_Mot;
      Occ : Natural;
   end;

   procedure listecouple is new listegen(Couple); -- Instancation de la liste de couple(mot, nbocc)
   use listecouple;

begin

   Menu := True;
   While Menu loop
      Put_Line("Entrez 1 pour analyser un texte");
      Put_Line("Entrez 2 pour XXX");
      Get(Choix);

      case Choix is
         when 1 =>

            Menu := False;
            L:= CreerListe; -- Création d'une liste vide
            Put_Line("Veuillez entrer le nom du fichier");
            Get_Line(Buffer, Last);
            query_liste_couple(L, Buffer(1 .. Last)); -- Remplissage de la liste avec les mots significatifs du texte
            Tri_Gen(L); -- Tri de la liste par ordre alphabétique
            Fusion(L);

         when 2 =>

            Menu := False;
            Put_Line("XXX");

         when others =>

            Put_Line("Valeur non valide !");

      end case;

   end loop;

end;


