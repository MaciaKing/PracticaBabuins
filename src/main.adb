with Ada.Text_IO;
use Ada.Text_IO;
with MonitorCorda;
use MonitorCorda;

procedure Main is

   c: corda;

   task type babuiNord is
      entry Start(Idx: in Integer);
   end babuiNord;

   task body babuiNord is
      My_Idx:Integer;
   begin
      accept Start (Idx : in Integer) do
         My_Idx:= Idx;
      end Start;
      c.goSud(My_Idx);
   end babuiNord;


   task type babuiSud is
      entry Start(Idx: in Integer);
   end babuiSud;

   task body babuiSud is
      My_Idx:Integer;
   begin
      accept Start (Idx : in Integer) do
         My_Idx:= Idx;
      end Start;
      C.entraCorda(
      c.goNord(My_Idx);
   end babuiSud;

   --Variables globals
   type tbabuiNord is array (0..3) of babuiNord;
   type tbabuiSud is array (0..3) of babuiSud;
   babuinsNord: tbabuiNord;
   babuinsSud: tbabuiSud;
begin
   for idx in 0..3-1 loop
       Put_Line ("BON DIA som el babuí nord " & idx'Img & " vaig cap el Sud" );
       babuinsNord(idx).Start(idx);
   end loop;

   for idx in 0..3-1 loop
       Put_Line ("/t BON DIA som el babuí sud " & idx'Img & " vaig cap el Nord" );
       babuinsSud(idx).Start(idx);
   end loop;

end Main;
