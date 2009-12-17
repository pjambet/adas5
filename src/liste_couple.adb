package body Liste_couple is

   function InferieurCouple(Couple1: T_Couple;Couple2: T_Couple) return Boolean is
      --redefinition de la fonction "<" pour le type couple
      --ici on tri les couples par ordre lexicographique
   begin
      return Get_Mot(Couple1) < Get_Mot(Couple2);
   end;

   function SuperieurCouple(Couple1: T_Couple;Couple2: T_Couple) return Boolean is
      --redefinition de la fonction ">" pour le type couple
      --ici on trie les couples par ordre lexicographique
   begin
      return Get_Mot(Couple1) > Get_Mot(Couple2);
   end;

   function EgaleCouple(Couple1: T_Couple;Couple2: T_Couple) return Boolean is
      --redefinition de la fonction ">" pour le type couple
      --ici on trie les couples par ordre lexicographique
   begin
      return Get_Mot(Couple1) = Get_Mot(Couple2);
   end;

end Liste_Couple;
