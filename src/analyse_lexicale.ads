WITH Liste_Couple;
USE Liste_Couple;

PACKAGE Analyse_Lexicale IS
   --Package permettant d'analyser le texte et d'effectuer les requetes dessus

   --utilisation de la liste generique
   USE Liste_Couple.L;

   FUNCTION CaractereAutorise (
         C : IN     Character)
     RETURN Boolean;

   PROCEDURE Query_Liste_Couple (
         L      : IN OUT TListe_Couple;
         NomFic : IN     String);
   --Renvoit une liste comprenant tous les couples(mot;occurence) du texte, la
   --liste est triée par ordre alphabetique
   --
   --je pense qu'il faudrait faire qu'on parcourt tout le texte
   --et qu'a chaque mot trouvé on l'insere de maniere triéee dans la liste qu'on renvoit
   --si on le trouve dans la liste alors on fait juste augmenter le nbOcc

   FUNCTION Query_NbOcc (
         L : TListe_Couple;
         M : String)
     RETURN Integer;
   --Requete renvoyant le nombre d'occurence du mot m dans le texte

   PROCEDURE Query_NbPref (
         L     : IN     TListe_Couple;
         S     : IN     String;
         NbMot :    OUT Integer;
         NbOcc :    OUT Integer);
   --Requete renvoyant le nombre de mot ayant s pour préfixe et le nombre d'occurence de s (Appel de query_NbOcc(s))

   PROCEDURE Query_NbSuff (
         L     : IN     TListe_Couple;
         S     : IN     String;
         NbMot :    OUT Integer;
         NbOcc :    OUT Integer);
   --Requete renvoyant le nombre de mot ayant s pour suffixe et le nombre d'occurence de s      (Appel de query_NbOcc(s))

   PROCEDURE Query_NbFact (
         L     : IN     TListe_Couple;
         S     : IN     String;
         NbMot :    OUT Integer;
         NbOcc :    OUT Integer);
   --Requete renvoyant le nombre de mot ayant s pour facteur et le nombre d'occurence de s (Appel de query_NbOcc(s))

   PROCEDURE Creer_Fichier_Listemot (
         L : IN     TListe_Couple);
   --Procedure qui crée le fichier listeMot a partir de la liste de couple l
   --Le Fichier créé est de la forme suivante
   ------------------------------------------
   --Mot1 Nbocc1
   --Mot2 NbOcc2
   --etc ...
   ------------------------------------------

   FUNCTION Existe (
         Name : IN     String)
     RETURN Boolean;

   PROCEDURE Recup_Liste (
         L : IN OUT TListe_Couple);
   --procedure qui recrée la liste de couple a partir du fichier "liste-mot.txt"
   --le fichier n'est pas passé en parametre car il sera créé auparavant par la fonction Creer_Fichier_Listemot
   --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
   --declenche une exception si le fichier n'existe pas

END Analyse_Lexicale;

