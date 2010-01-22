with Mot, Ada.Text_IO;
use Mot, Ada.Text_IO;

package body Trie is

   function CreerTrie return T_Trie is
      T : T_Trie;
      ST : Tab;
   begin
      for I in Tindice loop
         ST(I) := null;
      end loop;
      T := new Celulle'(ST, 0, 0);
      return T;
   end;

   function TrieVide(T : in T_Trie) return Boolean is
   begin
      return T = null;
   end;

   function AjouterMot(T : in T_Trie; M : in T_Mot) return T_Trie is
      -- si T = Vide alors crée un T contenant E
      Trie : T_Trie;
      C : Character;
      Mot : T_Mot;
   begin
      if TrieVide(T) then
         Trie := CreerTrie;
         return AjouterMot(Trie, M);
      elsif MotVide(M) then
         T.Prefixes := T.Prefixes + 1;
         T.Mots := T.Mots + 1;
         return T;
      else
         T.Prefixes := T.Prefixes + 1;
         C := Get_Char(M);
         Mot := Get_CharSuffixe(M);
         T.ST(C) := AjouterMot(T.ST(C), Mot);
         return T;
      end if;
   end;

   function CompteMots(T : in T_Trie; M : in T_Mot) return Integer is
      -- si T = Vide alors retourne 0
      C : Character;
      Mot : T_Mot;
   begin
      if TrieVide(T) then
         return 0;
      elsif MotVide(M) then
         return T.Mots;
      else
         C := Get_Char(M);
         Mot := Get_CharSuffixe(M);
         return CompteMots(T.ST(C), Mot);
      end if;
   end;

   function ComptePrefixe(T : in T_Trie; M : in T_Mot) return Integer is
      -- si T = Vide alors retourne 0
      C : Character;
      Mot : T_Mot;
   begin
      if TrieVide(T) then
         return 0;
      elsif MotVide(M) then
         return T.Prefixes;
      else
         C := Get_Char(M);
         Mot := Get_CharSuffixe(M);
         return ComptePrefixe(T.ST(C), Mot);
      end if;
   end;

   procedure AfficheTrie(T : in T_Trie; C : in out String; F : in out Natural) is
   begin
      if not TrieVide(T) then
         for I in Tindice loop
            if T.ST(I) /= null then
               if T.ST(I).Prefixes > 0 then
                  F := F + 1;
                  C(F) := I; 
               end if;
               if T.ST(I).Mots > 0 then -- nbOcc = 1 ou +
                  Put(C(C'First .. F));
                  Put_Line(Integer'Image(T.ST(I).Mots));
               end if;               
               AfficheTrie(T.ST(I), C, F);
               F := 1;
            end if;
         end loop;
      end if;
   end;

   procedure AffichageN(T : in T_Trie; N : in Integer) is
   -- affiche les N premiers mots du trie
   begin
      if not TrieVide(T) and N > 0 then
         for I in Tindice loop
            if T.ST(I) /= null then
               Put(I);
               if T.ST(I).Mots > 0 then
                  Put_Line(Integer'Image(T.ST(I).Mots));
               end if;
            end if;
            AffichageN(T.ST(I), N-1);
         end loop;
      end if;
   end;

end Trie;
