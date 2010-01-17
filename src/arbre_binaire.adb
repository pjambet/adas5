package body Arbre_Binaire is

   procedure Liberer is new Ada.Unchecked_Deallocation(Cellule,T_ABR);
      --cree une procedure de liberation d'espace pour les objets
      --designes par un arbre
   
   procedure Modifie(A: in out T_ABR;E: in T_Elem) is
      --Modifie A en y remplacant son element par E
   begin
      if ArbreVide then raise ArbreVideException;
      else A.Val := E;
      end if;
   end Modifie;

   function LireRacine(A: T_ABR) return T_Elem is
      --Renvoie l'element contenu dans A
      --Declenche un ArbreVideException si A est null
   begin
      if ArbreVide(A) then raise ArbreVideException;
      else return A.Val;
      end if;
   end LireRacine;

   function SAG(A: T_ABR) return T_ABR is
      --Renvoie le sous arbre gauche de A si il existe
      --Declenche une ArbreVideException si A est null ou si son sag est null
   begin
      if ArbreVide(A) then raise ArbreVideException;
      else return A.SAG;
      end if;
   end SAG;

   function SAD(A: T_ABR) return T_ABR is
      --Renvoie le sous arbre droit de A si il existe
      --Declenche une ArbreVideException si A est null ou si son sad est null
   begin
      if ArbreVide(A) then raise ArbreVideException;
      else return A.SAD;
      end if;
   end SAD;

   function Pere(A: T_ABR) return T_ABR is
      --Renvoie le pere de A si il existe
      --Renvoie une ArbreVideException si A est null ou si son pere est null
   begin
      if ArbreVide(A) then raise ArbreVideException;
      else return A.Pere;
      end if;
   end Pere;
   
   function Oncle(A: T_ABR) return T_ABR is
      --Renvoie l'oncle de A (frere du pere)
      --Renvoie une ArbreVideException si A est null ou si il y a des pointeurs null dans le tas
   begin
      if ArbreVide(A) then raise ArbreVideException;
      elsif Est_Racine(A) then raise ArbreVideException;
      elsif Est_Racine(Pere(A)) then raise ArbreVideException;
      else--normalement le pere de A a un frere a ce niveau là
         return Frere(Pere(A));
      end if;
   end Oncle;
   
   function Frere(A: T_ABR) return T_ABR is
      --Renvoie le frere de A, c-a-d l'autre fils du pere de A
      --Renvoie une ArbreVideException si on tombe sur un pointeur null
   begin
      if ArbreVide(A) then raise ArbreVideException;
      elsif Est_Racine(A) then raise ArbreVideException;
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

   procedure Affiche(A: in T_ABR) is
      --Affiche l'arbre dans la console
      --Utilise imprime qui est generic
   begin
      --TODO
      null;
   end Affiche;

   function ArbreVide(A: T_ABR) return Boolean is
      --Teste la vacuité de l'arbre A
   begin
      return A = null;
   end ArbreVide;

   function Est_Racine(A: T_Abr) return Boolean is
      --Teste si A est racine de l'arbre
   begin
      return ArbreVide(Pere(A));
   end;
   
   procedure Prefixe(A: in out T_ABR) is
      --Parcours l'arbre A de maniere prefixe et applique la procedure traitement
      --Cette procedure est generique et sera définie a l'instanciation
   begin
      if ArbreVide(A) then raise ArbreVideException;
      else
         Traitement(LireRacine(A));
         Prefixe(SAG(A));
         Prefixe(SAD(A));
      end if;
   end Prefixe;

   procedure Postfixe(A: in out T_ABR) is
      --Parcours l'arbre A de maniere Postfixe et applique la procedure traitement
      --Cette procedure est generique et sera définie a l'instanciation
   begin
      if ArbreVide(A) then raise ArbreVideException;
      else
         Postfixe(SAG(A));
         Postfixe(SAD(A));
         Traitement(LireRacine(A));
      end if;
   end Postfixe;

   procedure Infixe(A: in out T_ABR) is
      --Parcours l'arbre A de maniere infixe et applique la procedure traitement
      --Cette procedure est generique et sera définie a l'instanciation
   begin
      if ArbreVide(A) then raise ArbreVideException;
      else
         Infixe(SAG(A));
         Traitement(LireRacine(A));
         Infixe(SAD(A));
      end if;
   end Infixe;

   function Recherche_ABR_ToF(A: T_ABR;V: T_Elem) return Boolean is
      --Renvoie vrai si V appartient a A
   begin
      if ArbreVide(A) then raise ArbreVideException;
      elsif V=LireRacine(A) then return True;
      elsif V > LireRacine(A) then return Recherche_ABR_ToF(SAD(A),V);
      else return Recherche_ABR_ToF(SAG(A),V);
      end if;
   end Recherche_ABR_ToF;
   
   function Recherche_ABR(A: T_ABR;V: T_Elem) return T_ABR is
      --Renvoie l'arbre ayant v pour racine
      --Leve une ArbreVideException si il n'y a aucun element dans A
   begin
      if ArbreVide(A) then raise ArbreVideException;
      elsif V=LireRacine(A) then return A;
      elsif V > LireRacine(A) then return Recherche_ABR(SAD(A),V);
      else return Recherche_ABR(SAG(A),V);
      end if;
   end Recherche_ABR;
   
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
   
   function Est_Feuille(A: T_ABR) return Boolean is
      --renvoie vraie si A est une feuille, faux sinon
   begin
      return ArbreVide(SAG(A)) and then ArbreVide(SAD(A));
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
      --La hauteur d'un arbre null est 0
   begin
      if ArbreVide(A) then raise ArbreVideException;
      else return 1 + Max(Hauteur(SAG(A)),Hauteur(SAD(A)));         
      end if;
   end Hauteur;
   
   function Estequilibre(A: T_Abr) return Boolean is
   --Renvoie vrai si l'arbre A est équilibré
   --C-a-d si la hauteur entre le SAG et le SAD ne varie pas plus que un
   Diff_Haut: Integer;
   begin
      if ArbreVide(A) then raise ArbreVideException;
      else
         Diff_Haut := Hauteur(Sag(A))-Hauteur(Sad(A));
         return ( Diff_Haut = 1 or else Diff_Haut = -1 );
      end if;
   end Estequilibre;
      
   function RechercheR(A: T_ABR) return T_ABR is
      --fonction aussi appelé recherchepluspetit ou un autre nom comme ca
      --la fonction va soit chercher le plus grand a gauche soit le plus petit a droite
      --Ici le choix est de chercher le plus grand element du sag de A
      temp : T_ABR;
   begin
      Temp := Sag(A);
      while not ArbreVide(Sad(Temp)) loop
         Temp := Sad(Temp);
      end loop;
      return Temp;
   end RechercheR;
   
   function Rotation_Droite_Simple(X,Y: T_ABR) return T_ABR is
      --Effectue une rotation simple avec X comme racine et Y comme pivot(enfin je crois)
   begin
      X.Sag := Y.Sad;
      if not ArbreVide(Y.Sad) then
         Y.Sad.Pere := X;
      end if;
      Y.Pere := X.Pere;
      if not ArbreVide(X.Pere) then
         if FIlsGauche(X) then
            X.Pere.Sag := Y;
         else
            X.Pere.Sad := Y;
         end if;
      end if;
      Y.Sad := X;
      X.Pere := Y;
      return Y;
   end Rotation_Droite_Simple;
   
   function Rotation_Droite(X,Y: T_ABR) return T_ABR is
      --Effectue une rotation avec x comme racine et Y comme pivot
      --prerequis : y appartient au sag de x
      z: T_ABR;
   begin
      if X.Sag = Y then return Rotation_Droite_Simple(X,Y);
      else
         Z := Y.Pere;
         if FilsGauche(Y) then
            Z := Rotation_Droite_SImple(Z);
            return Rotation_Droite(X,Z);
         else--y est fils droit
            return Rotation_Droite(X,Rotation_Gauche_Simple(Z));
         end if;
      end if;
   end Rotation_Droite;
      
   function Rotation_Gauche_Simple(X,Y: T_ABR) return T_ABR is
      --Effectue une rotation simple avec X comme racine et Y comme pivot(enfin je crois)
   begin
      --Modification par symetrié effectué, a verifier quand meme
      X.Sad := Y.Sag;
      if not ArbreVide(Y.Sag) then
         Y.Sad.Pere := X;
      end if;
      Y.Pere := X.Pere;
      if not ArbreVide(X.Pere) then
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
   
   function Rotation_Gauche(X,Y: T_ABR) return T_ABR is
      --Effectue une rotation avec x comme racine et Y comme pivot
      --prerequis : y appartient au sag de x
      z: T_ABR;
   begin
      --Modification effectuée, tous les gauches changés en droit et inversement, comme pour au dessus
      --a tester, j'suis pas certain que tout soit juste
      if X.Sad = Y then return Rotation_Gauche_Simple(X,Y);
      else
         Z := Y.Pere;
         if FilsGauche(Y) then
            Z := Rotation_gauche_SImple(Z);
            return Rotation_gauche(X,Z);
         else--y est fils droit
            return Rotation_Gauche(X,Rotation_Droite_Simple(Z));
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

   function Equilibrage_ARN(A,X: T_Abr) return T_ABR is
      --Equilibre l'arbre
      --fonction a terminer
      N: Integer;
   begin
      N := Cas_Equilib_Insertion_Arn(X);
      if N=0 then
         
      elsif N=10 then
         
      elsif N=20 then
         
      elsif N=31 then
         
      elsif N=32 then
         
      elsif N=41 then
         
      elsif N=42 then
         
      end if;
   end Equilibrage_ARN;
      
   function Insertion_ABR(A:in out T_ABR;V: in T_Elem) return T_ABR is
   --Insere l'element V dans l'arbre en respectant les contraintes des ABR 
   begin
      if Arbrevide(A) then
         return T_Abr'(V,null,null,null,False);--le noeud inséré est colorié en rouge
      elsif Lireracine(A) = V then
         return A;
      elsif V < Lireracine(A) then
         if Sag(A) = null then A.Sag := T_Abr'(V,null,null,A,False);
         else 
            A.Sag := Insertion_Abr(A.Sag,E);
            A.Sag.Pere := A;
         end if;
         return A;
      elsif V > Lireracine(A) then
         if A.Sad = null then A.Sad := T_Abr'(V,null,null,A,False);
         else
            A.Sad := Insertion_Abre(A.Sad,E);
            A.Sad.Pere := A;
         end if;
         return A;
      end if;
   end Insertion_Abr;
   
   procedure Insertion_ARN(A:in out T_ABR;V: in T_Elem) is
   --Insere l'element V dans l'arbre en respectant l'équilibrage(gesion des couleurs rouges et noires)
   --et en respectant les contraintes des ARN
   begin
      --PAS FINI !!!
      --faut rajouter les modifications specifiques aux ARN
      if Arbrevide(A) then
         return T_Abr'(V,null,null,null,False);--le noeud inséré est colorié en rouge
      elsif Lireracine(A) = V then
         return A;
      elsif V < Lireracine(A) then
         if Sag(A) = null then A.Sag := T_Abr'(V,null,null,A,False);
         else
            A.Sag := Insertion_Abr(A.Sag,E);
            A.Sag.Pere := A;
         end if;
         return A;
      elsif V > Lireracine(A) then
         if A.Sad = null then A.Sad := T_Abr'(V,null,null,A,False);
         else
            A.Sad := Insertion_Abre(A.Sad,E);
            A.Sad.Pere := A;
         end if;
         return A;
      end if;
   end Insertion_ARN;
   
   procedure Suppression_ABR(A: in out T_ABR;V: in T_Elem) is
   --Supprime l'element V de A
      T: T_ABR;      
   begin
      --manque des return, a voir en TP/TD...
      --On va tester de le mettre sous forme de procédure
      T := Reherche_ABR(A,V);
      if ArbreVide(A) then return A; 
      elsif Est_Feuille(T) then
         if Est_Racine(T) then return null;
         elsif FilsGauche(T) then T.Pere.Sag := null;
         else T.Pere.Sad := null;--T est fils droit
         end if;
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
         liberer(T);
      else
         R := RechercheR(T);
         T.Racine := R.Racine;
         --R.sad = null
         R := Supprimer(R,R.Racine);
      end if;      
   end Suppression_Abr;
   
   procedure Vider_Arbre(A: in out T_Abr) is
   --Supprime tous les elements de A
   --ArbreVide(Vider_Arbre(A)) = true
   begin
      if not Arbrevide(A) then
         if not Arbrevide(Sag(A)) then
            if Estfeuille(Sag(A)) then Liberer(Sag(A));
            else Vider_arbre(Sag(A));--on vide a gauche
            end if;
         elsif not Arbrevide(Sad(A)) then
            if Estfeuille(SAD(A)) then Liberer(SAD(A));
            else Vider_Arbre(SAD(A));--et on vide a droite  
            end if;
         end if;         
      end if;
   end Vider_Arbre;
      
end Arbre_Binaire;
