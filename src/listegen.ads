with Ada.Text_Io; use Ada.Text_Io;
with Ada.Unchecked_Deallocation;

generic
   type T_Elem is private;
   with function ">"(T1,T2: T_Elem)return Boolean is <>;
   with function "="(T1,T2: T_Elem)return Boolean is <>;
   with function "<"(T1,T2: T_Elem)return Boolean is <>;
   with procedure Imprime(X: in T_Elem);

package ListeGen is
   --Implementation d'une structure de données de type liste
   --doublement chainée avec structure de controle(les modifications sont en cours).
   --Les elements stockées par la liste sont de type generiques

   type T_Liste is private;
   ListeVideException: exception;
   Elt_Inexistant: Exception;

   function Valeur(L: T_Liste) return T_Elem;
   --Renvoie l'element contenu dans L
   --Declenche une ListeVideException si L est null

   function Suivant(L: T_Liste) return T_Liste;
   --Renvoie le suivant de L si il existe
   --Declenche une ListeVideException si L est null ou si son suivant est null

   function Precedent(L: T_Liste) return T_Liste;
   --Renvoie le precedent de L si il existe
   --Declenche une ListeVideException si L est null ou si son precedent est null

   function CreerListe return T_Liste;
   --Crée une liste vide

   function EstVide(L: T_Liste) return Boolean;
   --Teste la vacuité de la liste L, vrai si elle est vide, faux sinon

   procedure Affiche(L: in T_Liste);
   --Affiche la liste dans la console
   --Utilise Imprime qui est genric

   procedure AjoutFin(L: in out T_Liste;X: in T_Elem);
   --Ajoute l'element à la fin de la liste L

   function Premier(L: T_Liste) return T_Elem;
   --Renvoie la valeur(de type Entier) du premier element de L
   --erreur dans le cas de la liste vide

   procedure Supprimer(L: in out T_Liste;X: in T_Elem);
   --Supprime la premiere occurence de X dans la liste L
   --n'a aucun effet dans le cas d'une liste vide

   generic
      with function ">"(T1,T2: T_Elem)return Boolean is <>;
      with function "<"(T1,T2: T_Elem)return Boolean is <>;
   function CopieTriee(L: T_Liste) return T_Liste;
   --Fonction qui renvoit une deuxieme liste L2 qui contient
   --les memes elements que L mais trié par ordre croissant
   --La fonction apelle la procedure décrite ci dessous
   --
   --procedure InsererTriee(L: in out T_Liste;X: in T_Elem);
   --L est triée par ordre croissant
   --Insere X dans L de maniere a conserver le tri de L

   --Fonction a modifier de maniere generique
   --procedure Fusion(L: in out T_Liste; m1,m2: T_Mot);
   --Fusionne m2 dans m1 en supprimant m2 et augmentant l'occurence de m1

private
   type Cellule;
   type T_Liste is access Cellule;
   type Cellule is record
      Val: T_Elem;
      Prec: T_Liste;
      Suiv: T_Liste;
   end record;

end ListeGen;
