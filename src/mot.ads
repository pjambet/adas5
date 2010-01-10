with Ada.Text_IO;use Ada.Text_Io;
package Mot is

   package Es_Entier is new Ada.Text_Io.Integer_Io(Integer);

   use Es_Entier;

   type T_Mot is private;

   function Superieur_Mot(M1,M2: T_Mot)return Boolean;
   function Inferieur_Mot(M1,M2: T_Mot)return Boolean;
   function Egale_Mot(M1,M2: T_Mot)return Boolean;

   function Creer_Mot(S: String) return T_Mot;

   procedure Set_Chaine(M: in out T_Mot;S: in String);
   function Get_Chaine(M: T_Mot) return String;

   function Get_Fin(M: T_Mot) return Integer;
   procedure Set_Fin(M: in out T_Mot;I: in Integer);

   function Compare_Mots(M1,M2: T_Mot)return boolean;
   function Compare_Chaine_Mot(S: String;M: T_Mot)return Boolean;
   --Compare une chaine avec le mot contenu dans t_couple
   --renvoie vrai si S = M.mot
   --renvoie faux sinon
   --On a besoin de cette fonction pour utiliser l'indice de fin
   --contenu dans le couple

   function EstMotSignificatif(M: T_Mot)return boolean;
   --Renvoie vrai si le mot T est significatif. un mot est significatif si il
   --est de longueur supérieur a 3 ou si il est de longeur de 3 et qu'il est
   --est un "petit mot important" (cf petits-mots.txt)

   function EstLongMot(M: T_Mot) return boolean;
   --Renvoie vrai si le mot T est de longueur strictement supérieur a 3

   function EstPetitMotImp(M: T_Mot) return boolean;
   --Renvoie true si T est de longueur 3 et qu'il fait parti du fichier
   --petits-mots.txt

   function EstSuffixede(M1: T_Mot;M2: T_Mot)return Boolean;
   --precondition : taille(M1)<taille(M2)
   --
   --Renvoie true si M1 est suffixe de M2, false sinon
   --exemple : M1 : "ment" M2 = "lentement"
   --La fonction renvoie vrai

   function EstPrefixede(M1: T_Mot;M2: T_Mot)return Boolean;
   --precondition : taille(M1)<taille(M2)
   --
   --Renvoie true si M1 est prefixe de M2, false sinon
   --exemple : M1 = "lent" M2="lentement"
   --La fonction renvoie vrai

   function EstFacteurDe(M1: T_Mot;M2: T_Mot)return boolean;
   --precondition : taille(M1)<taille(M2)
   --
   --Renvoie true si M2 est facteur de M2, false sinon
   --exemple : M1 = "bbb" M2 = "abbba"
   --La fonction renvoie vrai


private
      type T_Mot is record
         chaine: String(1..30);
         Fin: Integer;
      end record;

end Mot;
