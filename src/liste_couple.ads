with Listegen;
with Couple;use Couple;

package Liste_Couple is

   function InferieurCouple(Couple1: T_Couple;Couple2: T_Couple) return Boolean;
   --redefinition de la fonction "<" pour le type couple
   --ici on tri les couples par ordre lexicographique

   function SuperieurCouple(Couple1: T_Couple;Couple2: T_Couple) return Boolean;
   --redefinition de la fonction ">" pour le type couple
   --ici on trie les couples par ordre lexicographique

   function EgaleCouple(Couple1: T_Couple;Couple2: T_Couple) return Boolean;
   --redefinition de la fonction "=" pour le type couple
   --ici on trie les couples par ordre lexicographique

   -----------------------------------------------------------------
   --instanciation du paquetage Listegen
   package L is new ListeGen(T_Elem => T_Couple,Imprime => Imprime_Couple);
   --utilisation de la liste instancié
   use L;
   --declaration su sous type
   subtype TListe_Couple is L.T_Liste;

   procedure Modif_FusionCouple(L1,L2: in out TListe_Couple);
   --Modifie L1 en y ajoutant les occurence de L2, L2 sera supprimé
   --mais cela sera fait dans la fonction Fusion definie dans listegen

   procedure Fusion_Couple is new L.Fusion(Modif_FusionCouple);
   procedure InsererTriee_Couple is new L.InsererTriee(SuperieurCouple,EgaleCouple,InferieurCouple);

   -----------------------------------------------------------------
   -----------------------------------------------------------------

end Liste_Couple;
