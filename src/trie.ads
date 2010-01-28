-- #################################################################################
-- #                                                                               #
-- #   Nom : trie.ads                                                              #
-- #   Auteur : DREYER Quentin                                                     #
-- #   Date de création : 13/01/2010                                               #
-- #   Date de modification : 28/01/2010                                           #   
-- #                                                                               #
-- #################################################################################

-- Le type T_Trie est un type access sur une Cellule
-- Le type Cellule est un agrégat d'un sous-tableau indicé par des Tindice de type T_Trie, et de 5 entiers,
-- qui représentent le nombre d'occurence du texte 1 et 2, la taille d'un mot du texte 1 et 2, et du nombre de préfixes.
-- Le subtype Tindice représente les caractères de l'apostrophe (Character'Val(39)) jusqu'à la lettre 'z' (Character'Val(122))
-- Il est utilisé car on n'enregistre pas les lettres des mots, et par conséquent, on ne travaille qu'avec les indices du sous-tableau.

with Mot;
use Mot;

package Trie is

   type T_Trie is private;  
   subtype Tindice is character range Character'Val(39) .. Character'Val(122);
   
   function CreerTrie return T_Trie;
   -- Crée un T_Trie vide
   
   function TrieVide (T : in T_Trie) return Boolean;
   -- Teste la vacuité du T_Trie
   
   function STVide (T : in T_Trie; I : in Tindice) return Boolean;
   -- Teste la vacuité du sous-tableau du T_Trie
   
   procedure ViderTrie (T : in out T_Trie); 
   -- Vide le T_Trie
   
   -- #################################################################################

   -- Accesseurs en lecture aux elements du type Cellule
   
   function Get_ST (T : in T_Trie; I : in Tindice) return T_Trie;
   function Get_NbOcc_Txt1 (T : in T_Trie) return Integer;
   function Get_NbOcc_Txt2 (T : in T_Trie) return Integer;
   function Get_Fin_Txt1 (T : in T_Trie) return Integer;
   function Get_Fin_Txt2 (T: in T_Trie) return Integer;
   function Get_Prefixes (T : in T_Trie) return Integer;   
   
   -- #################################################################################
   
   -- Accesseurs en écriture aux elements du type Cellule
   
   procedure Set_ST (T : in out T_Trie; I : in Tindice; N : in T_Trie);
   procedure Set_NbOcc_Txt1 (T : in out T_Trie; N : Integer);
   procedure Set_NbOcc_Txt2 (T : in out T_Trie; N : Integer);
   procedure Set_Fin_Txt1 (T : in out T_Trie; N : Integer);
   procedure Set_Fin_Txt2 (T : in out T_Trie; N : Integer);
   procedure Set_Prefixes (T : in out T_Trie; N : Integer);
   
   -- #################################################################################
   
   -- Renvoit vrai si le T_Mot appartient au T_Trie, faux sinon
   
   function Appartient_Txt1 (T : in T_Trie; M : in T_Mot) return Boolean;
   function Appartient_Txt2 (T : in T_Trie; M : in T_Mot) return Boolean;

   -- #################################################################################
   
   -- Ajoute le T_Mot au T_Trie avec N occurences ayant une taille F
   
   function AjouterMot_Txt1 (T : in T_Trie; M : in T_Mot; N : in Integer; F : in Integer) return T_Trie;
   function AjouterMot_Txt2 (T : in T_Trie; M : in T_Mot; N : in Integer; F : in Integer) return T_Trie;

   -- #################################################################################
   
   -- Supprime le T_Mot du T_Trie
   
   procedure SupprimerMot_Txt1 (T : in out T_Trie; M : in T_Mot);
   procedure SupprimerMot_Txt2 (T : in out T_Trie; M : in T_Mot);

   -- #################################################################################

   -- Procedure récursive qui affiche tous les mots du T_Trie
   
   procedure AfficheTrie_Txt1(T : in T_Trie; C : in String; F : in Natural);
   procedure AfficheTrie_Txt2(T : in T_Trie; C : in String; F : in Natural);
   
   -- #################################################################################
   
   -- Procedure récusrive qui augmente le nombre d'occurence du T_Mot M1 de celui de M2 et supprime M2 dans le T_Trie
   
   procedure Fusion_Txt1 (T : in out T_Trie; M1 : in T_Mot; M2 : in T_Mot);
   procedure Fusion_Txt2 (T : in out T_Trie; M1 : in T_Mot; M2 : in T_Mot);
   
private

   type Tab is array (Tindice) of T_Trie;    
   type Cellule;
   type T_Trie is access Cellule;
   type Cellule is record
      ST : Tab;
      NbOccTxt1 : Integer;
      NbOccTxt2 : Integer;
      FinTxt1 : Integer;
      FinTxt2 : Integer;
      Prefixes : Integer;
   end record;

end Trie;
