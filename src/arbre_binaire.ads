-- #################################################################################
-- #                                                                               #
-- #   Nom : arbre_binaire.ads                                                     #
-- #   Auteur : JAMBET Pierre                                                      #
-- #   Date de création : 17/01/2010                                               #
-- #   Date de modification : 25/01/2010                                           #   
-- #                                                                               #
-- #################################################################################

generic

   type T_Elem is private;
   with procedure Imprime(X: in T_Elem);
   --Affiche l'element X
   with function ">"(T1, T2 : T_Elem) return Boolean is <>;
   with function "="(T1, T2 : T_Elem) return Boolean is <>;
   --with function "<"(T1, T2 : T_Elem) return Boolean is <>;

package Arbre_Binaire is

   --Representation generique d'un arbre binaire de recherche auto équilibré (rouge et noir)
   --C'est donc un ABR(Binaire de Recherche)RN(Rouge et Noir)

   type T_Abr is private;
   Arbrevideexception : exception;
   Elt_Inexistant: exception;
   
   -- #################################################################################

   procedure Modifie(A: in out T_Abr;E: in T_Elem);
   --Modifie A en y remplacant son element par E

   function Lire_Racine(A: T_Abr) return T_Elem;
   --Renvoie l'element contenu dans A
   --Declenche un ArbreVideException si A est null

   function Sag(A: T_Abr) return T_Abr;
   --Renvoie le sous arbre gauche de A si il existe
   --Declenche une ArbreVideException si A est null ou si son sag est null

   function Sad(A: T_Abr) return T_Abr;
   --Renvoie le sous arbre droit de A si il existe
   --Declenche une ArbreVideException si A est null ou si son sad est null

   function Pere(A: T_Abr) return T_Abr;
   --Renvoie le pere de A si il existe
   --Renvoie une ArbreVideException si A est null ou si son pere est null

   function Oncle(A: T_Abr) return T_Abr;
   --Renvoie l'oncle de A (frere du pere)
   --Renvoie une ArbreVideException si A est null ou si il y a des pointeurs null dans le tas

   function Frere(A: T_Abr) return T_Abr;
   --Renvoie le frere de A, c-a-d l'autre fils du pere de A
   --Renvoie une ArbreVideException si on tombe sur un pointeur null

   function Couleur(A: T_Abr) return Boolean;
   --Renvoie un boolean correspondant a la couleur du noeud A
   -- True : NOIR
   -- False : ROUGE

   -- #################################################################################

   function Colortostring(A: T_Abr) return String;
   --Renvoie un string correspondant a la couleur du noeud selon le code definit ci dessus

   procedure Affiche_Noeud(A: in T_Abr);
   --Affiche le noeud A

   function Nombre_Elt(A: T_Abr) return Integer;
   --Renvoie le nombre d'element present dans A
   --Renvoie 0 si A est null

   function Creerarbre return T_Abr;
   --Crée un arbre vide

   function Arbre_Vide(A: T_Abr) return Boolean;
   --Teste la vacuité de l'arbre A

   function Est_Racine(A: T_Abr) return Boolean;
   --Teste si A est racine de l'arbre

   function Est_Feuille(A: T_Abr) return Boolean;
   --Teste si A est une feuille

   function Hauteur(A: T_Abr) return Integer;
   --Renvoie la hauteur de A
   --c-a-d le max entre la hauteur de son SAG et de son SAD
   --Si tout va bien la hauteur entre le SAG et le SAD ne devrait pas différer
   --de plus de 1 si l'arbre est bien équilibré
   --La hauteur d'un arbre null est 0

   function Est_Equilibre(A: T_Abr) return Boolean;
   --Renvoie vrai si l'arbre A est équilibré
   --C-a-d si la hauteur entre le SAG et le SAD ne varie pas plus que un

   function Racine(A: T_Abr) return T_Abr;
   --Fais remonter A a la racine de l'arbre
   
   -- #################################################################################

   generic
      with procedure Traitement(A: in T_Abr);
   procedure Prefixe(A: in T_Abr);
   --Parcours l'arbre A de maniere prefixe et applique la procedure traitement
   --Cette procedure est generique et sera définie a l'instanciation

   generic
      with procedure Traitement(A: in T_Abr);
   procedure Postfixe(A: in T_Abr);
   --Parcours l'arbre A de maniere suffixe et applique la procedure traitement
   --Cette procedure est generique et sera définie a l'instanciation

   generic
      with procedure Traitement(A: in T_Abr);
   procedure Infixe(A: in T_Abr);
   --Parcours l'arbre A de maniere infixe et applique la procedure traitement
   --Cette procedure est generique et sera définie a l'instanciation

   -- #################################################################################

   function Recherche_Abr_Tof(A: T_Abr;V: T_Elem) return Boolean;
   --Renvoie vrai si V appartient a A
   --ToF signifie True or False pour signaler que la fonction renvoit un booléen

   function Recherche_Abr(A: T_Abr;V: T_Elem) return T_Abr;
   --Renvoie l'arbre ayant v pour racine
   --Leve une ArbreVideException si il n'y a aucun element dans A

   generic
      with function ">"(T1, T2 : T_Elem) return Boolean is <>;
      with function "="(T1, T2 : T_Elem) return Boolean is <>;
      with function "<"(T1, T2 : T_Elem) return Boolean is <>;
      with procedure Traitement_Doublon(A : in out T_Abr);
   procedure Inserer_Abr(A:in out T_Abr;V: in T_Elem);
   --Insere l'element V dans l'arbre en respectant les contraintes des ABR

   generic
      with function ">"(T1, T2 : T_Elem) return Boolean is <>;
      with function "="(T1, T2 : T_Elem) return Boolean is <>;
      with function "<"(T1, T2 : T_Elem) return Boolean is <>;
      with procedure Traitement_Doublon(A : in out T_Abr);
   procedure Inserer_Arn(A:in out T_Abr;V: in T_Elem);
   --Insere l'element V dans l'arbre en respectant l'équilibrage(gesion des couleurs rouges et noires)
   --et en respectant les contraintes des N

   generic
      with procedure Inserer(A:in out T_Abr;V: in T_Elem);
   procedure Copietriee(A: in T_Abr; B : out T_Abr);
   --Crée dans B le meme arbre que dans A mais selon l'ordre definie par les generic

   procedure Supprimer_Abr(A: in out T_Abr;V: in T_Elem);
   --Supprime l'element V de A

   procedure Vider_Arbre(A: in out T_Abr);
   --Supprime tous les elements de A
   --ArbreVide(Vider_Arbre(A)) = true
   
   generic
      with procedure Modif_Fusion(A : in out T_ABR; E1,E2 : in T_Elem);
   procedure Fusion(A : in out T_Abr; E1,E2 : in T_Elem);
   --Si E1 et E2 n'appartiennent pas a l'arbre A alors ne fait rien
   --Sinon Modifie l'element E1 en y rajoutant les "attributs" de E2

   -- #################################################################################

private

   type Noeud;
   type T_Abr is access Noeud;
   type Noeud is record
      Racine : T_Elem;
      Sag: T_Abr;
      Sad: T_Abr;
      Pere: T_Abr;
      Couleur: Boolean;
      --True equivaut a noir et false équivaut a rouge
   end record;

end Arbre_Binaire;
