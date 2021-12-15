with Ada.Text_IO;
use Ada.Text_IO;

package body MonitorCorda is

   protected body Corda is

      entry goSud(idx:in Integer) when ((babuinsALaCordaN<capacitatCorda) and babuinsALaCordaS=0) is
      begin
         babuinsALaCordaN:=babuinsALaCordaN+1;
         Put_Line("***** A la corda n'hi ha " & babuinsALaCordaN'Img & " direcci� Sud. *****");
         Put_Line ("Nord " & idx'Img & ": �s a la corda i travessa cap al Sud");

         babuinsALaCordaN:=babuinsALaCordaN-1;
         Put_Line ("Nord " & idx'Img & ": ha arribat a la vorera");

      end goSud;

      entry goNord(idx:in Integer) when ((babuinsALaCordaS<capacitatCorda) and babuinsALaCordaN=0) is
      begin
         babuinsALaCordaS:=babuinsALaCordaS+1;
         Put_Line("***** A la corda n'hi ha " & babuinsALaCordaS'Img & " direcci� Nord. ******");
         Put_Line ("/t Sud " & idx'Img & ": �s a la corda i travessa cap al Nord");

         babuinsALaCordaS:=babuinsALaCordaS-1;
         Put_Line ("/t Sud " & idx'Img & ": ha arribat a la vorera");
      end goNord;

      entry entraCorda when  is
      begin
         null;
      end entraCorda;


      entry surtCorda when is
      begin
         null;
      end surtCorda;

   end Corda;

end MonitorCorda;
