with Mot;
use Mot;

package body Trie is

   function CreerTrie return T_Trie is
   begin
      return null;
   end;
   
   function TrieVide(T : T_Trie) return Boolean is
   begin
      return T = null;
   end;
   
   function AjouterMot(T : T_Trie; M : T_Mot) return T_Trie is
      -- si T = Vide alors crée un T contenant E
      Trie : T_Trie;
      C : Character;
      Mot : T_Mot;
   begin
      if TrieVide(T) then
         Trie := CreerTrie;
         return AjouterMot(Trie, M);
      elsif MotVide(M) then
         T.Mots := T.Mots + 1;
         return T;
      else
         C := Get_Char(M);
         Mot := Get_CharSuffixe(M);
         T.ST(C) := AjouterMot(T.ST(C), Mot);
         return T;
      end if;
   end;
      
   function CompteMots(T : T_Trie; M : T_Mot) return Integer is
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
      
   function ComptePrefixe(T : T_Trie; M : T_Mot) return Integer is
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
      
end Trie;
