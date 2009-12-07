with listegen; use listegen;
package body analyse_syntaxique is

	function query_liste_couple retourne Liste is
	--Renvoit une liste comprenant tous les couples(mot;occurence) du texte, la
	--liste est triée par ordre alphabetique
	begin
		F := File_Type;
		Ligne : String(0..100);
		Lg : Natural;
		Nom_Fichier : String(0..100);
		
		Nom_Fichier := Get_Nom_Fichier; -- On recupère le bon nom du fichier à traiter
		Open(F, In_File, Nom_Fichier)
			While not (End_Of_File(F)) loop
				Get_Line(F, Ligne, Lg); -- File_Type / Buffer / Last
				While not (End_Of_Line(File_Type)) loop
					Mot_Sig := Get_Mot_Significatif; -- Recupère le premier mot significatif sur la ligne
					AjoutFin(Liste, CoupleMot(Mot_Sig, 1)); -- Ajoute dans la liste le premier mot significatif
					Ligne := Ligne(Mot_Sig..Last); -- On enlève le Mot_Sig de la ligne
				end loop;
				Skip_Line; -- On passe à la ligne suivante
			end loop;
		Close(F);
		return Liste;
	end;
	
	procedure affiche_liste(l: in Liste, n: in Integer) is
	--affiche les n premiers elements de la liste, n est saisie au clavier par
	--l'utilisateur
	begin
		temp : Liste := l;
		i : Entier := 0; -- tête de lecture
		while temp /= null et n > i loop
			Put(temp.val.mot);
			i := i + 1;
			temp := temp.suiv;
		end loop;
	end;
	
	fonction Min(m1,m2: T_Mot) return Integer
	begin
		if TailleDe(m1) < TailleDe(m2) then
			retourner TailleDe(m1);
		else
			retourner TailleDe(m2);
		end if;
	end;
	
	procedure fusion(l: liste; m1,m2: T_Mot) is
	--fusionne le mot m2 dans m1, m2 est supprimé de la liste
	begin
		i : Entier := 0;
		Egal : Booléen
		tant que i < Min(m1,m2) TailleMin et Egal faire
			si m1(i) /= m2(i) alors
				Egal := False;
			fin si;
			i := i + 1;
		fin tq -- i = Min(m1,m2) ou non(Egal)
		si Egal alors
			Supprimer(l, m2);
			AjouteNbOcc(l, m1, m2); -- Augmente le nombre d'occurence dans la liste l de m1 du nombre d'occurence de m2
		fin si
	fin	

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
	--Requete renvoyant le nombre de mot ayant s pour suffixe et le nombre d'occurence de s	(Appel de query_NbOcc(s))
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

end analyse_syntaxique;
