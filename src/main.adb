with Ada.Text_IO;
use Ada.Text_IO;
with MonitorCorda;
use MonitorCorda;
with ada.numerics.discrete_random;


procedure Main is
   c: corda;

   procedure esperaRandom  is
    type randRange is new Integer range 1..10;
    package Rand_Int is new ada.numerics.discrete_random(randRange);
    use Rand_Int;
      gen: Generator;
      randV: randRange;
   begin
      reset(gen);
      randV:= random(gen);
      delay Duration(randV);
   end esperaRandom;

    procedure esperaVolta  is
    type randRange is new Integer range 10..20;
    package Rand_Int is new ada.numerics.discrete_random(randRange);
    use Rand_Int;
      gen: Generator;
      randV: randRange;
   begin
      reset(gen);
      randV:= random(gen);
      delay Duration(randV);
   end esperaVolta;


   task type babuiNord is
      entry Start(Idx: in Integer);
   end babuiNord;

   task body babuiNord is
      My_Idx:Integer;
   begin
      accept Start (Idx : in Integer) do
         My_Idx:= Idx;
      end Start;
      Put_Line ("BON DIA som el babuí nord " & My_Idx'Img & " vaig cap el Sud" );
      for i in 1..3 loop
         c.goSud;
         Put_Line ("NORD "& My_Idx'Img &": És a la corda i travessa cap al Sud");
         esperaRandom;--temps espera random demunt la corda
         c.arriveSud;
         Put_Line ("NORD "& My_Idx'Img &" ha arribat a la vorera");
         esperaVolta; --delay da la vuelta
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
      Put_Line ("     BON DIA som el babuí sud " & My_Idx'Img & " vaig cap el Nord" );
      for i in 1..3 loop
         c.goNord;
         Put_Line ("     SUD "& My_Idx'Img &": És a la corda i travessa cap al Nord");
         esperaRandom; --temps espera random demunt la corda
         c.arriveNord;
         Put_Line ("     SUD "& My_Idx'Img &" ha arribat a la vorera");
         esperaVolta;--delay da la vuelta
      end loop;
      Put_Line("     SUD "& My_Idx'Img &" Fa la volta 3 de 3 i acaba !!!!!");
   end babuiSud;

   --Variables globals
   type tbabuiNord is array (1..5) of babuiNord;
   type tbabuiSud is array (1..5) of babuiSud;
   babuinsNord: tbabuiNord;
   babuinsSud: tbabuiSud;
begin
   for idx in 1..5 loop
      babuinsNord(idx).Start(idx);
      babuinsSud(idx).Start(idx);
   end loop;
end Main;
