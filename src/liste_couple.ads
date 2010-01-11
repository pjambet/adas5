with Listegen, Couple;
use Couple;

package Liste_Couple is

   --instanciation du paquetage Listegen
   package L is new ListeGen(T_Elem => T_Couple, Imprime => Imprime_Couple);
   --utilisation de la liste instancié
   use L;
   --declaration su sous type
   subtype TListe_Couple is L.T_Liste;

   function Inferieur_Couple_Lex(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   --redefinition de la fonction "<" pour le type couple
   --ici on tri les couples par ordre lexicographique

   function Superieur_Couple_Lex(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   --redefinition de la fonction ">" pour le type couple
   --ici on trie les couples par ordre lexicographique

   function Egale_Couple_Lex(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   --redefinition de la fonction "=" pour le type couple
   --ici on trie les couples par ordre lexicographique

   function Inferieur_Couple_Occ(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   --redefinition de la fonction "<" pour le type couple
   --ici on tri les couples par nombre d'occurence décroissante

   function Superieur_Couple_Occ(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   --redefinition de la fonction ">" pour le type couple
   --ici on trie les couples par nombre d'occurence décroissante

   function Egale_Couple_Occ(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   --redefinition de la fonction "=" pour le type couple
   --ici on trie les couples par nombre d'occurence décroissante

   procedure Modif_FusionCouple(L : in out T_Liste; T1, T2 : in out T_Couple);
   --Modifie L1 en y ajoutant les occurence de L2, L2 sera supprimé
   --mais cela sera fait dans la fonction Fusion definie dans listegen

   procedure Traitement_Doublon_Couple(L : in out TListe_Couple);

   procedure Fusion_Couple is new L.Fusion(Modif_FusionCouple);

   procedure InsererTriee_Couple_Lex is new L.InsererTriee(Superieur_Couple_Lex, Egale_Couple_Lex, Inferieur_Couple_Lex, Traitement_Doublon_Couple);
   function CopieTriee_Couple_Lex is new L.CopieTriee(InsererTriee_Couple_Lex);

   procedure InsererTriee_Couple_Occ is new L.InsererTriee(Superieur_Couple_Occ, Egale_Couple_Occ, Inferieur_Couple_Occ, Traitement_Doublon_Couple);
   function CopieTriee_Couple_Occ is new L.CopieTriee(InsererTriee_Couple_Occ);

end Liste_Couple;
