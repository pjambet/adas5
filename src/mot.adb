package body mot is
   
   function Estmot(S: String)return Boolean is
   begin
      
   end;
   
   function EstMotSignificatif(T: T_Mot)return boolean is
   begin
      return EstLongMot(T) and then EstPetitMot(T) ;    
   end;
   
   function Estlongmot(T: T_Mot) return Boolean is
   begin
      return T'length > 3;
   end;
   
   function Estpetitmotimp(T: T_Mot) return Boolean is
   begin
      
   end;

   function Estsuffixede(T1: T_Mot;T2: T_Mot)return Boolean is
   begin
      
   end;
   
   function Estprefixede(T1: T_Mot;T2: T_Mot)return Boolean is
   begin
      
   end;
    
   function Estfacteurde(T1: T_Mot;T2: T_Mot)return Boolean is
   begin
      
   end;
   
end mot;
