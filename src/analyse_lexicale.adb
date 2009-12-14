with listegen; use listegen;

package body analyse_lexicale is

   procedure query_liste_couple(L: in out Liste; NomFic: in String) is
      --Renvoit une liste comprenant tous les couples(mot;occurence) du fichier texte NomFic
      Orig := File_Type; -- Fichier source
      Ligne : String(0..100);
      Last : Natural;
      C : Character;
      Mot : String(0..30);
   begin
      Open(Orig, In_File, NomFic)
      While not End_Of_File(Orig) loop
         if End_Of_Line(Orig) then
            Skip_Line(Orig);
         else
            while C /= " " or C =/ "," loop -- On crée le mot
               Get(Orig, C);
               Mot := Mot + C;
            end loop;
            if EstMotSignificatif(Mot) then
               AjoutFin(L, Mot); -- Ajoute dans la liste le premier mot significatif
            end if;
            Mot := "";
         end if;
      end loop
      Close(Orig);
   end;

   function query_NbOcc(l: liste; m: T_Mot) return Integer is
   --Requete renvoyant le nombre d'occurence du mot m dans le texte
   begin
      if EstVide(l) then
         return 0;
      elsif l.val.mot = m then
         return 1+query_NbOcc(l.suiv, m);
      else
         return query_NbOcc(l.suiv, m);
      end if;
   end;

   procedure query_NbPref(l: in liste; s: in T_Mot; nbMot: out Integer; nbOcc: out Integer);
   --Requete renvoyant le nombre de mot ayant s pour préfixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
   temp : liste;
   res : Integer
   begin
      temp := l;
      while temp /= null loop
         if Estprefixede(temp.val.mot, m) then
            res := res + 1;
         end if;
         temp := temp.suiv;
      end loop;
      nbMot := res;
      nbOcc := query_nbOcc(s);
   end;

   procedure query_NbSuff(l: in liste; s: in T_Mot; nbMot: out Integer; nbOcc: out Integer);
   --Requete renvoyant le nombre de mot ayant s pour suffixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
   temp : liste;
   res : Integer
   begin
      temp := l;
      while temp /= null loop
         if Estsuffixede(temp.val.mot, m) then
            res := res + 1;
         end if;
         temp := temp.suiv;
      end loop;
      nbMot := res;
      nbOcc := query_nbOcc(s);
   end;

   procedure function query_NbFact(l: in liste; s: in T_Mot; nbMot: out Integer; nbOcc: out Integer);
   --Requete renvoyant le nombre de mot ayant s pour facteur et le nombre d'occurence de s (Appel de query_NbOcc(s))
   temp : liste;
   res : Integer
   begin
      temp := l;
      while temp /= null loop
         if Estfacteurde(temp.val.mot, m) then
            res := res + 1;
         end if;
         temp := temp.suiv;
      end loop;
      nbMot := res;
      nbOcc := query_nbOcc(s);
   end;

end analyse_lexicale;

