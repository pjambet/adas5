with Es_Simples;use Es_Simples;
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
   
   function CreerListe return T_Liste;
   --Crée une liste vide

   function EstVide(L: T_Liste) return Boolean;
   --Teste la vacuité de la liste L, vrai si elle est vide, faux sinon

   procedure Affiche(L: in T_Liste);
   --Affiche la liste dans la console
   --Utilise Imprime qui est genric

   procedure AjoutDebut(L: in out T_Liste;X: in T_Elem);
   --Ajoute l'entier X avant le premier element de la liste L

   procedure AjoutFin(L: in out T_Liste;X: in T_Elem);
   --Ajoute l'entier X apres le dernier element de la liste L

   function Premier(L: T_Liste) return T_Elem;
   --Renvoie la valeur(de type Entier) du premier element de L
   --erreur dans le cas de la liste vide

   function Dernier(L: T_Liste) return T_Elem;
   --Renvoie la valeur(de type Entier) du dernier element de L
   --erreyr dans le cas de la liste vide

   function NbOcc(L: T_Liste;X: T_Elem) return Integer;
   --Renvoie le nombre d'occurence de X dans L
   --renvoie 0 dans le cas d'une liste vide

   procedure InsererAvant(L: in out T_Liste;X: in T_Elem;Y: T_Elem);
   --Insere l'element X directement avant l'element Y dans la liste L
   --erreur si Y n'est pas dans L

   procedure InsererApres(L: in out T_Liste;X: in T_Elem;Y: T_Elem);
   --Insere l'element X directement apres l'element Y dans la liste L
   --erreur si Y n'est pas dans L

   procedure Supprimer(L: in out T_Liste;X: in T_Elem);
   --Supprime la premiere occurence de X dans la liste L
   --n'a aucun effet dans le cas d'une liste vide

   procedure SupprimerTout(L: in out T_Liste;X: in T_Elem);
   --Supprime toutes les occurences de X dans la liste L
   --n'a aucun effet sur une liste vide

   function Index(L: T_Liste;X: T_Elem) return Integer;
   --Renvoie l'indice de la premiere occurende de l'element X de la liste L
   --L'indexage commence a partir de 0

   function EltInd(L: T_Liste;X: Integer) return T_Elem;
   --Renvoie l'element se trouvant a l'index X de la liste L
   --L'indexage commence a partir de 0

   procedure RetireInd(L: in out T_Liste;X: in Integer);
   --Retire de la liste l'element se trouvant a l'indice X

   function EtendListe(L1: T_Liste;L2: T_Liste)return T_Liste;
   --Concatene les listes L et P
   --En sortie on obtient L = [L,P]
   
      
   function CopieTriee(L: T_Liste) return T_Liste;
   --Fonction qui renvoit une deuxieme liste L2 qui contient
   --les memes elements que L mais trié par ordre croissant

   procedure InsererTriee(L: in out T_Liste;X: in T_Elem);
   --L est triée par ordre croissant
   --Insere X dans L de maniere a conserver le tri de L

   
   Procedure CopieTrieeModif_It(L: in out T_Liste);
   --Modifie la liste L de maniere a ce que tous ses elements soient triés
   --de maniere croissante
   --L'algorithme de trie utilisé ici est l'algorithme de tri par insertion
   --On considere une portion de la liste triée:
   --On prend un element et on l'insere a sa place dans la portion triée

   procedure CopieTrieeModif_Rec(L: in out T_Liste);
   --Procedure identique a CopieTriee sauf que le tri est
   --effectuée de maniere recursive

   function CopieInverse(L: T_Liste)return T_Liste;
   --Modifie L de maniere a ce que tous les elements soient dans l'ordre
   --inverse par rapport a la liste originale
   
   
   
private
   type Cellule;
   type T_Liste is access Cellule;
   type Cellule is record
      Val: T_Elem;
      Prec: T_Liste;
      Suiv: T_Liste;
   end record;

end ListeGen;
