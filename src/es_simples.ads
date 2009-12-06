
package Es_Simples is

   -- les procedures qui suivent permettent d'afficher :
   -- un entier, un reel, une chaine
   procedure Put (X:Float); -- un flottant
   procedure Put (X:character); -- un caractère
   procedure Put (X:Integer); -- un entier
   procedure Put(X: Integer; Largeur:Natural);
   -- affiche l'entier sur Largeur caractères si le nb de chiffres de l'entier +1
   -- est inférieur ou égal à Largeur, sinon a le meme effet que le premier put
   procedure Put (X:String); -- une chaîne
   -- procedure permettant d'afficher une chaine, puis de passer
   -- a la ligne
   procedure Put_Line (X: String); -- affiche une chaîne puis passe à la ligne

   procedure New_Line; -- passe à la ligne

   procedure Skip_Line;

   -- procedures permettant de saisir :
   procedure Get (X: out Integer); -- un entier
   procedure Get (X: out Float); -- un flottant
   procedure Get (X: out Character); -- un caractère

   -- procedure permettant de saisir une chaine S; la saisie est
   -- terminée quand la fin de la ligne est rencontrée (frappe d'un return)
   -- ou quand le tableau de caractères paramètre effectif de l'appel est plein
   -- Last retourne le nombre de caractères effectivement lus.
   procedure Get_Line (S: out String; Last : out Natural);

end Es_Simples;
