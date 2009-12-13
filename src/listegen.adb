package body ListeGen is

   procedure Liberer is new Ada.Unchecked_Deallocation(Cellule,T_Liste);
   --crée une procedure de liberation d'espace pour les objets
   --désignés par une liste

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

   procedure Tri_Gen(L: in out T_Liste) is
   --Tri alphab�tiquement la liste
   begin

   end;

   procedure Fusion(L: in out T_Liste; m1,m2: T_Mot) is
      I : Integer;
      Egal : Boolean;
   begin
      I := 0;
      Egal := False;
      while I < String'Min(m1,m2) and Egal loop
         if m1(I) /= m2(I) then
            Egal := False;
         end if;
         I := I+1;
      end loop;
      if Egal then
         Supprimer(l, m2);
      end if;
   end;


end ListeGen;
