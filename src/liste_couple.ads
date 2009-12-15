with Listegen;
with Couple;use Couple;

package Liste_Couple is

   function "<"(Couple1: T_Couple;Couple2: T_Couple) return Boolean;
   --redefinition de la fonction "<" pour le type couple
   --ici on tri les couples par ordre lexicographique

   function ">"(Couple1: T_Couple;Couple2: T_Couple) return Boolean;
   --redefinition de la fonction ">" pour le type couple
   --ici on trie les couples par ordre lexicographique

   -----------------------------------------------------------------
   --instanciation du paquetage Listegen
--   package Liste_Couple is new ListeGen(T_Elem => T_Couple,Imprime => Imprime_Couple );
   package L is new ListeGen(T_Elem => T_Couple,Imprime => Imprime_Couple );
   --utilisation de la liste instancié
--     use Liste_Couple;
   use L;
   --declaration su sous type
--   subtype TListe_Couple is Liste_Couple.T_Liste;
   subtype TListe_Couple is L.T_Liste;

   --on declarera la fonction de tri apres ici
   --function ...

   -----------------------------------------------------------------
   -----------------------------------------------------------------

end Liste_Couple;
