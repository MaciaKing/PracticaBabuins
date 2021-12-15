package MonitorCorda is

   protected type Corda is
      entry goSud(idx: in Integer);
      entry goNord(idx: in Integer);
      entry entraCorda;
      entry surtCorda;

   private
      CAPACITAT: Integer :=3; --Indica la quantitat màxima de babuins a la corda
      babuinsALaCordaN: Integer:=0;
      babuinsALaCordaS: Integer:=0;
   end Corda;

end MonitorCorda;
