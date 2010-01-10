with Mot;use Mot;
with Couple;use Couple;
with Ada.Text_Io;use Ada.Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package Triplet is

        type T_Triplet is private;

        function From_Couple_to_Triplet(L1: TListe_Couple; L2 : TListe_Couple) return TListe_Triplet;
        --Crée

        procedure Imprime_Triplet(C: in T_Couple);
        --Definition de la fonction d'affichage d'un couple
        --Necessaire pour l'instanciation de la liste generique

        procedure Set_Mot(C: in out T_Couple; M: in T_Mot);
        --Modifie le mot de C en M
        --Get_Mot(Set_Mot(C,M))=M

        procedure Set_NbOcc1(C: in out T_Couple; E: in Integer);
        --Modifie la nbocc de C en E
        --Get_Nbocc(Set_NbOcc(C,E))=E

        procedure Set_NbOcc2(C: in out T_Couple; E: in Integer);
        --Modifie la nbocc de C en E
        --Get_Nbocc(Set_NbOcc(C,E))=E

        function Get_Mot(C: T_Couple) return T_Mot;
        --Renvoie le mot du couple C

        function Get_NbOcc1(C: T_Couple) return Integer;
        --Renvoie le nombre d'occurence du mot du Couple C

        function Get_NbOcc2(C: T_Couple) return Integer;
        --Renvoie le nombre d'occurence du mot du Couple C


private:
        type T_Triplet is record
                mot: T_Mot;
                nbOccTxt1: T_Mot;
                nbOccTxt2: T_Mot;
        end record;

end Triplet;
