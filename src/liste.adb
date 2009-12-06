with Es_Simples;use Es_Simples;
package body Liste is

   procedure Liberer is new Ada.Unchecked_Deallocation(Cellule,T_Liste);
   --crée une procedure de liberation d'espace pour les objets
   --désignés par une liste

   function CreerListe return T_Liste is
      --
   begin
      return null;
   end CreerListe;

   function EstVide(L: T_Liste) return Boolean is
      --
   begin
      return L=null;
   end EstVide;

   procedure Affiche(L: in T_Liste) is
   Ltemp: T_Liste;
   begin
      Ltemp := L;
      New_Line;Put("|");
      while Ltemp /= null loop
         Put(Ltemp.all.Val,1);Put("|");
         Ltemp := Ltemp.all.Suiv;
      end loop;
      New_Line;
   end Affiche;

   procedure AjoutDebut(L: in out T_Liste;X: in Integer) is
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
      --return Ltemp;
   end AjoutDebut;

   procedure AjoutFin(L: in out T_Liste;X: in Integer) is
      --
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

   function Premier(L: T_Liste) return Integer is
      --
   begin
      if EstVide(L) then
         raise Liste_Vide;
      else
         return L.all.Val;
      end if;
   end Premier;

   function Dernier(L: T_Liste) return Integer is
      --Version iterative
      Ltemp: T_Liste;
   begin
      Ltemp := L;
      if EstVide(l) then raise Liste_Vide;
      else
         while Ltemp.all.Suiv/=null loop
            Ltemp:=Ltemp.all.Suiv;
         end loop;
         return Ltemp.all.Val;
      end if;
   end Dernier;

   function NbOcc(L: T_Liste;X: Integer) return Integer is
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

   procedure InsererAvant(L: in out T_Liste;X: in Integer;Y: Integer)is
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

   procedure InsererApres(L: in out T_Liste;X: in Integer;Y: Integer)is
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

   procedure Supprimer(L: in out T_Liste;X: in Integer)is
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

   procedure SupprimerTout(L: in out T_Liste;X: in Integer)is
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

   function Index(L: T_Liste;X: Integer) return Integer is
      --
   begin
      if EstVide(L) then raise Liste_Vide;
      elsif Premier(L) = x then return 0;
      else return 1 + Index(l.all.Suiv,x);
      end if;
   end Index;

   function EltInd(L: T_Liste;X: Integer) return Integer is
      --x > 0
   begin
      if EstVide(l) then raise Liste_Vide;
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

   procedure CopieTriee(L: in out T_Liste)is
      --Version Iterative
      Ltemp: T_Liste;
      Lcourant: T_Liste;
      Val_Temp: Integer;
   begin
      if not(EstVide(L.all.Suiv)) then
         Ltemp := L.all.Suiv;
         Lcourant := L.all.Suiv;
         while Ltemp /= null loop--Parcour de la liste entiere
            --On place la cellule pointée par Lcourant
            while (LCourant.all.Prec /= null) and then (Lcourant.all.Val > LCourant.all.Prec.all.Val) loop
              --On echange lcourant avec son predecesseur si il n'est pas le dernier
               Val_Temp := LCourant.val;
               LCourant.all.Val := LCourant.all.Prec.all.Val;
               LCourant.all.Prec.all.Val := Val_Temp;
               LCourant := LCourant.all.Prec;
            end loop;
            Ltemp := Ltemp.Suiv;
         end loop;
      end if;
   end CopieTriee;

   procedure CopieTrieeR(L: in out T_Liste) is
      --Version Recursive
   begin
      null;
   end CopieTrieeR;

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
   end CopieInverse;

end;
