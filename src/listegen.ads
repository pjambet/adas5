with Ada.Text_Io; use Ada.Text_Io;
with Mot; use Mot;
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

   function Get_Suiv(L: T_Liste) return T_Liste;
   --Renvoie le suivant de L si il existe
   --Declenche une ListeVideException si L est null ou si son suivant est null

   function Get_List

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

   procedure Tri_Gen(L: in out T_Liste);
   --Tri la liste

   procedure Fusion(L: in out T_Liste; m1,m2: T_Mot);
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
