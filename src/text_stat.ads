package Text_Stat is
   --Ce paquetage permet d'effectuer des opérations "statistiques" sur le texte analysé
   --nombre total de mots, nombre de mots de longueur supérieur ou égale a un entier positif donné,
   --longueur moyenne d'un mot, et surement d'autres plus tard

   function Num_Mot_Tot(Texte) return Integer;
   --Calcule le nombre total de mot du texte
   
   function Num_Occ_Moy(?) return Integer;
   --Calcule le nombre d'occurence moyen... Je sais pas ce que c'est ...
   
   function Long_Moy(Texte) return Integer;
   --Calcule la longueur moyenne d'un mot dans le texte
   
   function Num_Mot_Sup(Texte;N: Integer) return Integer;
   --Calcule le nombre de mot dont la longueur est supérieur ou égale a un entier positif donné

end Text_Stat;
