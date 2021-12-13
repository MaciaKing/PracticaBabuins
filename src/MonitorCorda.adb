with Ada.Text_IO;
use Ada.Text_IO;

package body MonitorCorda is

   protected body Corda is

      entry goSud(idx:in Integer) when ((babuinsALaCordaN<capacitatCorda) and babuinsALaCordaS=0) is
      begin
         babuinsALaCordaN:=babuinsALaCordaN+1;
         Put_Line("***** A la corda n'hi ha " & babuinsALaCordaN'Img & " direcció Sud. *****");
         Put_Line ("Nord " & idx'Img & ": És a la corda i travessa cap al Sud");
         --SC
         --Es a la corda
         delay 5.0;
         --Arriba al sud
         babuinsALaCordaN:=babuinsALaCordaN-1;
         Put_Line ("Nord " & idx'Img & ": ha arribat a la vorera");

      end goSud;

      entry goNord(idx:in Integer) when ((babuinsALaCordaS<capacitatCorda) and babuinsALaCordaN=0) is
      begin
         babuinsALaCordaS:=babuinsALaCordaS+1;
         Put_Line("***** A la corda n'hi ha " & babuinsALaCordaS'Img & " direcció Nord. ******");
         Put_Line ("/t Sud " & idx'Img & ": És a la corda i travessa cap al Nord");
         --SC
         --Es a la corda
         delay 5.0;
         --Arriba al nord
         babuinsALaCordaS:=babuinsALaCordaS-1;
         Put_Line ("/t Sud " & idx'Img & ": ha arribat a la vorera");
      end goNord;


   end Corda;

end MonitorCorda;
