with State;     use State;
with Constants; use Constants;

package Monitor with SPARK_Mode Is
   
   function Required_Signal (A : Action_Type) return Signal_Type is
      (case A is
         when Normal                    => Signal_None,
         when Turn_Left  | Change_Left  => Signal_Left,
         when Turn_Right | Change_Right => Signal_Right,
         when Slow_Drive                => Signal_Both);
      
    
   function Article_53_Regulation return Boolean is
      (Current_Signal = Required_Signal (Current_Action));
      
   Violation : Boolean;
   
   
   function Article_53_Requirement return Boolean is
      (Violation = not (Article_53_Regulation));
      
   function Article_22_1_Requirement return Boolean is
      (if Specified_Speed_Limit_Perceived then
        Violation = (Current_Speed > Perceived_Speed_Limit)
      else Violation = (Current_Speed > Max_Speed_Limit));
       
   procedure Monitor_Article_53
     with Post => (Article_53_Requirement);
   
   procedure Monitor_Article_22_1
     with Post => (Article_22_1_Requirement);
end Monitor;
