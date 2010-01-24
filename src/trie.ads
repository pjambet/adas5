with Mot, Ada.Text_IO;
use Mot, Ada.Text_IO;

package Trie is

   type T_Trie is private;  
   subtype Tindice is character range Character'Val(39) .. Character'Val(255); -- ''' .. 'z';
      
   function CreerTrie return T_Trie;
   function TrieVide(T : in T_Trie) return Boolean;
   procedure ViderTrie(T : in out T_Trie);

   function AjouterMot_Txt1(T : in T_Trie; M : in T_Mot; N : in Integer) return T_Trie;
   function AjouterMot_Txt2(T : in T_Trie; M : in T_Mot; N : in Integer) return T_Trie;

   function CompteMotsTxt1(T : in T_Trie; M : in T_Mot) return Integer;   
   function CompteMotsTxt2(T : in T_Trie; M : in T_Mot) return Integer;

   function CompteMotsTot(T : in T_Trie) return Integer;
   
   procedure AfficheTrie_Txt1(T : in T_Trie; C : in String; F : in Natural);
   procedure AfficheTrie_Txt2(T : in T_Trie; C : in String; F : in Natural);   

   procedure AffichageN(T : in T_Trie; N : in Integer; C : in String; F : in Natural);
   -- affiche les N premiers mots du trie
   
   procedure Ecriture_Dest_Txt1(T : in T_Trie; C : in String; F : in Natural; D : in File_Type);
   procedure Ecriture_Dest_Txt2(T : in T_Trie; C : in String; F : in Natural; D : in File_Type);

   procedure Query_Intersection (T : in T_Trie; C : in String; F : in Natural);
   -- affiche les mots communs de deux auteurs
   procedure Query_Difference (T : in T_Trie; C : in String; F : in Natural);
   -- affiche les mots d'un auteur et pas de l'autre (et vice versa)

   function Get_SousTab(T : in T_Trie; I : in Tindice) return T_Trie;
   function Get_MotsTxt1(T : in T_Trie) return Integer;
   function Get_MotsTxt2(T : in T_Trie) return Integer;
   
   private

   type Tab is array (Tindice) of T_Trie;    
   type Cellule;
   type T_Trie is access Cellule;
   type Cellule is record
      ST : Tab;
      MotsTxt1 : Integer;
      MotsTxt2 : Integer;
      Prefixes : Integer;
   end record;

end Trie;
