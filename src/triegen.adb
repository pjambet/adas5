package body TrieGen is
   
   function CreerTrie return T_Trie is
   begin
      return null;
   end;
   
   function TrieVide(T : T_Trie) return Boolean is
   begin
      return T = null;
   end;
   
   function AjouterMot(T : T_Trie; E : T_Elem) return T_Trie is
   -- si T = Vide alors crée un T contenant E
   begin
      
   end;
   
      
   function CompteMots(T : T_Trie; E : T_Elem) return Integer is
   -- si T = Vide alors retourne 0
   begin
   end;
      
   function ComptePrefixe(T : T_Trie; E : T_Elem) return Integer is
   -- si T = Vide alors retourne 0
   begin
   end;

end TrieGen;
