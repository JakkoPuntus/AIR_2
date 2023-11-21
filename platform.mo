model platform
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


  dd_eps dd_eps1 annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -15}, {15, 10}}, rotation = 0)));
  dd_eps_turn dd_eps_turn1 annotation(
    Placement(visible = true, transformation(origin = {-14, 10}, extent = {{-10, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(dd_eps1.e_dst, dd_eps_turn1.p_set) annotation(
    Line(points = {{-56, 16}, {-24, 16}}, color = {0, 0, 127}));
  connect(dd_eps1.e_head, dd_eps_turn1.h_set) annotation(
    Line(points = {{-56, -2}, {-36, -2}, {-36, 6}, {-22, 6}}, color = {0, 0, 127}));
annotation(
    uses(Modelica(version = "4.0.0")));
end platform;
