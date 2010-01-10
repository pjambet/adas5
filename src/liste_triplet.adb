package body Liste_Triplet is

   function Inferieur_Triplet_Lex(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
     --redefinition de la fonction "<" pour le type Triplet
     --ici on tri les Triplets par ordre lexicographique
   begin
      return Inferieur_Mot(Get_Mot(Triplet1),Get_Mot(Triplet2));
   end;

   function Superieur_Triplet_Lex(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
     --redefinition de la fonction ">" pour le type Triplet
     --ici on trie les Triplets par ordre lexicographique
   begin
      return Superieur_Mot(Get_Mot(Triplet1),Get_Mot(Triplet2));
   end;

   function Egale_Triplet_Lex(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
     --redefinition de la fonction ">" pour le type Triplet
     --ici on trie les Triplets par ordre lexicographique
   begin
      return Egale_Mot(Get_Mot(Triplet1), Get_Mot(Triplet2));
   end;

   function Inferieur_Triplet_Occ1(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
     --redefinition de la fonction "<" pour le type Triplet
     --ici on tri les Triplets par nombre d'occurence décroissante
   begin
      return Get_NbOcc1(Triplet1) > Get_NbOcc1(Triplet2);
   end Inferieur_Triplet_Occ;

   function Superieur_Triplet_Occ1(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
     --redefinition de la fonction ">" pour le type Triplet
     --ici on trie les Triplets par nombre d'occurence décroissante
   begin
      return Get_NbOcc1(Triplet1) <= Get_NbOcc1(Triplet2);
   end Superieur_Triplet_Occ;

   function Egale_Triplet_Occ1(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
     --redefinition de la fonction "=" pour le type Triplet
     --ici on trie les Triplets par nombre d'occurence décroissante
   begin
      return Get_NbOcc1(Triplet1) = Get_NbOcc1(Triplet2);
   end Egale_Triplet_Occ;

   function Inferieur_Triplet_Occ2(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par nombre d'occurence(du texte2) décroissante
   begin
      return Get_NbOcc2(Triplet1) > Get_NbOcc2(Triplet2);
   end Inferieur_Triplet_Occ2;

   function Superieur_Triplet_Occ2(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte2) décroissante
   begin
      return Get_NbOcc2(Triplet1) <= Get_NbOcc2(Triplet2);
   end Superieur_Triplet_Occ2;

   function Egale_Triplet_Occ2(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte2) décroissante
   begin
      Get_NbOcc2(Triplet1) = Get_NbOcc2(Triplet2);
   end Egale_Triplet_Occ2;

   function Inferieur_Triplet_OccS(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par nombre d'occurence(somme des occ) décroissante
   begin
      Get_NbOcc2(Triplet1)+Get_NbOcc1(Triplet1) > Get_NbOcc1(Triplet2)+Get_NbOcc2(Triplet2);
   end Inferieur_Triplet_OccS;

   function Superieur_Triplet_OccS(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(somme des occ) décroissante
   begin
      Get_NbOcc2(Triplet1)+Get_NbOcc1(Triplet1) <= Get_NbOcc1(Triplet2)+Get_NbOcc2(Triplet2);
   end Superieur_Triplet_OccS;

   function Egale_Triplet_OccS(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(somme des occ) décroissante
   begin
      Get_NbOcc2(Triplet1)+Get_NbOcc1(Triplet1) = Get_NbOcc1(Triplet2)+Get_NbOcc2(Triplet2);
   end Egale_Triplet_OccS;

   procedure Modif_FusionTriplet(L: in out TListe_Triplet;T1,T2: in out T_Triplet) is
     --Modifie L1 en y ajoutant les occurence de L2, L2 sera supprimé
     --mais cela sera fait dans la fonction Fusion definie dans listegen
     T: T_Triplet;
     Ltemp: TListe_Triplet;
     L1,L2: TListe_Triplet;
   begin

      --Placement de L1
      Put("Fusion");New_Line;
      L1 := L;
      while not EstVide(L1) and then not Compare_Mots(Get_Mot(Valeur(L1)),Get_Mot(T1)) loop
         L1 := Suivant(L1);
      end loop;

      --Placement De L2
      L2 := L;
      while not EstVide(L2) and then not Compare_Mots(Get_Mot(Valeur(L2)),Get_Mot(T2)) loop
         L2 := Suivant(L2);
      end loop;

      T := Valeur(L1);
      Set_NbOcc1(T, Get_NbOcc1(T)+Get_NbOcc1(Valeur(L2)) );
      Set_NbOcc2(T, Get_NbOcc2(T)+Get_NbOcc2(Valeur(L2)) );
      Modifie(L1,T);
      Supprimer(L,Valeur(L2));
      New_Line;Put("Le mot ");Put(Get_Chaine(Get_Mot(T2)));Put(" a été supprimé");New_Line;

   end;

   procedure Traitement_Doublon_Triplet(L: in out TListe_Triplet;Txt: Integer) is
     T: T_Triplet;
   begin
      T:=Valeur(L);
      if Txt = 1 then
         Set_NbOcc1(T,Get_NbOcc1(Valeur(L))+1);
      elsif Ttx = 2 then
         Set_NbOcc2(T,Get_NbOcc2(Valeur(L))+1);
      else

      end if;
      Modifie(L,T);
   end Traitement_Doublon_Triplet;

end Liste_Triplet;
