package MonitorCorda is

   protected type Corda is
      entry goSud(idx: in Integer);
      entry goNord(idx: in Integer);

   private
      capacitatCorda: Integer :=3;
      babuinsALaCordaN: Integer:=0;
      babuinsALaCordaS: Integer:=0;
   end Corda;

end MonitorCorda;
