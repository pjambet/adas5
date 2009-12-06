with Ada.Unchecked_Deallocation;
package Liste is
   --On utilise ici une liste pour representer les couples resultant de l'analyse
   --du texte

   --A modifier, pour le moment c'est une liste d'entier
   type T_Liste is private;
   Liste_Vide: exception;

   --procedure Liberer is new Ada.Unchecked_Deallocation(Cellule,T_Liste);
   --crée une procedure de liberation d'espace pour les objets
   --désignés par une liste

   function CreerListe return T_Liste;
   --Crée une liste vide

   function EstVide(L: T_Liste) return Boolean;
   --Teste la vacuité de la liste L, vrai si elle est vide, faux sinon

   procedure Affiche(L: in T_Liste);
   --Affiche la liste dans la console

   procedure AjoutDebut(L: in out T_Liste;X: in Integer);
   --Ajoute l'entier X avant le premier element de la liste L

   procedure AjoutFin(L: in out T_Liste;X: in Integer);
   --Ajoute l'entier X apres le dernier element de la liste L

   function Premier(L: T_Liste) return Integer;
   --Renvoie la valeur(de type Entier) du premier element de L
   --erreur dans le cas de la liste vide

   function Dernier(L: T_Liste) return Integer;
   --Renvoie la valeur(de type Entier) du dernier element de L
   --erreyr dans le cas de la liste vide

   function NbOcc(L: T_Liste;X: Integer) return Integer;
   --Renvoie le nombre d'occurence de X dans L
   --renvoie 0 dans le cas d'une liste vide

   procedure InsererAvant(L: in out T_Liste;X: in Integer;Y: Integer);
   --Insere l'element X directement avant l'element Y dans la liste L
   --erreur si Y n'est pas dans L

   procedure InsererApres(L: in out T_Liste;X: in Integer;Y: Integer);
   --Insere l'element X directement apres l'element Y dans la liste L
   --erreur si Y n'est pas dans L

   procedure Supprimer(L: in out T_Liste;X: in Integer);
   --Supprime la premiere occurence de X dans la liste L
   --n'a aucun effet dans le cas d'une liste vide

   procedure SupprimerTout(L: in out T_Liste;X: in Integer);
   --Supprime toutes les occurences de X dans la liste L
   --n'a aucun effet sur une liste vide

   function Index(L: T_Liste;X: Integer) return Integer;
   --Renvoie l'indice de la premiere occurende de l'element X de la liste L
   --L'indexage commence a partir de 0

   function EltInd(L: T_Liste;X: Integer) return Integer;
   --Renvoie l'element se trouvant a l'index X de la liste L
   --L'indexage commence a partir de 0

   procedure RetireInd(L: in out T_Liste;X: in Integer);
   --Retire de la liste l'element se trouvant a l'indice X

   function EtendListe(L1: T_Liste;L2: T_Liste)return T_Liste;
   --Concatene les listes L et P
   --En sortie on obtient L = [L,P]

   Procedure CopieTriee(L: in out T_Liste);
   --Modifie la liste L de maniere a ce que tous ses elements soient triés
   --de maniere croissante
   --L'algorithme de trie utilisé ici est l'algorithme de tri par insertion
   --On considere une portion de la liste triée:
   --On prend un element et on l'insere a sa place dans la portion triée

   procedure CopieTrieeR(L: in out T_Liste);
   --Procedure identique a CopieTriee sauf que le tri est
   --effectuée de maniere recursive

   function CopieInverse(L: T_Liste)return T_Liste;
   --Modifie L de maniere a ce que tous les elements soient dans l'ordre
   --inverse par rapport a la liste originale

private
   type Cellule;
   type T_Liste is access Cellule;
   type Cellule is record
      Val: Integer;
      Prec: T_Liste;
      Suiv: T_Liste;
   end record;

end Liste;
