package body Monitor is
   
   procedure Monitor_Article_53 is
   begin
      if Current_Action = Turn_Left then
         Violation := Current_Signal /= Signal_Left;
      elsif Current_Action = Turn_Right then
         Violation := Current_Signal /= Signal_Right;
      elsif Current_Action = Change_Left then
         Violation := Current_Signal /= Signal_Left;
      elsif Current_Action = Change_Right then
         Violation := Current_Signal /= Signal_Right;
      elsif Current_Action = Slow_Drive then
         Violation := Current_Signal /= Signal_Both;
      else -- Current_Action = Normal
         Violation := Violation or else Current_Signal /= Signal_None;
      end if;
   end Monitor_Article_53;
   
   procedure Monitor_Article_22_1 is
   begin
      if Specified_Speed_Limit_Perceived then
         Violation := Current_Speed > Perceived_Speed_Limit;
      else
         Violation := Current_Speed > Max_Speed_Limit;
      end if;
   end Monitor_Article_22_1;
   
end Monitor;
