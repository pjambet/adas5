package body ListeGen is


   procedure Liberer is new Ada.Unchecked_Deallocation(Cellule,T_Liste);
   --crÃ©e une procedure de liberation d'espace pour les objets
   --dÃ©signÃ©s par une liste

   procedure Modifie(L: in out T_Liste;L2: in T_Elem) is
   begin
      L.val:=L2;
   end Modifie;

   function Valeur(L: T_Liste) return T_Elem is
   --Renvoie l'element contenu dans L
   --Declenche une ListeVideException si L est null
   begin
      if EstVide(L) then
         raise ListeVideException;
      else
         return L.all.Val;
      end if;
   end Valeur;

   function Precedent(L: T_Liste) return T_Liste is
   --Renvoie le precedent de L si il existe
   --Declenche une ListeVideException si L est null ou si son precedent est null
   begin
      return L.all.Prec;
   end Precedent;

   function Suivant(L: T_Liste) return T_Liste is
   --Renvoie le suivant de L si il existe
   --Declenche une ListeVideException si L est null ou si son suivant est null
   begin
      return L.all.Suiv;
   end Suivant;

   function CreerListe return T_Liste is
   begin
      return null;
   end CreerListe;

   function EstVide(L: T_Liste) return Boolean is
   begin
      return L=null;
   end EstVide;

   procedure Affiche(L: in T_Liste) is
   Ltemp: T_Liste;
   begin
      Ltemp := L;
      New_Line;Put("[");
      while Ltemp /= null loop
         Imprime(Ltemp.all.Val);Put("|");
         Ltemp := Ltemp.all.Suiv;
      end loop;
      Put("]");New_Line;
      null;
   end Affiche;

   procedure AjoutDebut(L: in out T_Liste;X: in T_Elem) is
      --
      Ltemp: T_Liste;
   begin
      if EstVide(L) then
         L:= new Cellule'(X,null,null);
      else-- !ListeVide(L) then
         Ltemp:= new Cellule'(X,null,L);
         L.all.Prec:=Ltemp;
         L:=Ltemp;
      end if;
   end AjoutDebut;

   procedure AjoutFin(L: in out T_Liste;X: in T_Elem) is
      ltemp: T_Liste;
   begin
      ltemp := L;
      if EstVide(L) then
         L :=  new Cellule'(x,null,null);
      else
         while ltemp.all.Suiv /= null loop
            ltemp := ltemp.all.Suiv;
         end loop;
         ltemp.all.Suiv := new Cellule'(x,ltemp,null);
      end if;
   end AjoutFin;

   function Premier(L: T_Liste) return T_Elem is
      --
   begin
      if EstVide(L) then
         raise ListeVideException;
      else
         return L.all.Val;
      end if;
   end Premier;

   function Dernier(L: T_Liste) return T_Elem is
      --Version iterative
      Ltemp: T_Liste;
   begin
      Ltemp := L;
      if EstVide(l) then raise ListeVideException;
      else
         while Ltemp.all.Suiv/=null loop
            Ltemp:=Ltemp.all.Suiv;
         end loop;
         return Ltemp.all.Val;
      end if;
   end Dernier;

   function NbOcc(L: T_Liste;X: T_Elem) return Integer is
      --Version recursive
   begin
      if EstVide(L) then
         return 0;
      elsif L.all.Val=X then
         return 1+NbOcc(L.all.Suiv,X);
      else
         return NbOcc(L.all.Suiv,X);
      end if;
   end NbOcc;

   procedure InsererAvant(L: in out T_Liste;X: in T_Elem;Y: T_Elem)is
      P: T_Liste;
      ltemp: T_Liste;
   begin
      P := L;
      while P /= null and then P.all.Val /= y loop
         P := P.all.suiv;
      end loop;--P = vide ou sinon P.val = y
      if EstVide(P) then
         AjoutDebut(L,X);
      elsif P = L then--x en tete de liste
         AjoutDebut(L,x);
      else
         ltemp := new Cellule'(x,l.all.Prec,P);
         P.all.Prec.all.Suiv := ltemp;
         P.all.Prec := ltemp;
      end if;

   end InsererAvant;

   procedure InsererApres(L: in out T_Liste;X: in T_Elem;Y: T_Elem)is
      --
      ltemp: T_Liste;
   begin
      ltemp := L;
      if EstVide(L) then L := new Cellule'(x,null,null);
      elsif EstVide(l.all.Suiv) then AjoutFin(L,x);
      elsif L.all.val = y then
         ltemp := new Cellule'(x,l,l.all.suiv);
         l.all.suiv.all.prec := ltemp;
         l.all.suiv := ltemp;
      else
         InsererApres(L.all.Suiv,x,y);
      end if;
   end InsererApres;

   procedure Supprimer(L: in out T_Liste;X: in T_Elem)is
      --
      Ltemp: T_Liste;
   begin
      Ltemp := L;
      if EstVide(L) then
         --On ne fait rien
         null;
      elsif Premier(L)=X then
         Ltemp := L.all.Suiv;
         Liberer(L);L := Ltemp;
      else
         while Ltemp.all.Suiv /= null and then Premier(Ltemp) /= X loop
            Ltemp := Ltemp.all.Suiv;
         end loop;--ltemp.suiv = null ou Premier(l)=x
         if Ltemp.all.Suiv /= null then
            Ltemp.all.Suiv.all.Prec := Ltemp.all.Prec;
            Ltemp.all.Prec.all.Suiv := Ltemp.all.Suiv;
            Liberer(Ltemp);
         elsif Ltemp.all.Suiv = null and then Premier(Ltemp)=X then
            Ltemp.all.Prec.all.Suiv := null;
            Liberer(Ltemp);
         end if;

      end if;
   end Supprimer;

   procedure SupprimerTout(L: in out T_Liste;X: in T_Elem)is
      --A REFAIRE
      --A AMELIORER AVEC LE TRUC DE QUENTIN
      Ltemp: T_Liste;
   begin
      Ltemp := L;
      while Ltemp /= null loop
         if Premier(L)=X then Supprimer(L,X);
         end if;
         Ltemp := Ltemp.all.Suiv;
      end loop;
   end SupprimerTout;

   function Index(L: T_Liste;X: T_Elem) return Integer is
      --
   begin
      if EstVide(L) then raise ListeVideException;
      elsif Premier(L) = x then return 0;
      else return 1 + Index(l.all.Suiv,x);
      end if;
   end Index;

   function EltInd(L: T_Liste;X: Integer) return T_Elem is
      --x > 0
   begin
      if EstVide(l) then raise ListeVideException;
      elsif x = 0 then return Premier(l);
      else return EltInd(l.all.Suiv,x-1);
      end if;
   end EltInd;

   procedure RetireInd(L: in out T_Liste;X: in Integer)is
      --
   begin
      Supprimer(L,EltInd(L,X));
   end RetireInd;

   function EtendListe(L1: T_Liste;L2:  T_Liste)return T_Liste Is
      --
      P1: T_Liste;
      P2: T_Liste;
   begin
      P1 := L1;P2 := L2;
      if EstVide(P1) then return P2;
      elsif EstVide(P2) then return P1;
      else
         while P1.Suiv /= null loop
            P1 := P1.all.Suiv;
         end loop;--P1 est le dernier element de L1
         while P2 /= null loop
            AjoutFin(P1,Premier(P2));--appel en temps constant O(1) car P1 est le dernier element de L1
            P1 := P1.all.Suiv;--On maintient P1 comme dernier element
         end loop;
         return L1;
      end if;
   end EtendListe;

   procedure InsererTriee(L: in out T_Liste;X : in T_Elem) is
      ltemp: T_Liste;
      Linser : T_Liste;
   begin
      ltemp := l;
      if Estvide(L) then
         l := new Cellule'(x,null,null);
      elsif estvide(l.all.Suiv) then
         --si la liste a un seul element

         if L.all.Val < x then
            --soit on ajoute x a la fin
            AjoutFin(l,x);
         elsif L.all.Val > X then
            --soit on ajoute y au debut
            AjoutDebut(l,x);
         else -- L.all.val = X
            --Put("Egalité");
            Traitement_Doublon(L);
         end if;
      elsif Ltemp.All.Val > X then
         --On insere au debut
         AjoutDebut(l,x);
      else --ltemp /= null ET ltemp.suiv /= null
           -- invariant : pour p de l à ltemp non compris p.val <X
           --si la liste a plus d'un element
         while ltemp.all.suiv /= null and then ltemp.all.Val < x loop
            ltemp := ltemp.Suiv;
         end loop;--Soit ltemp.suiv = null, soit ltemp.val >= x (ou les 2)

         if ltemp.all.suiv = null then
            --Si on est sur le dernier element
            if Ltemp.all.Val < X then
               Ajoutfin(Ltemp,X);
            elsif Ltemp.all.Val > X then
               -- Linser := new Cellule'(X,Ltemp,Ltemp.Prec); inversion des champs prec et suiv ??
               -- ???????????????????????????
               Linser := new Cellule'(X,Ltemp.Prec,Ltemp);

               Ltemp.Prec.Suiv := Linser;
               Ltemp.Prec := Linser;
            else --ltemp.all.val=x
               --Put("Egalité");
               Traitement_Doublon(Ltemp);
            end if;
         else
            --On est au milieu de la liste et ltemp.val >= x
            if Ltemp.all.Val > X then
               -- InsererAvant(ltemp,x,ltemp.all.Val);
               --  non vous insérez avant ltemp, mais l'insertion avant le premier élément d'un liste
               --  revient à un ajout-deb => vous perdez le lien avec le prédécesseur de ltemp
               Linser := new Cellule'(X,Ltemp.Prec,Ltemp);
               Ltemp.Prec.Suiv := Linser;
               Ltemp.Prec := Linser;
            else --ltemp.all.val = x
               --Put("Egalité");
               Traitement_Doublon(Ltemp);
            end if;
         end if;
      end if;
   end inserertriee;

   function CopieTriee(L : T_Liste) return T_Liste is
      lresult : T_Liste;
      ltemp : T_Liste;
   begin
      ltemp := L;
      lresult := CreerListe;
      New_LIne;
      while ltemp /= null loop
         Imprime(Ltemp.Val); New_Line;
         InsererTriee(lresult,ltemp.val);
         Ltemp := Ltemp.Suiv;
      end loop;
      return lresult;
   end CopieTriee;

   function CopieInverse(L: T_Liste)return T_Liste is
      --
      ltemp: T_Liste;
      Linvers: T_Liste;
   begin
      Linvers := CreerListe;
      Ltemp := L;
      while ltemp /= null loop
         AjoutDebut(linvers,Premier(ltemp));
      end loop;
      return linvers;
   end Copieinverse;

   procedure Fusion(L: in out T_Liste; L1,L2: in out T_Liste) is
      --precondition : L1,L2 /= null
      --L'element pointé par L2 est fusionné dans L2
      --Fusionne L2 dans L1 en supprimant L2 et en appliquant a L1 la procedure modif_Fusion
   begin
      Modif_Fusion(L1,L2);
      Supprimer(L,L1.Val);
   end;

end ListeGen;
