model robot
parameter Real Ke=24/(2*3.14);
parameter Real Tm=0.1;
parameter Real R=0.1;
parameter Real L=0.2;
  Modelica.Blocks.Interfaces.RealInput Ul annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Ur annotation(
    Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -54}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder vl_dm(T = Tm, k = Ke)  annotation(
    Placement(visible = true, transformation(origin = {-68, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder vr_dm(T = Tm, k = Ke)  annotation(
    Placement(visible = true, transformation(origin = {-68, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add v_add annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add w_add annotation(
    Placement(visible = true, transformation(origin = {-24, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain v_gain(k = R/2)  annotation(
    Placement(visible = true, transformation(origin = {10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain w_gain(k = R/2)  annotation(
    Placement(visible = true, transformation(origin = {10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator phi annotation(
    Placement(visible = true, transformation(origin = {50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.WrapAngle wrapAngle_h annotation(
    Placement(visible = true, transformation(origin = {94, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sin sin_v annotation(
    Placement(visible = true, transformation(origin = {50, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Cos cos_w annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product x_mult annotation(
    Placement(visible = true, transformation(origin = {90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product y_mult annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator x_i annotation(
    Placement(visible = true, transformation(origin = {150, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator y_i annotation(
    Placement(visible = true, transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vl annotation(
    Placement(visible = true, transformation(origin = {250, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {250, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput x annotation(
    Placement(visible = true, transformation(origin = {250, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {250, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v annotation(
    Placement(visible = true, transformation(origin = {250, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {242, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {248, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {236, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput heading annotation(
    Placement(visible = true, transformation(origin = {250, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {238, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vr annotation(
    Placement(visible = true, transformation(origin = {248, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {226, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
equation
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
  connect(vl_dm.y, w_add.u1) annotation(
    Line(points = {{-57, 80}, {-49, 80}, {-49, -54}, {-37, -54}}, color = {0, 0, 127}));
  connect(v_add.y, v_gain.u) annotation(
    Line(points = {{-19, 40}, {-3, 40}}, color = {0, 0, 127}));
  connect(w_add.y, w_gain.u) annotation(
    Line(points = {{-13, -60}, {-3, -60}}, color = {0, 0, 127}));
  connect(w_gain.y, phi.u) annotation(
    Line(points = {{21, -60}, {37, -60}}, color = {0, 0, 127}));
  connect(phi.y, wrapAngle_h.u) annotation(
    Line(points = {{61, -60}, {81, -60}}, color = {0, 0, 127}));
  connect(w_gain.y, sin_v.u) annotation(
    Line(points = {{21, -60}, {29, -60}, {29, -2}, {38, -2}}, color = {0, 0, 127}));
  connect(w_gain.y, cos_w.u) annotation(
    Line(points = {{21, -60}, {29, -60}, {29, 60}, {38, 60}}, color = {0, 0, 127}));
  connect(sin_v.y, y_mult.u2) annotation(
    Line(points = {{61, -2}, {69, -2}, {69, -6}, {77, -6}}, color = {0, 0, 127}));
  connect(cos_w.y, x_mult.u1) annotation(
    Line(points = {{61, 60}, {69, 60}, {69, 66}, {77, 66}}, color = {0, 0, 127}));
  connect(x_mult.u2, y_mult.u1) annotation(
    Line(points = {{78, 54}, {72, 54}, {72, 6}, {78, 6}}, color = {0, 0, 127}));
  connect(y_mult.y, y_i.u) annotation(
    Line(points = {{101, 0}, {137, 0}}, color = {0, 0, 127}));
  connect(x_mult.y, x_i.u) annotation(
    Line(points = {{101, 60}, {137, 60}}, color = {0, 0, 127}));
  connect(vr_dm.y, vr) annotation(
    Line(points = {{-57, -80}, {248, -80}}, color = {0, 0, 127}));
  connect(vl_dm.y, vl) annotation(
    Line(points = {{-56, 80}, {250, 80}}, color = {0, 0, 127}));
  connect(x_i.y, x) annotation(
    Line(points = {{162, 60}, {250, 60}}, color = {0, 0, 127}));
  connect(y_i.y, y) annotation(
    Line(points = {{162, 0}, {248, 0}}, color = {0, 0, 127}));
  connect(v_gain.y, v) annotation(
    Line(points = {{22, 40}, {250, 40}}, color = {0, 0, 127}));
  connect(wrapAngle_h.y, heading) annotation(
    Line(points = {{106, -60}, {250, -60}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
  Icon(coordinateSystem(extent = {{-100, -100}, {250, 100}})),
  Diagram(coordinateSystem(extent = {{-100, -100}, {250, 100}})),
  version = "");
end robot;
