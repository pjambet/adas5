with Text_Io; use Text_Io;
package body Es_Simples is
   package Entier_Io is new Integer_Io(Integer);
   package Reel_Io is new Float_Io(Float);
   procedure Put (X: Integer) is
   begin
      Entier_Io.Put(X);
   end;
   procedure Put (X: Float) is
   begin
      Reel_Io.Put(X);
   end;
   procedure Put (X:Character) is
   begin
      Text_Io.Put(X);
   end;
   procedure Put(X: Integer; Largeur:Natural) is
   begin
      Entier_Io.Put(X,Largeur);
   end;
   procedure Put (X: String) is
   begin
      Text_Io.Put(X);
   end;
   procedure Put_line (X: String) is
   begin
      Text_Io.Put_line(X);
   end;
   procedure New_line  is
   begin
      Text_Io.New_line;
   end;
   procedure Skip_Line is
   begin
      Text_Io.Skip_Line;
   end;
   procedure Get (X: out Integer) is
   begin
      Entier_Io.Get(X);
   end;
   procedure Get (X: out Float) is
   begin
      Reel_Io.Get(X);
   end;
   procedure Get (X: out Character) is
   begin
      text_Io.Get(X);
   end;
   procedure Get_Line (S: out String; Last : out Natural) is
   begin
      Text_Io.Get_Line(S,Last);
   end;

end Es_Simples;
