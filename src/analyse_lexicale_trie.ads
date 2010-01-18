with Trie;
use Trie;

package Analyse_Lexicale_Trie is --Package permettant d'analyser le texte et d'effectuer les requetes dessus

   procedure Query_Trie(T : in out T_Trie; NomFic : in String);
   --Renvoit un trie comprenant tous les mots et occurences du texte

--   function Query_NbOcc(T : T_Trie; M : String) return Integer;
--   Requete renvoyant le nombre d'occurence du mot m dans le texte

--   procedure Query_NbPref(T : in T_Trie; S : in String; NbMot : out Integer; NbOcc : out Integer);
--   Requete renvoyant le nombre de mot ayant s pour préfixe et le nombre d'occurence de s (Appel de query_NbOcc(s))

--   procedure Query_NbSuff(T : in T_Trie; S : in String; NbMot : out Integer; NbOcc : out Integer);
--   Requete renvoyant le nombre de mot ayant s pour suffixe et le nombre d'occurence de s (Appel de query_NbOcc(s))

--   procedure Query_NbFact(T : in T_Trie; S : in String; NbMot : out Integer; NbOcc : out Integer);
--   Requete renvoyant le nombre de mot ayant s pour facteur et le nombre d'occurence de s (Appel de query_NbOcc(s))

--   procedure Creer_Fichier_Trie(T : in T_Trie);
--   --Procedure qui crée le fichier "liste-mot.txt" a partir du trie T
--   --Le fichier créé est de la forme suivante
--   --Mot1 Nbocc1
--   --Mot2 NbOcc2

--   procedure Ecriture_Dest(T : in T_Trie; Dest : in File_Type);
   
   procedure Recup_Trie(T : in out T_Trie);
   --procedure qui recrée le trie a partir du fichier "liste-mot.txt"
   --le fichier n'est pas passé en parametre car il sera créé auparavant par la fonction Creer_Fichier_Listemot
   --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
   --declenche une exception si le fichier n'existe pas

end Analyse_Lexicale_Trie;
