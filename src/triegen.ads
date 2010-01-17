generic

   type T_Elem is private;
   with procedure Imprime(E : in T_Elem);

   package TrieGen is
      
      type T_Trie is private;
         
      function CreerTrie return T_Trie;
      
      function TrieVide(T : T_Trie) return Boolean;
      function ElemVide(E : T_Elem) return Boolean;
  
      function AjouterMot(T : T_Trie; E : T_Elem) return T_Trie;
      -- si T = Vide alors crée un T contenant E
      
      function CompteMots(T : T_Trie; E : T_Elem) return Integer;
      -- si T = Vide alors retourne 0
      
      function ComptePrefixe(T : T_Trie; E : T_Elem) return Integer;
      -- si T = Vide alors retourne 0

   private
         
      type Tab is array (1 .. 26) of T_Trie;
      type Celulle;
      type T_Trie is access Celulle;
      type Celulle is record
         ST : Tab;
         Mots : Integer;
         Prefixes : Integer;
      end record;
      
end TrieGen;
