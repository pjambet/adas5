with Ada.Text_IO;
use Ada.Text_IO;

package body Analyse_Lexicale is

   function CaractereAutorise (C : in Character) return Boolean is
      -- Renvoit vrai si le caractere est autorise en tant que caractere d'un mot, faux sinon
   begin
      if C = Character'Val(32) then -- ' '
         return False;
      elsif C = Character'Val(33) then -- '!'
         return False;
      elsif C = Character'Val(34) then -- '"'
         return False;
      elsif C = Character'Val(35) then -- '#'
         return False;
      elsif C = Character'Val(36) then -- '$'
         return False;
      elsif C = Character'Val(37) then -- '%'
         return False;
      elsif C = Character'Val(38) then -- '&'
         return False;
      elsif C = Character'Val(40) then -- '('
         return False;
      elsif C = Character'Val(41) then -- ')'
         return False;
      elsif C = Character'Val(42) then -- '*'
         return False;
      elsif C = Character'Val(43) then -- '+'
         return False;
      elsif C = Character'Val(44) then -- ','
         return False;
      elsif C = Character'Val(46) then -- '.'
         return False;
      elsif C = Character'Val(47) then -- '/'
         return False;
      elsif C = Character'Val(58) then -- ':'
         return False;
      elsif C = Character'Val(59) then -- ';'
         return False;
      elsif C = Character'Val(60) then -- '<'
         return False;
      elsif C = Character'Val(61) then -- '='
         return False;
      elsif C = Character'Val(62) then -- '>'
         return False;
      elsif C = Character'Val(63) then -- '?'
         return False;
      elsif C = Character'Val(64) then -- '@'
         return False;
      elsif C = Character'Val(91) then -- '['
         return False;
      elsif C = Character'Val(92) then -- '\'
         return False;
      elsif C = Character'Val(93) then -- ']'
         return False;
      elsif C = Character'Val(94) then -- '^'
         return False;
      elsif C = Character'Val(95) then -- '_'
         return False;
      elsif C = Character'Val(96) then -- '`'
         return False;
      elsif C = Character'Val(10) then -- LF
         return False;
      elsif C = Character'Val(13) then -- CR
         return False;
      else
         return True;
      end if;
   end;

   function Existe (Name : in String) return Boolean is
      File : File_Type;
   begin
      Open(File, In_File, Name);
      Close(File);
      return True;
   exception
      when Name_Error =>
         return False;
      when others =>
         raise;
   end Existe;

end Analyse_Lexicale;
