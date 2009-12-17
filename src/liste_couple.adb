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

   procedure Modif_FusionCouple(L1,L2: in out TListe_Couple) is
      --Modifie L1 en y ajoutant les occurence de L2, L2 sera supprimé
      --mais cela sera fait dans la fonction Fusion definie dans listegen
   C: T_Couple;
   begin
      C:=Valeur(L1);
      Set_NbOcc( Get_NbOcc(Valeur(L1))+Get_NbOcc(Valeur(L2)),C );
   end;

end Liste_Couple;
