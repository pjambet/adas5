with Listegen;
with Es_Simples;use Es_Simples;
procedure Testgen is
   --On teste notre LDC avec la genericité

   ---------------------------------------
   --Declaratiion des fonctions generiques
   procedure Imprime_Entier(X: in Integer)is
   begin
      Put(X,0);
   end Imprime_entier;

   function ">"(x: integer;y: integer) return boolean is
   begin
      return x>y;
   end ">";

   function "<"(x: integer;y: integer) return boolean is
   begin
      return X<y;
   end "<";
   ---------------------------------------
   --------------------------------------

   --instanciation des paquetages
   package Liste_int is new Listegen(T_Elem => Integer,Imprime => Put);
   package Liste_Float is new Listegen(T_Elem => Float,Imprime => Put);
   ------------------------------

   --utilisation des listes
   use Liste_Float;
   use Liste_Int;

   --declaration des sous types
   subtype Tlist_Float is Liste_Float.T_Liste;
   subtype Tlist_Int is Liste_Int.T_Liste;


   function copie1 is new Liste_Int.CopieTriee(">","<");

   LgenFloat : Tlist_Float;
   LGenInt : Tlist_Int;
   LgenTriee : Tlist_Int;

begin
   LgenInt := Creerliste;
   AjoutFin(LgenInt,3);
   AjoutFin(LgenInt,4);
   AjoutFin(LgenInt,5);
   AjoutDebut(LgenInt,0);
   Affiche(LgenInt);
   AjoutDebut(LGenInt,6);
   AjoutDebut(LGenInt,22);
   AjoutDebut(LGenInt,22);
   AjoutDebut(LGenInt,22);
   AjoutDebut(LGenInt,22);
   AjoutFin(LGenInt,65);
   Affiche(LGenInt);
   Put(Premier(LGenInt));New_Line;
   Put(Dernier(LGenInt));
   Put(NbOcc(LGenInt,22));
   InsererApres(Lgenint,99,65);
   --Declenche une erreur de segmentation
   --Lgentriee := Copie1(LGenInt);
   New_Line;
   Affiche(Lgenint);


end Testgen;
