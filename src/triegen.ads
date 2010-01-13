generic

   type T_Elem is private;
   with procedure Imprime(X : in T_Elem);

   package TrieGen is
      
      type T_Trie is private;
         
      function CreerTrie return T_Trie;
      function TrieVide(T : T_Trie) return Boolean;
      function AjouterMot(T : T_Trie; E : T_Elem) return T_Trie;
      -- si T = Vide alors crée un T contenant E
      
      function CompteMots(T : T_Trie; E : T_Elem) return Integer;
      -- si T = Vide alors retourne 0
      
      function ComptePrefixe(T : T_Trie; E : T_Elem) return Integer;
      -- si T = Vide alors retourne 0

      private
         
      type Tab is array (1 .. 30) of T_Trie;
      type Cellule;
      type T_Trie is access Cellule;
      type Cellule is record
         ST : Tab;
         Mots : T_Elem;
         Prefixe : Integer;
      end record;
      
   end TrieGen;
