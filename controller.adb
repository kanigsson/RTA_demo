with State; use State;

package body Controller is
   
   procedure Reduced_Controller is
   begin
      if Current_Speed > 4 then
         Current_Speed := Current_Speed - 5;      
      else
         Current_Speed := 0;
      end if;
   end Reduced_Controller;
   
   procedure Normal_Controller is
   begin
      Current_Speed := Current_Speed + 1;            
   end Normal_Controller;
   
   procedure Main is
   begin
      if Reduced_Mode then
         Reduced_Controller;
      else
         Normal_Controller;
      end if;
   end Main;
end Controller;
