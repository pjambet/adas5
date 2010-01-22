with Mot;
use Mot;

package Trie is

   type T_Trie is private;

   function CreerTrie return T_Trie;
   function TrieVide(T : in T_Trie) return Boolean;

   function AjouterMot(T : in T_Trie; M : in T_Mot) return T_Trie;
   -- si T = Vide alors crée un T contenant E

   function CompteMots(T : in T_Trie; M : in T_Mot) return Integer;
   -- si T = Vide alors retourne 0

   function ComptePrefixe(T : in T_Trie; M : in T_Mot) return Integer;
   -- si T = Vide alors retourne 0

   procedure AfficheTrie(T : in T_Trie; C : in out String; F : in out Natural);

   procedure AffichageN(T : in T_Trie; N : in Integer);
   -- affiche les N premiers mots du trie

private

   subtype Tindice is character range Character'Val(39) .. Character'Val(122); -- ''' .. 'z';

   type Tab is array (Tindice) of T_Trie;
   type Celulle;
   type T_Trie is access Celulle;
   type Celulle is record
      ST : Tab;
      Mots : Integer;
      Prefixes : Integer;
   end record;

end Trie;
