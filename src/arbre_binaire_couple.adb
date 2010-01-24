with Ada.Text_IO;
use Ada.Text_IO;

package body Arbre_Binaire_Couple is

   procedure Traitement_Doublon_Couple(A: in out Tabr_Couple) is
   --Gere les actions a executer en cas de doublon dans l'arbre
   --Quand on tombe sur un doublon, on increment le NbOcc1 du Triplet
   T: T_Couple;
   begin
      T := Lire_Racine(A);
      Set_Nbocc(T, Get_Nbocc(T)+1);
      Modifie(A, T);
   end Traitement_Doublon_Couple;

   procedure Affiche_Couple(A: in Tabr_Couple) is
   begin
      Imprime_Couple(Lire_Racine(A));
   end Affiche_Couple;

   procedure Verification_Arbre(A: in TABR_Couple) is
   begin
      if not Arbre_Vide(A) then
         if Est_Racine(A) then
            Put("Racine");
            if Est_Feuille(A) then
               Put("RF:"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
            elsif Arbre_Vide(SAG(A)) then
               Put("R: "&",sad: "&ToString(Lire_Racine(SAD(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
            elsif Arbre_Vide(SAD(A)) then
               Put("R:"&",sag: "&ToString(Lire_Racine(SAG(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
            else--A a un fils gauche et un fils droit
               Put("R:"&",sag: "&ToString(Lire_Racine(SAG(A)))&",sad"&ToString(Lire_Racine(SAD(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
            end if;
         elsif Est_Feuille(A) then
            Put("F:(pere: "&ToString(Lire_Racine(Pere(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
         elsif Arbre_Vide(SAG(A)) then
            Put("(pere: "&ToString(Lire_Racine(Pere(A)))&",sad: "&ToString(Lire_Racine(SAD(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
         elsif Arbre_Vide(SAD(A)) then
            Put("(pere: "&ToString(Lire_Racine(Pere(A)))&",sag: "&ToString(Lire_Racine(SAG(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
         else--A a un fils gauche et un fils droit
            Put("(pere: "&ToString(Lire_Racine(Pere(A)))&",sag: "&ToString(Lire_Racine(SAG(A)))&",sad"&ToString(Lire_Racine(SAD(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
         end if;
      end if;
   end Verification_Arbre;


end Arbre_Binaire_Couple;
