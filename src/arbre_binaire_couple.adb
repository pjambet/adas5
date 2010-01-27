with Mot, Ada.Text_Io;
use Mot, Ada.Text_Io;
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
            if Est_Feuille(A) then
               Put("RF:"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
            elsif Arbre_Vide(SAG(A)) and then not Arbre_Vide(sad(a)) then
               Put("R: "&"(sad: "&ToString(Lire_Racine(SAD(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
            elsif Arbre_Vide(SAD(A)) and then not Arbre_Vide(sag(a)) then
               Put("R:"&"(sag: "&ToString(Lire_Racine(SAG(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
            else--A a un fils gauche et un fils droit
               Put("R:"&"(sag: "&ToString(Lire_Racine(SAG(A)))&",sad"&ToString(Lire_Racine(SAD(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
            end if;
         elsif Est_Feuille(A) then
            Put("F:(pere: "&ToString(Lire_Racine(Pere(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
         elsif Arbre_Vide(SAG(A)) and then not Arbre_Vide(sad(a)) then
            Put("(pere: "&ToString(Lire_Racine(Pere(A)))&",sad: "&ToString(Lire_Racine(SAD(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
         elsif Arbre_Vide(SAD(A)) and then not Arbre_Vide(sag(a)) then
            Put("(pere: "&ToString(Lire_Racine(Pere(A)))&",sag: "&ToString(Lire_Racine(SAG(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
         else--A a un fils gauche et un fils droit
            Put("(pere: "&ToString(Lire_Racine(Pere(A)))&",sag: "&ToString(Lire_Racine(SAG(A)))&",sad"&ToString(Lire_Racine(SAD(A)))&")"&ToString(Lire_Racine(A))&"coul:"&ColorToString(A));Put_Line("");
         end if;
      end if;
   end Verification_Arbre;

   procedure Modif_Fusion_Couple(A : in out TAbr_Couple; E1,E2 : T_Couple) is
      C : T_Couple;
      Ptr_sur_E1,Ptr_sur_E2 : TABR_Couple;
   begin
      Ptr_Sur_E1 := Recherche_Abr(A,E1);
      Ptr_Sur_E2 := Recherche_Abr(A,E2);
      if not Arbre_Vide(Ptr_Sur_E1) and then not Arbre_Vide(Ptr_Sur_E2) then
         C := Lire_Racine(Ptr_Sur_E1);
         Set_Nbocc(C, Get_Nbocc(C) + Get_Nbocc(Lire_Racine(Ptr_sur_E2)));
         Modifie(Ptr_Sur_E1,C);
         Supprimer_Abr(A, Lire_Racine(Ptr_Sur_E2));
         Put_Line("Le mot " & Get_Chaine(Get_Mot(E2))(1 .. Get_Fin(Get_Mot(E2))) & " a ete supprime !");
      end if;
   end Modif_Fusion_Couple;
   
end Arbre_Binaire_Couple;
