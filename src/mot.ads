package Mot is
   --Definition du type mot qui permet ainsi d'analyser les textes en ne
   --selectionnant que les "T_Mot" qui doivent etre definies ici
   type T_Mot is private;

   function EstMotSignificatif(T_Mot)return boolean;
   --

   function EstLongMot(T_Mot) return boolean;
   --

   function EstPetitMotImp(T_Mot) return boolean;
   --

   -- ... A completer par la suite

private:
   type T_Mot is ... -- je sais pas encore
end Mot;
