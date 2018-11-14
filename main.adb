with State; use State;
with Monitor;
with Controller;

with Ada.Text_IO;

procedure Main is
   
begin
   Current_Speed := 40;
   Current_Signal := Signal_None;
   Current_Action := Normal;
   while True loop
      Monitor.Monitor_Article_22_1;
      if Monitor.Violation then
         Reduced_Mode := True;
         Ada.Text_IO.Put_Line ("violation detected, activating reduced mode");
      end if;
      Controller.Main;
      Ada.Text_IO.Put_Line ("Current_Speed: " & Current_Speed'Img);
      delay 0.5;
      exit when Current_Speed = 0;
     end loop;
end Main;
