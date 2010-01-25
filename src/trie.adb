with Mot, Ada.Text_IO, Ada.Unchecked_Deallocation;
use Mot, Ada.Text_IO;

package body Trie is

   procedure Liberer is new Ada.Unchecked_Deallocation(Cellule, T_Trie);
   -- Cree une procedure de liberation d'espace pour les objets designes par le Trie

   function CreerTrie return T_Trie is
      T : T_Trie;
      ST : Tab;
   begin
      for I in Tindice loop
         ST(I) := null;
      end loop;
      T := new Cellule'(ST, 0, 0, 0);
      return T;
   end;

   procedure ViderTrie(T : in out T_Trie) is
   begin
      if not TrieVide(T) then
         for I in Tindice loop
            if T.ST(I) /= null then
               ViderTrie(T.ST(I));
               Liberer(T.ST(I));
            end if;
         end loop;
         T := null;
      end if;
   end;
   
   function TrieVide(T : in T_Trie) return Boolean is
   begin
      return T = null;
   end;

   function STVide (T : in T_Trie; I : Tindice) return Boolean is
   begin
      return Get_ST(T, I) = null;
   end;

   function Get_ST(T : in T_Trie; I : in Tindice) return T_Trie is
   begin
      return T.ST(I);
   end;   
   
   function Get_MotsTxt1(T : in T_Trie) return Integer is
   begin
      return T.MotsTxt1;
   end;

   function Get_MotsTxt2(T : in T_Trie) return Integer is
   begin
      return T.MotsTxt2;
   end;

   function Get_Prefixes (T : in T_Trie) return Integer is
   begin
      return T.Prefixes;
   end;
   
   function AjouterMot_Txt1(T : in T_Trie; M : in T_Mot; N : in Integer) return T_Trie is
      Trie : T_Trie;
      C : Character;
      Mot : T_Mot;
   begin
      if TrieVide(T) then
         Trie := CreerTrie;
         return AjouterMot_Txt1(Trie, M, N);
      elsif MotVide(M) then
         T.Prefixes := T.Prefixes + 1;
         T.MotsTxt1 := T.MotsTxt1 + N;
         return T;
      else
         T.Prefixes := T.Prefixes + 1;
         C := Get_Char(M);
         Mot := Get_CharSuffixe(M);
         T.ST(C) := AjouterMot_Txt1(T.ST(C), Mot, N);
         return T;
      end if;
   end;

   function AjouterMot_Txt2(T : in T_Trie; M : in T_Mot; N : in Integer) return T_Trie is
      Trie : T_Trie;
      C : Character;
      Mot : T_Mot;
   begin
      if TrieVide(T) then
         Trie := CreerTrie;
         return AjouterMot_Txt2(Trie, M, N);
      elsif MotVide(M) then
         T.Prefixes := T.Prefixes + 1;
         T.MotsTxt2 := T.MotsTxt2 + N;
         return T;
      else
         T.Prefixes := T.Prefixes + 1;
         C := Get_Char(M);
         Mot := Get_CharSuffixe(M);
         T.ST(C) := AjouterMot_Txt2(T.ST(C), Mot, N);
         return T;
      end if;
   end;
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
               if T.ST(I).MotsTxt1 > 0 then -- nbOcc = 1 ou +
                  Put(Chaine(Chaine'First .. Fin));
                  Put_Line(Integer'Image(T.ST(I).MotsTxt1));
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
               if T.ST(I).MotsTxt1 > 0 or else T.ST(I).MotsTxt2 > 0 then -- nbOcc = 1 ou +
                  Put(Chaine(Chaine'First .. Fin));
                  Put_Line(Integer'Image(T.ST(I).MotsTxt1) & Integer'Image(T.ST(I).MotsTxt2));
               end if;
               AfficheTrie_Txt2(T.ST(I), Chaine, Fin);
               Fin := Fin - 1;
            end if;
         end loop;
      end if;
   end;

   function CompteMotsTxt1(T : in T_Trie; M : in T_Mot) return Integer is
      C : Character;
      Mot : T_Mot;
   begin
      if TrieVide(T) then
         return 0;
      elsif MotVide(M) then
         return T.MotsTxt1;
      else
         C := Get_Char(M);
         Mot := Get_CharSuffixe(M);
         return CompteMotsTxt1(T.ST(C), Mot);
      end if;
   end;

   function CompteMotsTxt2(T : in T_Trie; M : in T_Mot) return Integer is
      C : Character;
      Mot : T_Mot;
   begin
      if TrieVide(T) then
         return 0;
      elsif MotVide(M) then
         return T.MotsTxt2;
      else
         C := Get_Char(M);
         Mot := Get_CharSuffixe(M);
         return CompteMotsTxt2(T.ST(C), Mot);
      end if;
   end;

end Trie;
