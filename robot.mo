model robot
  parameter Real Ke = 24 / (2 * 3.14);
  parameter Real Tm = 0.1;
  parameter Real R = 0.1;
  parameter Real L = 0.2;
  Modelica.Blocks.Interfaces.RealInput Ul annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 78}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Ur annotation(
    Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder vl_dm(T = Tm, k = 1/Ke) annotation(
    Placement(visible = true, transformation(origin = {-68, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder vr_dm(T = Tm, k = 1/Ke) annotation(
    Placement(visible = true, transformation(origin = {-68, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add v_add annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add w_add(k1 = -1) annotation(
    Placement(visible = true, transformation(origin = {-24, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain v_gain(k = R / 2) annotation(
    Placement(visible = true, transformation(origin = {10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain w_gain(k = R / L) annotation(
    Placement(visible = true, transformation(origin = {10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator phi(initType = Modelica.Blocks.Types.Init.InitialOutput, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.WrapAngle wrapAngle_h annotation(
    Placement(visible = true, transformation(origin = {136, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sin sin_v annotation(
    Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Cos cos_v annotation(
    Placement(visible = true, transformation(origin = {104, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product x_mult annotation(
    Placement(visible = true, transformation(origin = {138, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product y_mult annotation(
    Placement(visible = true, transformation(origin = {138, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator x_i annotation(
    Placement(visible = true, transformation(origin = {172, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator y_i annotation(
    Placement(visible = true, transformation(origin = {172, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vl annotation(
    Placement(visible = true, transformation(origin = {250, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, 104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput x annotation(
    Placement(visible = true, transformation(origin = {250, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v annotation(
    Placement(visible = true, transformation(origin = {250, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {172, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {248, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput heading annotation(
    Placement(visible = true, transformation(origin = {250, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {172, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vr annotation(
    Placement(visible = true, transformation(origin = {248, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {172, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
equation
  connect(phi.y, cos_v.u) annotation(
    Line(points = {{62, -60}, {62, -18}, {26, -18}, {26, 66}, {94, 66}}, color = {0, 0, 127}));
  connect(cos_v.y, x_mult.u1) annotation(
    Line(points = {{117, 66}, {126, 66}}, color = {0, 0, 127}));
  connect(phi.y, sin_v.u) annotation(
    Line(points = {{62, -60}, {62, -18}, {26, -18}, {26, -4}, {90, -4}}, color = {0, 0, 127}));
  connect(sin_v.y, y_mult.u2) annotation(
    Line(points = {{113, -4}, {126, -4}}, color = {0, 0, 127}));
  connect(wrapAngle_h.y, heading) annotation(
    Line(points = {{149, -60}, {250, -60}}, color = {0, 0, 127}));
  connect(phi.y, wrapAngle_h.u) annotation(
    Line(points = {{61, -60}, {126, -60}}, color = {0, 0, 127}));
  connect(v_gain.y, y_mult.u1) annotation(
    Line(points = {{22, 40}, {70, 40}, {70, 8}, {126, 8}}, color = {0, 0, 127}));
  connect(y_mult.y, y_i.u) annotation(
    Line(points = {{149, 2}, {160, 2}}, color = {0, 0, 127}));
  connect(v_gain.y, x_mult.u2) annotation(
    Line(points = {{22, 40}, {70, 40}, {70, 54}, {124, 54}}, color = {0, 0, 127}));
  connect(x_mult.y, x_i.u) annotation(
    Line(points = {{147, 60}, {160, 60}}, color = {0, 0, 127}));
  connect(y_i.y, y) annotation(
    Line(points = {{183, 2}, {214.5, 2}, {214.5, 0}, {248, 0}}, color = {0, 0, 127}));
  connect(x_i.y, x) annotation(
    Line(points = {{181, 60}, {250, 60}}, color = {0, 0, 127}));
  connect(vl_dm.y, w_add.u1) annotation(
    Line(points = {{-57, 80}, {-51, 80}, {-51, -54}, {-37, -54}}, color = {0, 0, 127}));
  connect(Ul, vl_dm.u) annotation(
    Line(points = {{-120, 80}, {-80, 80}}, color = {0, 0, 127}));
  connect(Ur, vr_dm.u) annotation(
    Line(points = {{-120, -80}, {-80, -80}}, color = {0, 0, 127}));
  connect(vr_dm.y, w_add.u2) annotation(
    Line(points = {{-57, -80}, {-49, -80}, {-49, -66}, {-37, -66}}, color = {0, 0, 127}));
  connect(v_add.u2, vr_dm.y) annotation(
    Line(points = {{-42, 34}, {-48, 34}, {-48, -80}, {-56, -80}}, color = {0, 0, 127}));
  connect(vl_dm.y, v_add.u1) annotation(
    Line(points = {{-57, 80}, {-55, 80}, {-55, 46}, {-43, 46}}, color = {0, 0, 127}));
  connect(v_add.y, v_gain.u) annotation(
    Line(points = {{-19, 40}, {-3, 40}}, color = {0, 0, 127}));
  connect(w_add.y, w_gain.u) annotation(
    Line(points = {{-13, -60}, {-3, -60}}, color = {0, 0, 127}));
  connect(w_gain.y, phi.u) annotation(
    Line(points = {{21, -60}, {37, -60}}, color = {0, 0, 127}));
  connect(v_gain.y, v) annotation(
    Line(points = {{22, 40}, {250, 40}}, color = {0, 0, 127}));
  connect(vl_dm.y, vl) annotation(
    Line(points = {{-56, 80}, {250, 80}}, color = {0, 0, 127}));
  connect(vr_dm.y, vr) annotation(
    Line(points = {{-56, -80}, {248, -80}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Icon(coordinateSystem(extent = {{-100, -100}, {250, 100}})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {250, 100}})),
    version = "");
end robot;
