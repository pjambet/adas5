with Ada.Text_Io;use Ada.Text_Io;

generic
   type T_Elem is private;
   with procedure Imprime(X: in T_Elem);
   --Affiche l'element X
   with function ">"(T1, T2 : T_Elem) return Boolean is <>;
   with function "="(T1, T2 : T_Elem) return Boolean is <>;
   with function "<"(T1, T2 : T_Elem) return Boolean is <>;

package Arbre_Binaire is
   --Representation generique d'un arbre binaire de recherche auto équilibré (rouge et noir)
   --C'est donc un ABR(Binaire de Recherche)RN(Rouge et Noir)

   type T_ABR is private;
   ArbreVideException : exception;
   Elt_Inexistant: exception;

   procedure Modifie(A: in out T_ABR;E: in T_Elem);
   --Modifie A en y remplacant son element par E

   function Lire_Racine(A: T_ABR) return T_Elem;
   --Renvoie l'element contenu dans A
   --Declenche un ArbreVideException si A est null

   function SAG(A: T_ABR) return T_ABR;
   --Renvoie le sous arbre gauche de A si il existe
   --Declenche une ArbreVideException si A est null ou si son sag est null

   function SAD(A: T_ABR) return T_ABR;
   --Renvoie le sous arbre droit de A si il existe
   --Declenche une ArbreVideException si A est null ou si son sad est null
   
   function Pere(A: T_ABR) return T_ABR;
   --Renvoie le pere de A si il existe
   --Renvoie une ArbreVideException si A est null ou si son pere est null

   function Oncle(A: T_ABR) return T_ABR;
   --Renvoie l'oncle de A (frere du pere)
   --Renvoie une ArbreVideException si A est null ou si il y a des pointeurs null dans le tas

   function Frere(A: T_ABR) return T_ABR;
   --Renvoie le frere de A, c-a-d l'autre fils du pere de A
   --Renvoie une ArbreVideException si on tombe sur un pointeur null
   
   function CreerArbre return T_ABR;
   --Crée un arbre vide

   procedure Affiche(A: in T_ABR);
   --Affiche l'arbre dans la console
   --Utilise imprime qui est generic

   function Arbre_Vide(A: T_ABR) return Boolean;
   --Teste la vacuité de l'arbre A

   function Est_racine(A: T_Abr) return Boolean;
   --Teste si A est racine de l'arbre

   function Hauteur(A: T_ABR) return Integer;
   --Renvoie la hauteur de A
   --c-a-d le max entre la hauteur de son SAG et de son SAD
   --Si tout va bien la hauteur entre le SAG et le SAD ne devrait pas différer
   --de plus de 1 si l'arbre est bien équilibré
   --La hauteur d'un arbre null est 0

   function Est_equilibre(A: T_Abr) return Boolean;
   --Renvoie vrai si l'arbre A est équilibré
   --C-a-d si la hauteur entre le SAG et le SAD ne varie pas plus que un

   generic
      with Procedure Traitement(A: in T_ABR);
   procedure Prefixe(A: in T_ABR);
   --Parcours l'arbre A de maniere prefixe et applique la procedure traitement
   --Cette procedure est generique et sera définie a l'instanciation

   generic
      with Procedure Traitement(A: in T_ABR);
   procedure Postfixe(A: in T_ABR);
   --Parcours l'arbre A de maniere suffixe et applique la procedure traitement
   --Cette procedure est generique et sera définie a l'instanciation

   generic
      with Procedure Traitement(A: in T_ABR);
   procedure Infixe(A: in T_ABR);
   --Parcours l'arbre A de maniere infixe et applique la procedure traitement
   --Cette procedure est generique et sera définie a l'instanciation

   function Recherche_ABR_ToF(A: T_ABR;V: T_Elem) return Boolean;
   --Renvoie vrai si V appartient a A
   --ToF signifie True or False pour signaler que la fonction renvoit un booléen
   
   function Recherche_ABR(A: T_ABR;V: T_Elem) return T_ABR;
   --Renvoie l'arbre ayant v pour racine
   --Leve une ArbreVideException si il n'y a aucun element dans A

   generic
      with function ">"(T1, T2 : T_Elem) return Boolean is <>;
      with function "="(T1, T2 : T_Elem) return Boolean is <>;
      with function "<"(T1, T2 : T_Elem) return Boolean is <>;
      with procedure Traitement_Doublon(A : in out T_ABR);
   procedure Inserer_ABR(A:in out T_ABR;V: in T_Elem);
   --Insere l'element V dans l'arbre en respectant les contraintes des ABR

   generic
      with function ">"(T1, T2 : T_Elem) return Boolean is <>;
      with function "="(T1, T2 : T_Elem) return Boolean is <>;
      with function "<"(T1, T2 : T_Elem) return Boolean is <>;
      with procedure Traitement_Doublon(A : in out T_ABR);
   procedure Inserer_ARN(A:in out T_ABR;V: in T_Elem);
   --Insere l'element V dans l'arbre en respectant l'équilibrage(gesion des couleurs rouges et noires)
   --et en respectant les contraintes des N

   procedure Supprimer_ABR(A: in out T_ABR;V: in T_Elem);
   --Supprime l'element V de A
   
   procedure Vider_Arbre(A: in out T_Abr);
   --Supprime tous les elements de A
   --ArbreVide(Vider_Arbre(A)) = true

private
    type Noeud;
    type T_ABR is access Noeud;
    type Noeud is record
       Racine : T_Elem;
       SAG: T_ABR;
       Sad: T_ABR;
       pere: T_ABR;       
       Couleur: Boolean;
       --True equivaut a noir et false équivaut a rouge
    end record;

end Arbre_Binaire;
