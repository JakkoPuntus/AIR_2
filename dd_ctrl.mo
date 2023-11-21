model dd_ctrl
parameter Real xs=30;
 parameter Real ys=30;
 parameter Real Ke=24/(2*3.14);
 parameter Real R=0.1;
 parameter Real L=0.2;
 parameter Real Tm=0.1;
 parameter Real Tj=0.01;
 parameter Real Kp=Tm*Ke/Tj;
 parameter Real Ki=Ke/Tj;
 parameter Real Kd=10;
 parameter Real Kh=100;
 annotation(
    uses(Modelica(version = "4.0.0")));

end dd_ctrl;
