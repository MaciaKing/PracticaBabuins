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
      for i in 1..3 loop
         c.goSud;
         Put_Line ("NORD "& My_Idx'Img &": És a la corda i travessa cap al Sud");
         delay 1.0;
         c.arriveSud;
         Put_Line ("NORD "& My_Idx'Img &" ha arribat a la vorera");
      end loop;
      Put_Line ("NORD "& My_Idx'Img &": Fa la volta 3 de 3 i acaba !!!!!!");
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
      for i in 1..3 loop
         c.goNord;
         Put_Line ("     SUD "& My_Idx'Img &": És a la corda i travessa cap al Nord");
         delay 1.0;
         c.arriveNord;
         Put_Line ("     SUD "& My_Idx'Img &" ha arribat a la vorera");
      end loop;
      Put_Line("     SUD "& My_Idx'Img &" Fa la volta 3 de 3 i acaba !!!!!");
   end babuiSud;

   --Variables globals
   type tbabuiNord is array (1..5) of babuiNord;
   type tbabuiSud is array (1..5) of babuiSud;
   babuinsNord: tbabuiNord;
   babuinsSud: tbabuiSud;
begin
   --Inicialitzam babuins del Nord
   for idx in 1..5 loop
       Put_Line ("BON DIA som el babuí nord " & idx'Img & " vaig cap el Sud" );
       babuinsNord(idx).Start(idx);
   end loop;
   --Inicialitzam babuins del Sud
   for idx in 1..5 loop
       Put_Line ("     BON DIA som el babuí sud " & idx'Img & " vaig cap el Nord" );
       babuinsSud(idx).Start(idx);
   end loop;

end Main;
