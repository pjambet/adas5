package body Liste_couple is

   function Inferieur_Couple_Lex(Couple1: T_Couple;Couple2: T_Couple) return Boolean is
      --redefinition de la fonction "<" pour le type couple
      --ici on tri les couples par ordre lexicographique
   begin
      return Inferieur_Mot(Get_Mot(Couple1),Get_Mot(COuple2));
   end;

   function Superieur_Couple_Lex(Couple1: T_Couple;Couple2: T_Couple) return Boolean is
      --redefinition de la fonction ">" pour le type couple
      --ici on trie les couples par ordre lexicographique
   begin
      return Superieur_Mot(Get_Mot(Couple1),Get_Mot(Couple2));
   end;

   function Egale_Couple_Lex(Couple1: T_Couple;Couple2: T_Couple) return Boolean is
      --redefinition de la fonction ">" pour le type couple
      --ici on trie les couples par ordre lexicographique
   begin
      return Egale_Mot(Get_Mot(Couple1), Get_Mot(Couple2));
   end;

   function Inferieur_Couple_Occ(Couple1: T_Couple;Couple2: T_Couple) return Boolean is
   --redefinition de la fonction "<" pour le type couple
   --ici on tri les couples par nombre d'occurence décroissante
   begin
      return Get_NbOcc(Couple1) > Get_NbOcc(Couple2);
   end Inferieur_Couple_Occ;

   function Superieur_Couple_Occ(Couple1: T_Couple;Couple2: T_Couple) return Boolean is
   --redefinition de la fonction ">" pour le type couple
   --ici on trie les couples par nombre d'occurence décroissante
   begin
      return Get_NbOcc(Couple1) < Get_NbOcc(Couple2);
   end Superieur_Couple_Occ;

   function Egale_Couple_Occ(Couple1: T_Couple;Couple2: T_Couple) return Boolean is
   --redefinition de la fonction "=" pour le type couple
   --ici on trie les couples par nombre d'occurence décroissante
   begin
      return Get_NbOcc(Couple1) = Get_NbOcc(Couple2);
   end Egale_Couple_Occ;

   procedure Modif_FusionCouple(L1,L2: in out TListe_Couple) is
      --Modifie L1 en y ajoutant les occurence de L2, L2 sera supprimé
      --mais cela sera fait dans la fonction Fusion definie dans listegen
      C: T_Couple;
   begin
      C:=Valeur(L1);
      Set_NbOcc(C, Get_NbOcc(Valeur(L1))+Get_NbOcc(Valeur(L2)));
      Modifie(L1,C);
   end;

   procedure Traitement_Doublon_Couple(L: in out TListe_Couple) is
      C: T_Couple;
   begin
      C:=Valeur(L);
      Set_NbOcc(C,Get_NbOcc(Valeur(L))+1);
      Modifie(L,C);
   end Traitement_Doublon_Couple;


end Liste_Couple;
