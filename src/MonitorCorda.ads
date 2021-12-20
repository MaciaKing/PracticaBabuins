package MonitorCorda is

   protected type Corda is
      entry goSud;
      entry goNord;
      procedure arriveNord;
      procedure arriveSud;

   private
      CAPACITAT: Integer :=3; --Indica la quantitat màxima de babuins a la corda
      babuinsALaCordaN: Integer:=0; -- Indica la quantitat de babuins a la corda que van cap al Nord
      babuinsALaCordaS: Integer:=0; -- Indica la quantitat de babuins a la corda que van cap al Sud
   end Corda;

end MonitorCorda;
