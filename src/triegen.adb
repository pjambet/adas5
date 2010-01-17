package body TrieGen is

   function CreerTrie return T_Trie is
   begin
      return null;
   end;
   
   function TrieVide(T : T_Trie) return Boolean is
   begin
      return T = null;
   end;
   
   function ElemVide(E : T_Elem) return Boolean is
   begin
      return E(E'First) = ' ';
   end;
   
   function AjouterMot(T : T_Trie; E : T_Elem) return T_Trie is
      -- si T = Vide alors crée un T contenant E
      Trie : T_Trie;
      C : Character;
      M : T_Elem;
   begin
      if TrieVide(T) then
         Trie := CreerTrie;
         return AjouterMot(Trie, E);
      elsif ElemVide(E) then
         T.Mots := T.Mots + 1;
         return T;
      else
         C := E(E'First);
         M := E(E'First+1 .. E'Last);
         T.ST(I) := AjouterMot(T.ST(C), M);
         return T;
      end if;
   end;
      
   function CompteMots(T : T_Trie; E : T_Elem) return Integer is
      -- si T = Vide alors retourne 0
      C : Character;
      M : T_Elem;
   begin
      if TrieVide(T) then
         return 0;
      elsif ElemVide(E) then
         return T.Mots;
      else
         C := E(E'First);
         M := E(E'First+1 .. E'Last);
         return CompteMots(T.ST(C), M);
      end if;
   end;
      
   function ComptePrefixe(T : T_Trie; E : T_Elem) return Integer is
   begin
      return 0;
   end;
      
end TrieGen;
