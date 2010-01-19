with Listegen, Triplet;
use Triplet;

package Liste_Triplet is

   --instanciation du paquetage Listegen
   package LT is new ListeGen(T_Elem => T_Triplet,Imprime => Imprime_Triplet);
   --utilisation de la liste instancié
   use LT;
   --declaration su sous type
   subtype TListe_Triplet is LT.T_Liste;

   

   ------------------------------------------------------------------
   ---------INSTANCIATION DES FONCTIONS GENERIQUES-------------------
   procedure Modif_FusionTriplet(L : in out T_Liste; T1, T2 : in out T_Triplet);
   --Modifie L1 en y ajoutant les occurence de L2, L2 sera supprimé
   --mais cela sera fait dans la fonction Fusion definie dans listegen

   procedure Traitement_Doublon_Triplet_Txt1(L : in out TListe_Triplet);
   --Gere les actions a executer en cas de doublon dans la liste
   --Quand on tombe sur un doublon, on increment le NbOcc1 du Triplet

   procedure Traitement_Doublon_Triplet_Txt2(L : in out Tliste_Triplet);
   --Gere les actions a executer en cas de doublon dans la liste
   --Quand on tombe sur un doublon, on increment le NbOcc2 du Triplet

   procedure Traitement_Doublon_Triplet_Som(L : in out Tliste_Triplet);
   --Gere les actions a executer en cas de doublon dans la liste
   --Quand on tombe sur un doublon, on increment le NbOcc2 du Triplet

   procedure Fusion_Triplet is new LT.Fusion(Modif_FusionTriplet);

   ------TRI LEXICALE-------------------------------------------------
   procedure InsererTriee_Triplet_Lex_Txt1 is new LT.InsererTriee(Superieur_Triplet_Lex, Egale_Triplet_Lex, Inferieur_Triplet_Lex, Traitement_Doublon_Triplet_Txt1);
   function CopieTriee_Triplet_Lex_Txt1 is new LT.CopieTriee(InsererTriee_Triplet_Lex_Txt1);

   procedure InsererTriee_Triplet_Lex_Txt2 is new LT.InsererTriee(Superieur_Triplet_Lex, Egale_Triplet_Lex, Inferieur_Triplet_Lex, Traitement_Doublon_Triplet_Txt2);
   function CopieTriee_Triplet_Lex_Txt2 is new LT.CopieTriee(InsererTriee_Triplet_Lex_Txt2);

   -----TRI PAR OCCURENCE DU TEXTE 1----------------------------------
   procedure InsererTriee_Triplet_Occ1 is new LT.InsererTriee(Superieur_Triplet_Occ1, Egale_Triplet_Occ1, Inferieur_Triplet_Occ1, Traitement_Doublon_Triplet_Txt1);
   function CopieTriee_Triplet_Occ1 is new LT.CopieTriee(InsererTriee_Triplet_Occ1);

   -----TRI PAR OCCURENCE DU TEXTE 2----------------------------------
   procedure InsererTriee_Triplet_Occ2 is new LT.InsererTriee(Superieur_Triplet_Occ2, Egale_Triplet_Occ2, Inferieur_Triplet_Occ2, Traitement_Doublon_Triplet_Txt2);
   function CopieTriee_Triplet_Occ2 is new LT.CopieTriee(InsererTriee_Triplet_Occ2);

   -----TRI PAR SOMME DES OCCURENCES----------------------------------
   procedure InsererTriee_Triplet_OccS is new LT.InsererTriee(Superieur_Triplet_OccS, Egale_Triplet_OccS, Inferieur_Triplet_OccS, Traitement_Doublon_Triplet_Som);
   function CopieTriee_Triplet_OccS is new LT.CopieTriee(InsererTriee_Triplet_OccS);

end Liste_Triplet;
