with Mot, Analyse_Lexicale, Ada.Text_IO, Ada.Unchecked_Deallocation;
use Mot, Analyse_Lexicale, Ada.Text_IO;

package body Trie is

   procedure Liberer is new Ada.Unchecked_Deallocation(Cellule, T_Trie);
   -- Cree une procedure de liberation d'espace pour les objets designes par le Trie

   function CreerTrie return T_Trie is
      ST : Tab;
   begin
      for I in Tindice loop
         ST(I) := null;
      end loop;
      return new Cellule'(ST, 0, 0, 0, 0, 0);
   end;
 
   function TrieVide (T : in T_Trie) return Boolean is
   begin
      return T = null;
   end;
   
   function STVide (T : in T_Trie; I : Tindice) return Boolean is
   begin
      return Get_ST(T, I) = null;
   end;

   procedure ViderTrie(T : in out T_Trie) is
   begin
      if not TrieVide(T) then
         for I in Tindice loop
            if Get_ST(T, I) /= null then
               ViderTrie(T.ST(I));
               Liberer(T.ST(I));
            end if;
         end loop;
         T := null;
      end if;
   end;
     
   -- #################################################################################
   
   function Get_ST (T : in T_Trie; I : in Tindice) return T_Trie is
   begin
      return T.ST(I);
   end;   
   
   function Get_NbOcc_Txt1 (T : in T_Trie) return Integer is
   begin
      return T.NbOccTxt1;
   end;

   function Get_nbOcc_Txt2 (T : in T_Trie) return Integer is
   begin
      return T.NbOccTxt2;
   end;

   function Get_Fin_Txt1 (T : in T_Trie) return Integer is
   begin
      return T.FinTxt1;
   end;
      
   function Get_Fin_Txt2 (T: in T_Trie) return Integer is
   begin
      return T.FinTxt2;
   end;
   
   function Get_Prefixes (T : in T_Trie) return Integer is
   begin
      return T.Prefixes;
   end;

   -- #################################################################################
   
   procedure Set_ST (T : in out T_Trie; I : in Tindice; N : in T_Trie) is
   begin
      T.ST(I) := N;
   end;
   
   procedure Set_NbOcc_Txt1 (T : in out T_Trie; N : Integer) is
   begin
      T.NbOccTxt1 := N;
   end;
	  
   procedure Set_NbOcc_Txt2 (T : in out T_Trie; N : Integer) is
   begin
      T.NbOccTxt2 := N;
   end;
   
   procedure Set_Fin_Txt1 (T : in out T_Trie; N : Integer) is
   begin
      T.FinTxt1 := N;
   end;
   
   procedure Set_Fin_Txt2 (T : in out T_Trie; N : Integer) is
   begin
      T.FinTxt2 := N;
   end;
   
   procedure Set_Prefixes (T : in out T_Trie; N : Integer) is
   begin
      T.Prefixes := N;
   end;
   
   -- #################################################################################
   
   function Appartient_Txt1 (T : in T_Trie; M : in T_Mot) return Boolean is
      C : Character;
	  Mot : T_Mot;
   begin
      if TrieVide(T) then
	     return False;
      else
         if MotVide(M) then
		    return Get_NbOcc_Txt1(T) > 0;
	     else
            C := Get_Char(M);
            Mot := Get_CharSuffixe(M);
            return Appartient_Txt1(Get_ST(T, C), Mot);
	     end if;
      end if; 
   end;
   
   function Appartient_Txt2 (T : in T_Trie; M : in T_Mot) return Boolean is
      C : Character;
	  Mot : T_Mot;   
   begin
      if TrieVide(T) then
	     return false;
	  else
         if MotVide(M) then
		    return Get_NbOcc_Txt2(T) > 0;
	     else
            C := Get_Char(M);
            Mot := Get_CharSuffixe(M);
            return Appartient_Txt2(Get_ST(T, C), Mot);
	     end if;
      end if; 
   end;   

   -- #################################################################################
   
   function AjouterMot_Txt1(T : in T_Trie; M : in T_Mot; N : in Integer; F : in Integer) return T_Trie is
      Trie : T_Trie;
      C : Character;
      Mot : T_Mot;
   begin
      if TrieVide(T) then
         Trie := CreerTrie;
         return AjouterMot_Txt1(Trie, M, N, F);
      else
	     T.Prefixes := Get_Prefixes(T) + 1;
	     if MotVide(M) then
            T.NbOccTxt1 := Get_NbOcc_Txt1(T) + N;
            T.FinTxt1 := F;
         else
            C := Get_Char(M);
            Mot := Get_CharSuffixe(M);
            T.ST(C) := AjouterMot_Txt1(Get_ST(T, C), Mot, N, F);
	     end if;
         return T;
      end if;
   end;

   function AjouterMot_Txt2(T : in T_Trie; M : in T_Mot; N : in Integer; F : in Integer) return T_Trie is
      Trie : T_Trie;
      C : Character;
      Mot : T_Mot;
   begin
      if TrieVide(T) then
         Trie := CreerTrie;
         return AjouterMot_Txt2(Trie, M, N, F);
      else
	     T.Prefixes := T.Prefixes + 1;
	     if MotVide(M) then
            T.NbOccTxt2 := Get_NbOcc_Txt2(T) + N;
            T.FinTxt2 := F;
         else
            C := Get_Char(M);
            Mot := Get_CharSuffixe(M);
            T.ST(C) := AjouterMot_Txt2(T.ST(C), Mot, N, F);
		 end if;
         return T;
      end if;
   end;
   
   -- #################################################################################
   
   procedure SupprimerMot_Txt1 (T : in out T_Trie; M : in T_Mot) is
      C : Character;
	  Mot : T_Mot;
   begin
      if not TrieVide(T) then
	     T.Prefixes := Get_Prefixes(T) - 1;
         if MotVide(M) then
            T.NbOccTxt1 := 0;
			T.FinTxt1 := 0;
	     else
            C := Get_Char(M);
            Mot := Get_CharSuffixe(M);
            SupprimerMot_Txt1(T.ST(C), Mot);
            if Get_Prefixes(Get_ST(T, C)) = 0 then
			   T.ST(C) := null;
			end if;
         end if;
      end if;
   end;
   
   procedure SupprimerMot_Txt2 (T : in out T_Trie; M : in T_Mot) is
      C : Character;
	  Mot : T_Mot;
   begin
      if not TrieVide(T) then
         if MotVide(M) then
            T.Prefixes := T.Prefixes - 1;
            T.NBOccTxt2 := 0;
			T.FinTxt2 := 0;
	     else
            T.Prefixes := T.Prefixes - 1;
            C := Get_Char(M);
            Mot := Get_CharSuffixe(M);
            SupprimerMot_Txt2(T.ST(C), Mot);
            if T.ST(C).Prefixes = 0 then
			   T.ST(C) := null;
			end if;
         end if;
      end if;
   end;
   
   -- #################################################################################
   
   procedure AfficheTrie_Txt1(T : in T_Trie; C : in String; F : in Natural) is
      Chaine : String(1 .. 30);
      Fin : Natural;
   begin
      if not TrieVide(T) then
         Chaine := C;
         Fin := F;
         for I in Tindice loop
            if T.ST(I) /= null then
               if T.ST(I).Prefixes > 0 then
                  Fin := Fin + 1;
                  Chaine(Fin) := I;
               end if;
               if T.ST(I).NbOccTxt1 > 0 then -- nbOcc = 1 ou +
                  Put(Chaine(Chaine'First .. Fin));
                  Put_Line(Integer'Image(T.ST(I).NbOccTxt1));
               end if;
               AfficheTrie_Txt1(T.ST(I), Chaine, Fin);
               Fin := Fin - 1;
            end if;
         end loop;
      end if;
   end;

   procedure AfficheTrie_Txt2(T : in T_Trie; C : in String; F : in Natural) is
      Chaine : String(1 .. 30);
      Fin : Natural;
   begin
      if not TrieVide(T) then
         Chaine := C;
         Fin := F;
         for I in Tindice loop
            if T.ST(I) /= null then
               if T.ST(I).Prefixes > 0 then
                  Fin := Fin + 1;
                  Chaine(Fin) := I;
               end if;
               if T.ST(I).NbOccTxt1 > 0 or else T.ST(I).NbOccTxt2 > 0 then -- nbOcc = 1 ou +
                  Put(Chaine(Chaine'First .. Fin));
                  Put_Line(Integer'Image(T.ST(I).NbOccTxt1) & Integer'Image(T.ST(I).NbOccTxt2));
               end if;
               AfficheTrie_Txt2(T.ST(I), Chaine, Fin);
               Fin := Fin - 1;
            end if;
         end loop;
      end if;
   end;

   -- #################################################################################
   
   procedure Fusion_Txt1 (T : in out T_Trie; M1 : in T_Mot; M2 : in T_Mot) is
   begin
      if not TrieVide(T) and then Appartient_Txt1(T, M1) and then Appartient_Txt1(T, M2) then
		 T := AjouterMot_Txt1(T, M1, Query_NbOcc_Txt1(T, M2), 0);
		 SupprimerMot_Txt1(T, M2);
		 Put_Line("Le mot " & Get_Chaine(M2)(1 .. Get_Fin(M2)) & " a ete supprime !");
		 New_Line;
      end if;
   end;

   procedure Fusion_Txt2 (T : in out T_Trie; M1 : in T_Mot; M2 : in T_Mot) is
   begin
      if not TrieVide(T) and then (Appartient_Txt1(T, M1) or else Appartient_Txt2(T, M1)) and then (Appartient_Txt1(T, M2) or else Appartient_Txt2(T, M2)) then
		 T := AjouterMot_Txt1(T, M1, Query_NbOcc_Txt1(T, M2), 0);
		 T := AjouterMot_Txt2(T, M1, Query_NbOcc_Txt2(T, M2), 0);
	     if Appartient_Txt1(T, M2) then
		    SupprimerMot_Txt1(T, M2);
         end if;
		 if Appartient_Txt2(T, M2) then
		    SupprimerMot_Txt2(T, M2);
		 end if;		 
		 Put_Line("Le mot " & Get_Chaine(M2)(1 .. Get_Fin(M2)) & " a ete supprime !");
	     New_Line;
      end if;		 
   end;
   
end Trie;
