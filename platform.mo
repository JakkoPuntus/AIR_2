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
 parameter Real Kd=1;
 parameter Real Kh=100;


  dd_eps dd_eps1 annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -15}, {15, 10}}, rotation = 0)));
  dd_eps_turn dd_eps_turn1 annotation(
    Placement(visible = true, transformation(origin = {-14, 8}, extent = {{-10, -10}, {15, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = Kd)  annotation(
    Placement(visible = true, transformation(origin = {30, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Blocks.Math.Gain gain1(k = Kh)  annotation(
    Placement(transformation(origin = {30, 4}, extent = {{-10, -10}, {10, 10}})));
 transformation transformation1 annotation(
    Placement(transformation(origin = {76, 24}, extent = {{-10, -10}, {10, 10}})));
 Modelica.Blocks.Math.Feedback e_l annotation(
    Placement(transformation(origin = {126, 30}, extent = {{-10, 10}, {10, -10}})));
 Modelica.Blocks.Math.Feedback e_r annotation(
    Placement(visible = true, transformation(origin = {124, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 robot robot1 annotation(
    Placement(visible = true, transformation(origin = {204, 12}, extent = {{-10, -10}, {25, 10}}, rotation = 0)));
 Modelica.Blocks.Continuous.PI PI_l(T = Kp / Ki, k = Kp)  annotation(
    Placement(transformation(origin = {158, 30}, extent = {{-10, -10}, {10, 10}})));
 Modelica.Blocks.Continuous.PI PI_r(T = Kp / Ki, k = Kp)  annotation(
    Placement(visible = true, transformation(origin = {158, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 0; 2.5, 20; 5, 40; 7.5, 20; 10, 0])  annotation(
    Placement(visible = true, transformation(origin = {-110, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Blocks.Sources.TimeTable timeTable2(startTime = 0, table = [0, 0; 2.5, -20; 5, -40; 7.5, -20; 10, 0])  annotation(
    Placement(transformation(origin = {-110, 12}, extent = {{-10, -10}, {10, 10}})));
 Modelica.Blocks.Interaction.Show.RealValue realValue annotation(
    Placement(transformation(origin = {260, 26}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(dd_eps_turn1.h_out, gain1.u) annotation(
    Line(points = {{1, 5}, {10, 5}, {10, 4}, {18, 4}}, color = {0, 0, 127}));
  connect(dd_eps_turn1.p_out, gain.u) annotation(
    Line(points = {{-3, 14}, {8, 14}, {8, 42}, {18, 42}}, color = {0, 0, 127}));
  connect(dd_eps1.e_head, dd_eps_turn1.h_set) annotation(
    Line(points = {{-56, -2}, {-36, -2}, {-36, 4}, {-22, 4}}, color = {0, 0, 127}));
  connect(dd_eps1.e_dst, dd_eps_turn1.p_set) annotation(
    Line(points = {{-56, 16}, {-40, 16}, {-40, 14}, {-24, 14}}, color = {0, 0, 127}));
  connect(timeTable1.y, dd_eps1.x_set) annotation(
    Line(points = {{-98, 64}, {-94, 64}, {-94, 18}, {-82, 18}, {-82, 18}}, color = {0, 0, 127}));
  connect(PI_l.y, robot1.Ul) annotation(
    Line(points = {{169, 30}, {180, 30}, {180, 20}, {192, 20}}, color = {0, 0, 127}));
  connect(PI_r.y, robot1.Ur) annotation(
    Line(points = {{170, -8}, {182, -8}, {182, 6}, {192, 6}}, color = {0, 0, 127}));
  connect(e_l.y, PI_l.u) annotation(
    Line(points = {{135, 30}, {146, 30}}, color = {0, 0, 127}));
  connect(e_r.y, PI_r.u) annotation(
    Line(points = {{134, -8}, {146, -8}, {146, -8}, {146, -8}}, color = {0, 0, 127}));
  connect(gain1.y, transformation1.w_set) annotation(
    Line(points = {{41, 4}, {52, 4}, {52, 18}, {67, 18}}, color = {0, 0, 127}));
  connect(gain.y, transformation1.v_set) annotation(
    Line(points = {{42, 42}, {50, 42}, {50, 30}, {67, 30}}, color = {0, 0, 127}));
 connect(robot1.x_out, dd_eps1.x) annotation(
    Line(points = {{222, 18}, {264, 18}, {264, -102}, {-94, -102}, {-94, 6}, {-82, 6}}, color = {0, 0, 127}));
 connect(robot1.y_out, dd_eps1.y) annotation(
    Line(points = {{222, 10}, {254, 10}, {254, -94}, {-88, -94}, {-88, 0}, {-82, 0}}, color = {0, 0, 127}));
 connect(robot1.heading, dd_eps1.heading) annotation(
    Line(points = {{222, 6}, {240, 6}, {240, -86}, {-82, -86}, {-82, -4}}, color = {0, 0, 127}));
 connect(transformation1.vr, e_r.u1) annotation(
    Line(points = {{86, 18}, {92, 18}, {92, -8}, {116, -8}}, color = {0, 0, 127}));
 connect(transformation1.vl, e_l.u1) annotation(
    Line(points = {{86, 30}, {118, 30}}, color = {0, 0, 127}));
 connect(robot1.v, realValue.numberPort) annotation(
    Line(points = {{222, 14}, {229.25, 14}, {229.25, 26}, {248.5, 26}}, color = {0, 0, 127}));
 connect(dd_eps1.y_set, timeTable2.y) annotation(
    Line(points = {{-82, 12}, {-98, 12}}, color = {0, 0, 127}));
 connect(robot1.vr, e_r.u2) annotation(
    Line(points = {{222, 2}, {224, 2}, {224, -40}, {124, -40}, {124, -16}}, color = {0, 0, 127}));
 connect(e_l.u2, robot1.vl) annotation(
    Line(points = {{126, 38}, {126, 54}, {226, 54}, {226, 22}, {222, 22}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "");
end platform;
