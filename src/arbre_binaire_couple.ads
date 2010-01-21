with Arbre_Binaire, Couple;
use Couple;
package Arbre_Binaire_Couple is
   --instanciation du paquetage Arbre_Binaire
   package AB is new Arbre_Binaire(T_Elem => T_Couple,
                                   Imprime => Imprime_Couple,
                                   ">" => Superieur_Couple_Lex,
                                   "=" => Egale_Couple_Lex,
                                   "<" => Inferieur_Couple_Lex);
      
   use AB;
   subtype TABR_Couple is AB.T_ABR;
   
   procedure Traitement_Doublon_Couple(A: in out Tabr_Couple);
   --Gere les actions a executer en cas de doublon dans l'arbre 
   --Quand on tombe sur un doublon, on increment le NbOcc1 du Triplet   

   procedure Affiche_Couple(A: in TABR_Couple);

   procedure Affiche_Post is new Postfixe(Traitement => Affiche_Couple); 
   
   procedure Inserer_ABR_Couple is new Inserer_ABR(Superieur_Couple_Lex,
                                                   Egale_Couple_Lex,
                                                   Inferieur_Couple_Lex,
                                                   Traitement_Doublon_couple);
   procedure Inserer_ARN_Triplet is new Inserer_ARN(Superieur_Couple_Lex,
                                                   Egale_couple_Lex,
                                                   Inferieur_Couple_Lex,
                                                   Traitement_Doublon_Couple);
   
      
end Arbre_Binaire_Couple;
