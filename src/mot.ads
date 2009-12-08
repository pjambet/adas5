with ListeGen;
package Mot is
   --Definition du type mot qui permet ainsi d'analyser les textes en ne
   --selectionnant que les "T_Mot" qui doivent etre definies ici
   type T_Mot is private;

   function EstMot(S: String)return boolean;
   --Renvoie vrai si la chaine S est un mot,
   --par exemple "Bonjour" est un mot mais "hello world" n'en est pas un
   
   function EstMotSignificatif(T: T_Mot)return boolean;
   --Renvoie vrai si le mot T est significatif. un mot est significatif si il
   --est de longueur supérieur a 3 ou si il est de longeur de 3 et qu'il est 
   --est un "petit mot important" (cf petits-mots.txt)
   
   function EstLongMot(T: T_Mot) return boolean;
   --Renvoie vrai si le mot T est de longueur strictement supérieur a 3

   function EstPetitMotImp(T: T_Mot) return boolean;
   --Renvoie true si T est de longueur 3 et qu'il fait parti du fichier 
   --petits-mots.txt

   function EstSuffixede(T1: T_Mot;T2: T_Mot)return Boolean;
   --Renvoie true si T1 est suffixe de T2, false sinon
   --exemple : T1 : "ment" T2 = "lentement"
   --La fonction renvoie vrai
   
   function EstPrefixede(T1: T_Mot;T2: T_Mot)return Boolean;
   --Renvoie true si T1 est prefixe de T2, false sinon
   --exemple : T1 = "lent" T2="lentement"
   --La fonction renvoie vrai
    
   function EstFacteurDe(T1: T_Mot;T2: T_Mot)return boolean;
   --Renvoie true si T2 est facteur de T2, false sinon
   --exemple : T1 = "bbb" T2 = "abbba" 
   --La fonction renvoie vrai
   
   -- ... A completer eventuellement par la suite

private:
      type T_Mot is subtype String A..Z A..Z;
      --l'idée est de créer le type mot qui est un string réduit qui correspond forcement
      --a un mot alors qu'une chaine de charactere qui peut etre plusieurs mots ou avec
      --des chiffres      
end Mot;
