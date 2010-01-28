with Ada.Text_Io, Ada.Unchecked_Deallocation;
use Ada.Text_Io;
with Ada.Text_Io;
use Ada.Text_Io;
package body Arbre_Binaire is

   procedure Liberer is
      new Ada.Unchecked_Deallocation(Noeud,T_Abr);
   --cree une procedure de liberation d'espace pour les objets
   --designes par un arbre

   function Nombre_Elt(A: T_Abr) return Integer is
   --Renvoie le nombre d'element present dans A
   --Renvoie 0 si A est null
   begin
      if Arbre_Vide(A) then return 0;
      else return 1 + Nombre_Elt(Sag(A)) + Nombre_Elt(Sad(A));
      end if;
   end Nombre_Elt;

   function Colortostring (A : T_Abr) return String is
   begin
      if Couleur(A) = False then
         return "Rouge";
      elsif Couleur(A) = True then
         return "Noir";
      else
         return "Erreur";
      end if;
   end Colortostring;

   procedure Affiche_Noeud ( A : in  T_Abr) is
      --Affiche le noeud A
   begin
      Imprime(Lire_Racine(A));
   end Affiche_Noeud;

   function Couleur (A : T_Abr)return Boolean is
   begin
      return A.Couleur;
   end Couleur;

   function Filsgauche (A : T_Abr)return Boolean is
      --teste si A est un filsgauche
   begin
      if not Est_Racine(A) then
         return A.Pere.Sag = A;
      else
         return False;
      end if;
   end Filsgauche;

   function Filsdroit ( A : T_Abr)return Boolean is
      --teste si A est un filsdroit
   begin
      if not Est_Racine(A) then
         return A.Pere.Sad = A;
      else
         return False;
      end if;
   end Filsdroit;

   procedure Modifie (A : in out T_Abr; E : in     T_Elem) is
      --Modifie A en y remplacant son element par E
   begin
      if Arbre_Vide(A) then
         raise Arbrevideexception;
      else
         A.Racine := E;
      end if;
   end Modifie;

   function Lire_Racine (A : T_Abr)return T_Elem is
      --Renvoie l'element contenu dans A
      --Declenche un ArbreVideException si A est null
   begin
      if Arbre_Vide(A) then
         raise Arbrevideexception;
      else
         return A.Racine;
      end if;
   end Lire_Racine;

   function Sag ( A : T_Abr) return T_Abr is
      --Renvoie le sous arbre gauche de A si il existe
      --Declenche une ArbreVideException si A est null ou si son sag est null
   begin
      if Arbre_Vide(A) then
         raise Arbrevideexception;
      else
         return A.Sag;
      end if;
   end Sag;

   function Sad ( A : T_Abr) return T_Abr is
      --Renvoie le sous arbre droit de A si il existe
      --Declenche une ArbreVideException si A est null ou si son sad est null
   begin
      if Arbre_Vide(A) then
         raise Arbrevideexception;
      else
         return A.Sad;
      end if;
   end Sad;

   function Pere ( A : T_Abr)return T_Abr is
      --Renvoie le pere de A si il existe
      --Renvoie une ArbreVideException si A est null ou si son pere est null
   begin
      if Arbre_Vide(A) then
         raise Arbrevideexception;
      else
         return A.Pere;
      end if;
   end Pere;

   function Gpere (  A : T_Abr)return T_Abr is
      --Renvoie le grand pere de A si il existe
      --Renvoie une AbreVideException si A est null ou si son pere est null
   begin
      if Arbre_Vide(A) then
         raise Arbrevideexception;
      elsif Arbre_Vide(A.Pere) then
         return null; --raise ArbreVideException;
      else
         return A.Pere.Pere;
      end if;
   end Gpere;

   function Oncle (A : T_Abr)return T_Abr is
      --Renvoie l'oncle de A (frere du pere)
      --Renvoie une ArbreVideException si A est null ou si il y a des pointeurs null dans le tas
   begin
      if Arbre_Vide(A) then
         raise Arbrevideexception;
      elsif Est_Racine(A) then
         return null; -- raise ArbreVideException;
      elsif Est_Racine(Pere(A)) then
         return null;
         --pas sur de l'exception ... :  --raise ArbreVideException;
      else--normalement le pere de A a un frere a ce niveau là
         return Frere(Pere(A));
      end if;
   end Oncle;

   function Frere ( A : T_Abr) return T_Abr is
      --Renvoie le frere de A, c-a-d l'autre fils du pere de A
      --Renvoie une ArbreVideException si on tombe sur un pointeur null
   begin
      if Arbre_Vide(A) then
         raise Arbrevideexception;
      elsif Est_Racine(A) then
         return null;
         --pas sur de l'exception ...  raise ArbreVideException;
      else--A n'est pas nulle et n'est pas une racine
         if Filsgauche(A) then
            return Sad(Pere(A));
         else
            return Sag(Pere(A));
         end if;
      end if;
   end Frere;

   function Creer_Arbre return T_Abr is
      --Crée un arbre vide
   begin
      return null;
   end Creer_arbre;

   function Arbre_Vide (A : T_Abr)return Boolean is
      --Teste la vacuité de l'arbre A
   begin
      return A = null;
   end Arbre_Vide;

   function Est_Racine (A : T_Abr)return Boolean is
      --Teste si A est racine de l'arbre
   begin
      return Arbre_Vide(Pere(A));
   end;

   procedure Prefixe (A : in T_Abr) is
      --Parcours l'arbre A de maniere prefixe et applique la procedure traitement
      --Cette procedure est generique et sera définie a l'instanciation
      Ag,
         Ad : T_Abr;
   begin
      if Arbre_Vide(A) then
         null;--J'ai choisi de rien faire plutot--raise Arbrevideexception;
      else
         Traitement(A);
         if not Arbre_Vide(Sag(A)) then
            Ag := Sag(A);
            Prefixe(Ag);
         end if;
         if not Arbre_Vide(Sad(A)) then
            Ad := Sad(A);
            Prefixe(Ad);
         end if;
      end if;
   end Prefixe;

   procedure Postfixe (A : in T_Abr) is
      --Parcours l'arbre A de maniere Postfixe et applique la procedure traitement
      --Cette procedure est generique et sera définie a l'instanciation
      Ag,
         Ad : T_Abr;
   begin
      if Arbre_Vide(A) then
         null;--J'ai choisi de rien faire plutot--raise Arbrevideexception;
      else
         if not Arbre_Vide(Sag(A)) then
            Ag := Sag(A);
            Postfixe(Ag);
         end if;
         if not Arbre_Vide(Sad(A)) then
            Ad := Sad(A);
            Postfixe(Ad);
         end if;
         Traitement(A);
      end if;
   end Postfixe;

   procedure Infixe (A : in T_Abr) is
      --Parcours l'arbre A de maniere infixe et applique la procedure traitement
      --Cette procedure est generique et sera définie a l'instanciation
      Ag,
         Ad : T_Abr;
   begin
      if Arbre_Vide(A) then
         null;--J'ai choisi de rien faire plutot--raise Arbrevideexception;
      else
         if not Arbre_Vide(Sag(A)) then
            Ag := Sag(A);
            Infixe(Ag);
         end if;
         Traitement(A);
         if not Arbre_Vide(Sad(A)) then
            Ad := Sad(A);
            Infixe(Ad);
         end if;
      end if;
   end Infixe;

   function Recherche_Abr_Tof (A : T_Abr;V : T_Elem)return Boolean is
      --Renvoie vrai si V appartient a A
   begin
      if Arbre_Vide(A) then
         return False;
      elsif V=Lire_Racine(A) then
         return True;
      elsif V > Lire_Racine(A) then
         return Recherche_Abr_Tof(Sad(A),V);
      else
         return Recherche_Abr_Tof(Sag(A),V);
      end if;
   end Recherche_Abr_Tof;

   function Recherche_Abr (A : T_Abr;V : T_Elem)return T_Abr is
      --Renvoie l'arbre ayant v pour racine
      --Leve une ArbreVideException si il n'y a aucun element dans A
   begin
      if Arbre_Vide(A) then
         return null;
      elsif V=Lire_Racine(A) then
         return A;
      elsif V > Lire_Racine(A) then
         return Recherche_Abr(Sad(A),V);
      else
         return Recherche_Abr(Sag(A),V);
      end if;
   end Recherche_Abr;

   function Est_Feuille (A : T_Abr)return Boolean is
      --renvoie vraie si A est une feuille, faux sinon
   begin
      return Arbre_Vide(Sag(A)) and then Arbre_Vide(Sad(A));
   end Est_Feuille;


   function Max (A,B : Integer)return Integer is
      --Calcule le maximum entre A et B
   begin
      if A>B then
         return A;
      else
         return B;
      end if;
   end Max;

   function Hauteur (A : T_Abr) return Integer is
      --Renvoie la hauteur de A
      --c-a-d le max entre la hauteur de son SAG et de son SAD
      --Si tout va bien la hauteur entre le SAG et le SAD ne devrait pas différer
      --de plus de 1 si l'arbre est bien équilibré
      --La hauteur d'un arbre avec un seul noeud est 0
      --La hauteur d'un arbre null n'est pas définie
   begin
      if not Arbre_Vide(A) then
         if Est_Feuille(A) then
            return 0;
         elsif Arbre_Vide(Sag(A)) then
            return 1 + Hauteur(Sad(A));
         elsif Arbre_Vide(Sad(A)) then
            return 1 + Hauteur(Sag(A));
         else
            return 1 + Max(Hauteur(Sag(A)),Hauteur(Sad(A)));
         end if;
      else
         Put_Line("Parametre vide");
         return -1;
         --normalement ca devrait arrivé uniquement lorsque l'arbre est vide a l'origine
      end if;

   end Hauteur;

   function Est_Equilibre (A : T_Abr)return Boolean is
      --Renvoie vrai si l'arbre A est équilibré
      --C-a-d si la hauteur entre le SAG et le SAD ne varie pas plus que un
      Diff_Haut : Integer;
   begin
      if Arbre_Vide(A) then
         raise Arbrevideexception;
      else
         Diff_Haut := Hauteur(Sag(A))-Hauteur(Sad(A));
         return ( Diff_Haut = 1 or else Diff_Haut = -1 or else Diff_Haut = 0);
      end if;
   end Est_Equilibre;

   function RechercheR (A : T_Abr)return T_Abr is
      --fonction aussi appelée recherchepluspetit ou un autre nom comme ca
      --la fonction va soit chercher le plus grand a gauche soit le plus petit a droite
      --Ici le choix est de chercher le plus grand element du sag de A
      Temp : T_Abr;
   begin
      Temp := Sag(A);
      while not Arbre_Vide(Sad(Temp)) loop
         Temp := Sad(Temp);
      end loop;
      return Temp;
   end Rechercher;

   procedure Rotation_Droite_Simple (X : in out T_Abr) is--return T_Abr is
      --Effectue une rotation simple avec X comme racine et Y comme pivot(enfin je crois)
      Y : T_Abr;
   begin
      Y := X.Sag;
      X.Sag := Y.Sad;
      if not Arbre_Vide(Y.Sad) then
         Y.Sad.Pere := X;
      end if;
      Y.Pere := X.Pere;
      if not Arbre_Vide(X.Pere) then
         if Filsgauche(X) then
            X.Pere.Sag := Y;
         else
            X.Pere.Sad := Y;
         end if;
      end if;
      Y.Sad := X;
      X.Pere := Y;
   end Rotation_Droite_Simple;

   procedure Rotation_Gauche_Simple (X : in out T_Abr) is--return T_Abr is
      --Effectue une rotation simple avec X comme racine et Y comme pivot(enfin je crois)
      Y : T_Abr;
   begin
      Y := X.Sad;
      --Modification par symetrié effectué, a verifier quand meme
      X.Sad := Y.Sag;
      if not Arbre_Vide(Y.Sag) then
         Y.Sag.Pere := X;
      end if;
      Y.Pere := X.Pere;
      if not Arbre_Vide(X.Pere) then
         if Filsgauche(X) then
            X.Pere.Sag := Y;
         else
            X.Pere.Sad := Y;
         end if;
      end if;
      Y.Sag := X;
      X.Pere := Y;

   end Rotation_Gauche_Simple;

   procedure Rotation_Droite (X : in out T_Abr; Y : in T_Abr) is--return T_Abr is
      --Effectue une rotation avec x comme racine et Y comme pivot
      --prerequis : y appartient au sag de x
      Z : T_Abr;
   begin
      if X.Sag = Y then
         Rotation_Droite_Simple(X);
      else
         Z := Y.Pere;
         if Filsgauche(Y) then
            Rotation_Droite_Simple(Z);
            Rotation_Droite(X,Z);
         else--y est fils droit
            Rotation_Gauche_Simple(Z);
            Rotation_Droite(X,Z);
         end if;
      end if;
   end Rotation_Droite;

   procedure Rotation_Gauche (X : in out T_Abr; Y : in T_Abr) is-- return T_Abr is
      --Effectue une rotation avec x comme racine et Y comme pivot
      --prerequis : y appartient au sad de x
      Z : T_Abr;
   begin
      --Modification effectuée, tous les gauches changés en droit et inversement, comme pour au dessus
      --a tester, j'suis pas certain que tout soit juste
      if X.Sad = Y then
         Rotation_Gauche_Simple(X);
      else
         Z := Y.Pere;
         if Filsgauche(Y) then
            Rotation_Droite_Simple(Z);
            Rotation_Gauche(X,Z);
         else--y est fils droit
            Rotation_Gauche_Simple(Z);
            Rotation_Gauche(X,Z);
         end if;
      end if;

   end Rotation_Gauche;

   function Cas_Equilib_Insertion_Arn (A : T_Abr)return Integer is
      --Renvoie un entier qui nous permettra dans quel cas on se trouve apres l'insertion d'un element
      --dans l'ARN
      --renvoie -1 en cas d'erreur
   begin
      if Est_Racine(A) then
         return 10;
      elsif Est_Racine(A.Pere) then
         return 10;
      elsif A.Pere.Couleur = True then
         return 0;
      else -- pere de n rouge
         if not Arbre_Vide(Oncle(A)) then
            if Oncle(A).Couleur = False then
               return 20;
            end if;
         else -- couleur(oncle(n))=noir
            if Filsgauche(A.Pere) then
               if Filsgauche(A) then
                  return 31;
               else
                  return 32;
               end if;
            else --n.pere est fils droit
               if Filsdroit(A) then
                  return 41;
               else
                  return 42;
               end if;
            end if;
         end if;
         --C'est censé jamais arriver
         return (-1);
      end if;
   end Cas_Equilib_Insertion_Arn;

   function Racine (A : T_Abr)return T_Abr is
   begin
      if Est_Racine(A) then
         return A;
      else
         return Racine(A.Pere);
      end if;
   end Racine;

   procedure Equilibrage_Arn (X : in out T_Abr) is
      --Equilibre l'arbre
      --Code Couleur :
      --true equivaut a noir et false a rouge
      N  : Integer;
      P,Gp,F : T_Abr;
   begin
      N := Cas_Equilib_Insertion_Arn(X);
      P := Pere(X);
      Gp := Gpere(X);
      
      --j'initialise le frere du pere(l'oncle) seulement si il existe
      if not Arbre_Vide(P) and then not Arbre_Vide(Frere(P)) then
         F := Frere(P);
      else
         F := null;
      end if;

      if N=0 then
         null;
         --rien a faire ici normalement
      elsif N=10 then
         if Est_Racine(X) then
            X.Couleur := True;
         else
            Pere(X).Couleur := True;
         end if;
      elsif N=20 then
         P.Couleur := True;
         F.Couleur := True;
         Gp.Couleur := False;
         if not Est_Racine(Gp) then
            --si GP n'est pas a la racine on peut se retrouver avec une violation
            --de la propriété 3 si le pere de GP est rouge
            Equilibrage_Arn(Gp);
         end if;
      elsif N=31 then--x fils gauche, p fils gauche
         Rotation_Droite(Gp,P);
         P.Couleur := True;
         Gp.Couleur := False;
      elsif N=32 then--p fils gauche, x fils droit
         Rotation_Gauche(P,X);
         Rotation_Droite(Gp,X);
         X.Couleur := True;
         Gp.Couleur := False;
      elsif N=42 then--p fils droit, x fils gauche
         Rotation_Droite(P,X);
         Rotation_Gauche(Gp,X);
         X.Couleur := True;
         Gp.Couleur := False;
      elsif N=41 then--p fils droit, x fils droit
         Rotation_Gauche(Gp,P);
         P.Couleur := True;
         Gp.Couleur := False;
      end if;
   end Equilibrage_Arn;

   procedure Inserer_Abr (A : in out T_Abr;V : in T_Elem) is
      --Insere l'element V dans l'arbre en respectant les contraintes des ABR
   begin
      if Arbre_Vide(A) then
         A := new Noeud'(V,null,null,null,False);
         --le noeud inséré est colorié en rouge
      elsif Lire_Racine(A) = V then
         --dans ce cas rien a faire, le mot est deja la
         --eventuellement un traitement des doublons
         Traitement_Doublon(A);
      elsif V < Lire_Racine(A) then
         if Sag(A) = null then
            A.Sag := new Noeud'(V,null,null,A,False);
         else
            Inserer_Abr(A.Sag,V);
            A.Sag.Pere := A;
         end if;
      elsif V > Lire_Racine(A) then
         if A.Sad = null then
            A.Sad := new Noeud'(V,null,null,A,False);
         else
            Inserer_Abr(A.Sad,V);
            A.Sad.Pere := A;
         end if;
      end if;
   end Inserer_Abr;

   procedure Inserer_Arn (A : in out T_Abr;V : in T_Elem) is
      --Insere l'element V dans l'arbre en respectant l'équilibrage(gesion des couleurs rouges et noires)
      --et en respectant les contraintes des ARN
      Ag,Ad : T_Abr;
   begin
      if Arbre_Vide(A) then
         A := new Noeud'(V,null,null,null,False);
         --le noeud inséré est colorié en rouge
         Equilibrage_Arn(A);
      elsif V < Lire_Racine(A) then
         if Sag(A) = null then
            Ag := A.Sag;
            Ag := new Noeud'(V,null,null,A,False);
            a.sag := ag;
            Equilibrage_Arn(Ag);
         else
            ag := a.sag;
            Inserer_Arn(ag,V);
         end if;               
      elsif V > Lire_Racine(A) then
         if A.Sad = null then
            ad := a.sad;
            ad := new Noeud'(V,null,null,A,False);
            a.sad := ad;
            Equilibrage_Arn(Ad);
         else
            ad := A.sad;
            Inserer_Arn(ad,V);
         end if;      
      elsif Lire_Racine(A) = V then
         --dans ce cas rien a faire, le mot est deja la
         Traitement_Doublon(A);
      end if;
      A := racine(A);
   end Inserer_Arn;

   procedure Supprimer_Abr (A : in out T_Abr;V : in T_Elem) is
      --Supprime l'element V de A
      T : T_Abr;
      R : T_Abr;
   begin
      T := Recherche_Abr(A,V);
      if Arbre_Vide(A) then
         null;--rien a faire
      elsif Est_Feuille(T) then
         if Est_Racine(T) then
            A := null;
         elsif Filsgauche(T) then
            T.Pere.Sag := null;
         else
            T.Pere.Sad := null;--T est fils droit
         end if;
      elsif T.Sag = null then
         if Est_Racine(T) then
            T.Sad.Pere := null;
         elsif Filsgauche(T) then
            T.Pere.Sag := T.Sad;
            T.Sad.Pere := T.Pere;
         else--T est fils droit
            T.Pere.Sad := T.Sad;
            T.Sad.Pere := T.Pere;
         end if;
         Liberer(T);--pas sur, mais ce devrait etre juste
      elsif T.Sad = null then
         --symetrique
         if Est_Racine(T) then
            T.Sag.Pere := null;
         elsif Filsgauche(T) then
            T.Pere.Sag := T.Sag;
            T.Sag.Pere := T.Pere;
         elsif Filsdroit(T) then
            T.Pere.Sad := T.Sag;
            T.Sag.Pere := T.Pere;
         end if;
         Liberer(T);
      else
         R := RechercheR(T);
         --Comentaire de JCoudsi       
         --R.sad := T.sad;
         T.Racine := R.Racine;
         --R.sad = null
         Supprimer_Abr(R,R.Racine);
         --Equilibrage_Arn(A);--a verifier
      end if;
   end Supprimer_Abr;

   procedure Copietriee(A: in T_Abr; B : out T_Abr) is  
   begin
      if not Arbre_Vide(A) then
         Imprime(Lire_Racine(A));
         Copietriee(Sag(A),B);
         Copietriee(Sad(A),B);
         Inserer(B,Lire_Racine(A));
      end if;      
   end Copietriee;
   
   procedure Vider_Arbre (A : in out T_Abr) is
      --Supprime tous les elements de A
      --ArbreVide(Vider_Arbre(A)) = true
      Ag,Ad  : T_Abr;
   begin
      if not Arbre_Vide(A) then 
         Ag := A.Sag;
         Vider_Arbre(Ag);
         Ad := A.Sad;
         Vider_Arbre(Ad);
         Liberer(A);
      end if;            
   end Vider_Arbre;
   
   procedure Fusion(A : in out T_Abr; E1,E2 : in T_Elem) is
   --Si E1 et E2 n'appartiennent pas a l'arbre A alors ne fait rien
   --Sinon Modifie l'element E1 en y rajoutant les "attributs" de E2
   begin
      Modif_Fusion(A,E1,E2);
   end Fusion;

end Arbre_Binaire; 
