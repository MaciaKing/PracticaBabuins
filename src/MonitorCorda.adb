with Ada.Text_IO;
use Ada.Text_IO;

package body MonitorCorda is

   protected body Corda is
      --Aquí entren els babuins del Nord
      entry goSud when ((babuinsALaCordaN<CAPACITAT) and babuinsALaCordaS=0) is
      begin
         babuinsALaCordaN:=babuinsALaCordaN+1;
         Put_Line("***** A la corda n'hi ha " & babuinsALaCordaN'Img & " direcció Sud. *****");
      end goSud;

      --Aquí entren els babuins del Nord
      procedure arriveSud is
      begin
         babuinsALaCordaN:=babuinsALaCordaN-1;
      end arriveSud;

      --Aqui entren els babuins del Sud
      entry goNord when ((babuinsALaCordaS<CAPACITAT) and babuinsALaCordaN=0) is
      begin
         babuinsALaCordaS:=babuinsALaCordaS+1;
         Put_Line("++++++ A la corda n'hi ha " & babuinsALaCordaS'Img & " direcció Nord. ++++++");
      end goNord;

      --Aqui entren els babuins del Sud
      procedure arriveNord  is
      begin
         babuinsALaCordaS:=babuinsALaCordaS-1;
      end arriveNord;
   end Corda;

end MonitorCorda;
