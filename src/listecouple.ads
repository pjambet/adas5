with Listegen;
with Mot;use Mot;
package Listecouple is

   -----------------------------------------------------------------
   --instanciation du paquetage Listegen
   package Liste_Couple is new ListeGen(T_Elem => Couple,Imprime => Imprime_Couple );

   --utilisation de la liste instancié
   use Liste_Couple;

   subtype TListe_Couple is Liste_Couple.T_Liste;

   --on declarera la fonction de tri apres ici

   -----------------------------------------------------------------
   -----------------------------------------------------------------
end ListeCouple;
