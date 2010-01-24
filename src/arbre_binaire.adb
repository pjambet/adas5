with Ada.Text_IO, Ada.Unchecked_Deallocation;
use Ada.Text_IO;
with Ada.Text_Io; use Ada.Text_Io;
package body Arbre_Binaire is

   procedure Liberer is new Ada.Unchecked_Deallocation(Noeud,T_ABR);
      --cree une procedure de liberation d'espace pour les objets
      --designes par un arbre

   function Filsgauche(A: T_ABR) return Boolean is
      --teste si A est un filsgauche
   begin
      if not Est_racine(A) then
         return A.Pere.Sag = A;
      else return False;
      end if;
   end Filsgauche;

   function Filsdroit(A: T_ABR) return Boolean is
      --teste si A est un filsdroit
   begin
      if not Est_Racine(A) then
         return A.Pere.Sad = A;
      else return False;
      end if;
   end Filsdroit;

   procedure Modifie(A: in out T_ABR;E: in T_Elem) is
      --Modifie A en y remplacant son element par E
   begin
      if Arbre_Vide(A) then raise ArbreVideException;
      else A.Racine := E;
      end if;
   end Modifie;

   function Lire_Racine(A: T_ABR) return T_Elem is
      --Renvoie l'element contenu dans A
      --Declenche un ArbreVideException si A est null
   begin
      if Arbre_Vide(A) then raise ArbreVideException;
      else return A.Racine;
      end if;
   end Lire_Racine;

   function SAG(A: T_ABR) return T_ABR is
      --Renvoie le sous arbre gauche de A si il existe
      --Declenche une ArbreVideException si A est null ou si son sag est null
   begin
      if Arbre_Vide(A) then raise ArbreVideException;
      else return A.SAG;
      end if;
   end SAG;

   function SAD(A: T_ABR) return T_ABR is
      --Renvoie le sous arbre droit de A si il existe
      --Declenche une ArbreVideException si A est null ou si son sad est null
   begin
      if Arbre_Vide(A) then raise ArbreVideException;
      else return A.SAD;
      end if;
   end SAD;

   function Pere(A: T_ABR) return T_ABR is
      --Renvoie le pere de A si il existe
      --Renvoie une ArbreVideException si A est null ou si son pere est null
   begin
      if Arbre_Vide(A) then raise ArbreVideException;
      else return A.Pere;
      end if;
   end Pere;

   function GPere(A: T_ABR) return T_ABR is
      --Renvoie le grand pere de A si il existe
      --Renvoie une AbreVideException si A est null ou si son pere est null
   begin
      if Arbre_Vide(A) then raise ArbreVideException;
      elsif Arbre_Vide(A.Pere) then return null; --raise ArbreVideException;
      else return A.Pere.Pere;
      end if;
   end GPere;

   function Oncle(A: T_ABR) return T_ABR is
      --Renvoie l'oncle de A (frere du pere)
      --Renvoie une ArbreVideException si A est null ou si il y a des pointeurs null dans le tas
   begin
      if Arbre_Vide(A) then raise ArbreVideException;
      elsif Est_Racine(A) then return null; -- raise ArbreVideException;
      elsif Est_Racine(Pere(A)) then return null;--pas sur de l'exception ... :  --raise ArbreVideException;
      else--normalement le pere de A a un frere a ce niveau là
         return Frere(Pere(A));
      end if;
   end Oncle;

   function Frere(A: T_ABR) return T_ABR is
      --Renvoie le frere de A, c-a-d l'autre fils du pere de A
      --Renvoie une ArbreVideException si on tombe sur un pointeur null
   begin
      if Arbre_Vide(A) then raise ArbreVideException;
      elsif Est_Racine(A) then return null;--pas sur de l'exception ...  raise ArbreVideException;
      else--A n'est pas nulle et n'est pas une racine
         if FilsGauche(A) then return SAD(A);
         else return SAG(A);
         end if;
      end if;
   end Frere;

   function CreerArbre return T_ABR is
   --Crée un arbre vide
   begin
      return null;
   end CreerArbre;

   function Arbre_Vide(A: T_ABR) return Boolean is
      --Teste la vacuité de l'arbre A
   begin
      return A = null;
   end Arbre_Vide;

   function Est_Racine(A: T_Abr) return Boolean is
      --Teste si A est racine de l'arbre
   begin
      return Arbre_Vide(Pere(A));
   end;

   procedure Prefixe(A: in T_ABR) is
      --Parcours l'arbre A de maniere prefixe et applique la procedure traitement
      --Cette procedure est generique et sera définie a l'instanciation
      AG,AD: T_ABR;
   begin
      if Arbre_Vide(A) then raise ArbreVideException;
      else
         Traitement(A);
         if not Arbre_Vide(SAG(A)) then
            AG := SAG(A);
            Prefixe(AG);
         end if;
         if not Arbre_Vide(SAD(A)) then
            AD := SAD(A);
            Prefixe(AD);
         end if;
      end if;
   end Prefixe;

   procedure Postfixe(A: in T_ABR) is
      --Parcours l'arbre A de maniere Postfixe et applique la procedure traitement
      --Cette procedure est generique et sera définie a l'instanciation
      AG,AD: T_ABR;
   begin
      if Arbre_Vide(A) then raise ArbreVideException;
      else
         if not Arbre_Vide(SAG(A)) then
            AG := SAG(A);
            Postfixe(AG);
         end if;
         if not Arbre_Vide(SAD(A)) then
            AD := SAD(A);
            Postfixe(AD);
         end if;
         Traitement(A);
      end if;
   end Postfixe;

   procedure Infixe(A: in T_ABR) is
      --Parcours l'arbre A de maniere infixe et applique la procedure traitement
      --Cette procedure est generique et sera définie a l'instanciation
      AG,AD: T_ABR;
   begin
      if Arbre_Vide(A) then raise ArbreVideException;
      else
         if not Arbre_Vide(SAG(A)) then
            AG := SAG(A);
            Infixe(AG);
         end if;
         Traitement(A);
         if not Arbre_Vide(SAD(A)) then
            AD := SAD(A);
            Infixe(AD);
         end if;
      end if;
   end Infixe;

   function Recherche_ABR_ToF(A: T_ABR;V: T_Elem) return Boolean is
      --Renvoie vrai si V appartient a A
   begin
      if Arbre_Vide(A) then return False;
      elsif V=Lire_Racine(A) then return True;
      elsif V > Lire_Racine(A) then return Recherche_ABR_ToF(SAD(A),V);
      else return Recherche_ABR_ToF(SAG(A),V);
      end if;
   end Recherche_ABR_ToF;

   function Recherche_ABR(A: T_ABR;V: T_Elem) return T_ABR is
      --Renvoie l'arbre ayant v pour racine
      --Leve une ArbreVideException si il n'y a aucun element dans A
   begin
      if Arbre_Vide(A) then return null;
      elsif V=Lire_Racine(A) then return A;
      elsif V > Lire_Racine(A) then return Recherche_ABR(SAD(A),V);
      else return Recherche_ABR(SAG(A),V);
      end if;
   end Recherche_ABR;

   function Est_Feuille(A: T_ABR) return Boolean is
      --renvoie vraie si A est une feuille, faux sinon
   begin
      return Arbre_Vide(SAG(A)) and then Arbre_Vide(SAD(A));
   end Est_Feuille;


   function Max(A,B: Integer) return Integer is
      --Calcule le maximum entre A et B
   begin
      if A>B then return A;
      else return B;
      end if;
   end Max;

   function Hauteur(A: T_ABR) return Integer is
      --Renvoie la hauteur de A
      --c-a-d le max entre la hauteur de son SAG et de son SAD
      --Si tout va bien la hauteur entre le SAG et le SAD ne devrait pas différer
      --de plus de 1 si l'arbre est bien équilibré
      --La hauteur d'un arbre avec un seul noeud est 0
      --La hauteur d'un arbre null n'est pas définie
   begin
      if not Arbre_Vide(A) then
         if Est_Feuille(A) then return 0;
         elsif Arbre_Vide(SAG(A)) then return 1 + Hauteur(SAD(A));
         elsif Arbre_Vide(SAD(A)) then return 1 + Hauteur(SAG(A));
         else return 1 + Max(Hauteur(SAG(A)),Hauteur(SAD(A)));
         end if;
      else
         Put_Line("Parametre vide");
         return -1;--normalement ca devrait arrivé uniquement lorsque l'arbre est vide a l'origine
      end if;

   end Hauteur;

   function Est_equilibre(A: T_Abr) return Boolean is
   --Renvoie vrai si l'arbre A est équilibré
   --C-a-d si la hauteur entre le SAG et le SAD ne varie pas plus que un
   Diff_Haut: Integer;
   begin
      if Arbre_Vide(A) then raise ArbreVideException;
      else
         Diff_Haut := Hauteur(Sag(A))-Hauteur(Sad(A));
         return ( Diff_Haut = 1 or else Diff_Haut = -1 or else Diff_Haut = 0);
      end if;
   end Est_Equilibre;

   function RechercheR(A: T_ABR) return T_ABR is
      --fonction aussi appelé recherchepluspetit ou un autre nom comme ca
      --la fonction va soit chercher le plus grand a gauche soit le plus petit a droite
      --Ici le choix est de chercher le plus grand element du sag de A
      temp : T_ABR;
   begin
      Temp := Sag(A);
      while not Arbre_Vide(Sad(Temp)) loop
         Temp := Sad(Temp);
      end loop;
      return Temp;
   end RechercheR;

   function Rotation_Droite_Simple(X: T_ABR) return T_ABR is
      --Effectue une rotation simple avec X comme racine et Y comme pivot(enfin je crois)
      Y: T_ABR;
   begin
      Y := X.SAG;
      X.Sag := Y.Sad;
      if not Arbre_Vide(Y.Sad) then
         Y.Sad.Pere := X;
      end if;
      Y.Pere := X.Pere;
      if not Arbre_Vide(X.Pere) then
         if FilsGauche(X) then
            X.Pere.Sag := Y;
         else
            X.Pere.Sad := Y;
         end if;
      end if;
      Y.Sad := X;
      X.Pere := Y;
      return Y;
   end Rotation_Droite_Simple;

   function Rotation_Gauche_Simple(X: T_ABR) return T_ABR is
      --Effectue une rotation simple avec X comme racine et Y comme pivot(enfin je crois)
      Y: T_ABR;
   begin
      Y := X.SAD;--pas sur ... (symetrie ...)
      --Modification par symetrié effectué, a verifier quand meme
      X.Sad := Y.Sag;
      if not Arbre_Vide(Y.Sag) then
         Y.Sad.Pere := X;
      end if;
      Y.Pere := X.Pere;
      if not Arbre_Vide(X.Pere) then
         if FIlsGauche(X) then
            X.Pere.Sag := Y;
         else
            X.Pere.Sad := Y;
         end if;
      end if;
      Y.Sag := X;
      X.Pere := Y;
      return Y;
   end Rotation_Gauche_Simple;

   function Rotation_Droite(X,Y: T_ABR) return T_ABR is
      --Effectue une rotation avec x comme racine et Y comme pivot
      --prerequis : y appartient au sag de x
      z: T_ABR;
   begin
      if X.Sag = Y then return Rotation_Droite_Simple(X);
      else
         Z := Y.Pere;
         if FilsGauche(Y) then
            Z := Rotation_Droite_Simple(Z);
            return Rotation_Droite(X,Z);
         else--y est fils droit
            return Rotation_Droite(X,Rotation_Gauche_Simple(Z));
         end if;
      end if;
   end Rotation_Droite;

   function Rotation_Gauche(X,Y: T_ABR) return T_ABR is
      --Effectue une rotation avec x comme racine et Y comme pivot
      --prerequis : y appartient au sad de x
      z: T_ABR;
   begin
      --Modification effectuée, tous les gauches changés en droit et inversement, comme pour au dessus
      --a tester, j'suis pas certain que tout soit juste
      if X.Sad = Y then return Rotation_Gauche_Simple(X);
      else
         Z := Y.Pere;
         if FilsGauche(Y) then
            Z := Rotation_droite_SImple(Z);
            return Rotation_gauche(X,Z);
         else--y est fils droit
            return Rotation_Gauche(X,Rotation_gauche_Simple(Z));
         end if;
      end if;
   end Rotation_Gauche;

   function Cas_Equilib_Insertion_Arn(A: T_Abr) return Integer is
      --Renvoie un entier qui nous permettra dans quel cas on se trouve apres l'insertion d'un element
      --dans l'ARN
   begin
      if Est_Racine(A) then return 10;
      elsif Est_Racine(A.Pere) then return 10;
      elsif A.Pere.Couleur = True then return 0;
      else -- pere de n rouge
         if Oncle(A).Couleur = False then return 20;
         else -- couleur(oncle(n))=noir
            if Filsgauche(A.Pere) then
               if Filsgauche(A) then return 31;
               else return 32;
               end if;
            else --n.pere est fils droit
               if Filsdroit(A) then return 41;
               else return 42;
               end if;
            end if;
         end if;
      end if;
   end Cas_Equilib_Insertion_Arn;

   procedure Equilibrage_ARN(X: in out T_ABR) is
      --Equilibre l'arbre
      --fonction a terminer
      --Code Couleur :
      --true equivaut a noir et false a rouge
      N: Integer;P,GP,F: T_ABR;
   begin
      N := Cas_Equilib_Insertion_Arn(X);Put_Line(Integer'Image(N));
      P := Pere(X);Gp := Gpere(X);
      if not Arbre_Vide(P) then   
         F := Frere(P);
      else
         F := null;
      end if;
      
      if N=0 then
         null;
         --rien a faire ici normalement
      elsif N=10 then
         if Est_Racine(X) then X.Couleur := True;
         else Pere(X).Couleur := True;
         end if;
      elsif N=20 then
         P.Couleur := True;
         F.Couleur := True;
         GP.Couleur := False;
         Equilibrage_ARN(GP);
      elsif N=31 then--x fils gauche, p fils gauche
         P := Rotation_Droite(GP,P);
         P.Couleur := True;
         GP.Couleur := False;
      elsif N=32 then--p fils gauche, x fils droit
         X := Rotation_Gauche(P,X);
         X := Rotation_Droite(GP,X);
         X.Couleur := True;
         GP.Couleur := False;
      elsif N=41 then--p fils droit, x fils gauche
         X := Rotation_Droite(P,X);
         X := Rotation_Gauche(GP,X);
         X.Couleur := True;
         GP.Couleur := False;
      elsif N=42 then--p fils droit, x fils droit
         P := Rotation_Gauche(GP,P);
         P.Couleur := True;
         Gp.Couleur := False;
      end if;
   end Equilibrage_ARN;

   procedure Inserer_ABR(A:in out T_ABR;V: in T_Elem) is
   --Insere l'element V dans l'arbre en respectant les contraintes des ABR
   begin
      if Arbre_vide(A) then
         Put_Line("Création de la racine");
         A := new Noeud'(V,null,null,null,False);--le noeud inséré est colorié en rouge
      elsif Lire_Racine(A) = V then
         --dans ce cas rien a faire, le mot est deja la
         --eventuellement un traitement des doublons
         Traitement_Doublon(A);
         --return A; c'est une procedure pas de return
      elsif V < Lire_racine(A) then
         if Sag(A) = null then A.Sag := new Noeud'(V,null,null,A,False);
         else
            Inserer_Abr(A.Sag,V);
            A.Sag.Pere := A;
         end if;
         --return A;--c'est une procedure, pas de return
      elsif V > Lire_racine(A) then
         if A.Sad = null then A.Sad := new Noeud'(V,null,null,A,False);
         else
            Inserer_Abr(A.Sad,V);
            A.Sad.Pere := A;
         end if;
         --return A;--c'est une procedure, pas de return
      end if;
   end Inserer_Abr;

   procedure Inserer_ARN(A:in out T_ABR;V: in T_Elem) is
   --Insere l'element V dans l'arbre en respectant l'équilibrage(gesion des couleurs rouges et noires)
   --et en respectant les contraintes des ARN
   begin
      --PAS FINI !!!
      --faut rajouter les modifications specifiques aux ARN
      if Arbre_vide(A) then
         Put_Line("Creation de la racine");
         A := new Noeud'(V,null,null,null,False);--le noeud inséré est colorié en rouge
      elsif Lire_racine(A) = V then
         --dans ce cas rien a faire, le mot est deja la
         --eventuellement un traitement des doublons
         Traitement_Doublon(A);
         --return A;c'est une procedure pas de return
      elsif V < Lire_racine(A) then
         if Sag(A) = null then
            A.Sag := new Noeud'(V,null,null,A,False);
            Equilibrage_ARN(A);
         else
            Inserer_ARN(A.Sag,V);
            A.Sag.Pere := A;
            Equilibrage_ARN(A);
         end if;
         --return A;c'est une procedure pas de return
      elsif V > Lire_racine(A) then
         if A.Sad = null then
            A.Sad := new Noeud'(V,null,null,A,False);
            Equilibrage_ARN(A);
         else
            Inserer_ARN(A.Sad,V);
            A.Sad.Pere := A;
            Equilibrage_ARN(A);
         end if;
         --return A;c'est une procedure pas de return
      end if;
   end Inserer_ARN;

   procedure Supprimer_ABR(A: in out T_ABR;V: in T_Elem) is
   --Supprime l'element V de A
      T: T_Abr;
      R : T_ABR;
   begin
      --manque des return, a voir en TP/TD...
      --On va tester de le mettre sous forme de procédure
      T := Recherche_ABR(A,V);
      if Arbre_Vide(A) then null;--rien a faire
      elsif Est_Feuille(T) then
         if Est_Racine(T) then
            A := null;
         elsif FilsGauche(T) then
            T.Pere.Sag := null;
         else
            T.Pere.Sad := null;--T est fils droit
         end if;
         Equilibrage_ARN(A);
      elsif T.Sag = null then
         if Est_Racine(T) then
            T.Sad.Pere := null;
            --return T.Sad; maintenant que c'est une proc, obsolete
         elsif FilsGauche(T) then
            T.Pere.Sag := T.Sad;
            T.Sad.Pere := T.Pere;
         else--T est fils droit
            T.Pere.Sad := T.Sad;
            T.Sad.Pere := T.Pere;
         end if;
         Equilibrage_ARN(A);--a verifier
         liberer(T);--pas sur, mais ce devrait etre juste
      elsif T.sad = null then
            --symetrique
         if Est_Racine(T) then
            T.Sag.pere := null;
            --return T.Sag; maintenant que c'est une proc, obsolete
         elsif FilsGauche(T) then
            T.Pere.Sag := T.Sag;
            T.Sag.Pere := T.Pere;
         elsif FilsDroit(T) then
            T.Pere.Sad := T.Sag;
            T.Sag.Pere := T.Pere;
         end if;
         Equilibrage_ARN(A);--a verifier
         liberer(T);
      else
         R := RechercheR(T);
         T.Racine := R.Racine;
         --R.sad = null
         Supprimer_ABR(R,R.Racine);
         Equilibrage_ARN(A);--a verifier
      end if;
   end Supprimer_Abr;

   procedure Vider_Arbre(A: in out T_Abr) is
   --Supprime tous les elements de A
   --ArbreVide(Vider_Arbre(A)) = true
   tmp,AG,AD: T_ABR;
   begin
      if Arbre_Vide(A) then null;
      else-- Arbre_vide(A) then
         if not Arbre_vide(Sag(A)) then
            if Est_Feuille(Sag(A)) then
               tmp := SAG(A);
               Liberer(tmp);
            else
               AG := SAG(A);
               Vider_arbre(AG);--on vide a gauche
            end if;
         elsif not Arbre_vide(Sad(A)) then
            if Est_Feuille(Sad(A)) then
               tmp := SAD(A);
               Liberer(tmp);
            else
               AD := SAD(A);
               Vider_Arbre(AD);--et on vide a droite
            end if;
         end if;
      end if;
   end Vider_Arbre;

end Arbre_Binaire;
