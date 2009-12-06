with Liste;use Liste;
with Es_Simples;use Es_Simples;
procedure Test is
   --On teste notre liste
   N: Integer;
   L: T_Liste;
   B: Boolean;
begin
   L := CreerListe;
   if Estvide(L) then Put("La liste est vide");
   else Put("La liste n'est pas vide");
   end if;
   New_Line;
   AjoutDebut(L,1);
   AjoutDebut(L,2);
   AjoutDebut(L,4);
   AjoutFin(L,10);
   AjoutFin(L,10);
   AjoutDebut(L,4);
   AjoutDebut(L,4);
   AjoutDebut(L,10);
   Affiche(L);
   Put(Premier(L),1);Put(" | ");Put(Dernier(L),1);
   Put(NbOcc(L,4),1);Put(" | ");Put(NbOcc(L,4),1);
   AjoutFin(L,45);
   InsererAvant(L,33,45);
   InsererApres(L,33,45);
   Supprimer(L,45);
   SupprimerTout(L,10);
   Affiche(L);

end Test;
