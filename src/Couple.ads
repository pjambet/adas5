with ListeGen;
with Ada.Text_Io;use Ada.Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package Couple is
   --Definition du type t qui permet ainsi d'analyser les textes en ne
   --selectionnant que les "String" qui doivent etre definies ici
   type T_Couple is private;

   procedure Imprime_Couple(C: in T_Couple);
   --Definition de la fonction d'affichage d'un couple
   --Necessaire pour l'instanciation de la liste generique

   function Get_Mot(C: T_Couple) return String;
   --Renvoie le mot du couple C

   function Get_NbOcc(C: T_Couple) return Integer;
   --Renvoie le nombre d'occurence du mot du Couple C

   procedure Set_NbOcc(A: in Integer;C: in out T_Couple);
   --Modifie la nbocc de C en A
   --Get_Nbocc(Set_NbOcc(A,C))=A

   function EstMot(S: String)return boolean;
   --Renvoie vrai si la chaine S est un mot,
   --par exemple "Bonjour" est un mot mais "hello world" n'en est pas un

   function EstMotSignificatif(T: String)return boolean;
   --Renvoie vrai si le mot T est significatif. un mot est significatif si il
   --est de longueur supérieur a 3 ou si il est de longeur de 3 et qu'il est
   --est un "petit mot important" (cf petits-mots.txt)

   function EstLongMot(T: String) return boolean;
   --Renvoie vrai si le mot T est de longueur strictement supérieur a 3

   function EstPetitMotImp(T: String) return boolean;
   --Renvoie true si T est de longueur 3 et qu'il fait parti du fichier
   --petits-mots.txt

   function EstSuffixede(T1: String;T2: String)return Boolean;
   --precondition : taille(T1)<taille(T2)
   --
   --Renvoie true si T1 est suffixe de T2, false sinon
   --exemple : T1 : "ment" T2 = "lentement"
   --La fonction renvoie vrai

   function EstPrefixede(T1: String;T2: String)return Boolean;
   --precondition : taille(T1)<taille(T2)
   --
   --Renvoie true si T1 est prefixe de T2, false sinon
   --exemple : T1 = "lent" T2="lentement"
   --La fonction renvoie vrai

   function EstFacteurDe(T1: String;T2: String)return boolean;
   --precondition : taille(T1)<taille(T2)
   --
   --Renvoie true si T2 est facteur de T2, false sinon
   --exemple : T1 = "bbb" T2 = "abbba"
   --La fonction renvoie vrai

   -- ... A completer eventuellement par la suite

private
   --type String is subtype String A..Z A..Z;
   --l'idée est de créer le type mot qui est un string réduit qui correspond forcement
   --a un mot alors qu'une chaine de charactere qui peut etre plusieurs mots ou avec
   --des chiffres
   type T_Couple is record
      Mot: String(1..30);
      NbOcc: Integer;
   end record;



end Couple;
