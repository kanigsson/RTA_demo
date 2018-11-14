package State is
   
   type Action_Type is
     (Normal, Turn_Left, Turn_Right, Slow_Drive, Change_Left, Change_Right);
   
   type Signal_Type is (Signal_None, Signal_Left, Signal_Right, Signal_Both);
   
   Current_Signal : Signal_Type;
   Current_Action : Action_Type;
   Current_Speed : Integer;
   
   Reduced_Mode : Boolean;

end State;
