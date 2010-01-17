with Mot;
use Mot;

package Trie is
      
      type T_Trie is private;
         
      function CreerTrie return T_Trie;      
      function TrieVide(T : T_Trie) return Boolean;
      function AjouterMot(T : T_Trie; M : T_Mot) return T_Trie;
      -- si T = Vide alors crée un T contenant E
      function CompteMots(T : T_Trie; M : T_Mot) return Integer;
      -- si T = Vide alors retourne 0
      function ComptePrefixe(T : T_Trie; M : T_Mot) return Integer;
      -- si T = Vide alors retourne 0

      private
         
      type Tab is array (Character) of T_Trie;
      type Celulle;
      type T_Trie is access Celulle;
      type Celulle is record
         ST : Tab;
         Mots : Integer;
         Prefixes : Integer;
      end record;
      
end Trie;
