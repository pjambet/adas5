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
      return Get_NbOcc(Triplet1) > Get_NbOcc(Triplet2);
   end Inferieur_Triplet_Occ;

   function Superieur_Triplet_Occ1(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
     --redefinition de la fonction ">" pour le type Triplet
     --ici on trie les Triplets par nombre d'occurence décroissante
   begin
      return Get_NbOcc(Triplet1) <= Get_NbOcc(Triplet2);
   end Superieur_Triplet_Occ;

   function Egale_Triplet_Occ1(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean is
     --redefinition de la fonction "=" pour le type Triplet
     --ici on trie les Triplets par nombre d'occurence décroissante
   begin
      return Get_NbOcc(Triplet1) = Get_NbOcc(Triplet2);
   end Egale_Triplet_Occ;

   function Inferieur_Triplet_Occ2(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par nombre d'occurence(du texte2) décroissante

   function Superieur_Triplet_Occ2(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte2) décroissante

   function Egale_Triplet_Occ2(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(du texte2) décroissante

   function Inferieur_Triplet_OccS(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction "<" pour le type Triplet
   --ici on tri les Triplets par nombre d'occurence(somme des occ) décroissante

   function Superieur_Triplet_OccS(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction ">" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(somme des occ) décroissante

   function Egale_Triplet_OccS(Triplet1: T_Triplet;Triplet2: T_Triplet) return Boolean;
   --redefinition de la fonction "=" pour le type Triplet
   --ici on trie les Triplets par nombre d'occurence(somme des occ) décroissante

   procedure Modif_FusionTriplet(L: in out TListe_Triplet;T1,T2: in out T_Triplet) is
     --Modifie L1 en y ajoutant les occurence de L2, L2 sera supprimé
     --mais cela sera fait dans la fonction Fusion definie dans listegen
     C: T_Triplet;
     Ltemp: T_Liste;
     L1,L2: T_Liste;
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
      
      C := Valeur(L1);
      Set_NbOcc(C, Get_NbOcc(C)+Get_NbOcc(Valeur(L2)) );
      Modifie(L1,C);
      Supprimer(L,Valeur(L2));
      New_Line;Put("Le mot ");Put(Get_Chaine(Get_Mot(T2)));Put(" a été supprimé");New_Line;

   end;

   procedure Traitement_Doublon_Triplet(L: in out TListe_Triplet) is
     C: T_Triplet;
   begin
      C:=Valeur(L);
      Set_NbOcc(C,Get_NbOcc(Valeur(L))+1);
      Modifie(L,C);
   end Traitement_Doublon_Triplet;

end Liste_Triplet;
