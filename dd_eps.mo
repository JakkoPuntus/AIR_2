model dd_eps
  Modelica.Blocks.Interfaces.RealInput x_set annotation(
    Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput y_set annotation(
    Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput x annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput y annotation(
    Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput heading annotation(
    Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -86}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback e_x annotation(
    Placement(visible = true, transformation(origin = {-50, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback e_y annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.WrapAngle wrapAngle annotation(
    Placement(visible = true, transformation(origin = {4, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Atan2 atan2_h annotation(
    Placement(visible = true, transformation(origin = {14, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.WrapAngle wrapAngle1 annotation(
    Placement(visible = true, transformation(origin = {46, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product sqr_x annotation(
    Placement(visible = true, transformation(origin = {20, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product sqr_y annotation(
    Placement(visible = true, transformation(origin = {20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add sqr_p annotation(
    Placement(visible = true, transformation(origin = {58, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sqrt dst annotation(
    Placement(visible = true, transformation(origin = {102, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback e_h annotation(
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput e_dst annotation(
    Placement(visible = true, transformation(origin = {160, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {138, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput e_head annotation(
    Placement(visible = true, transformation(origin = {160, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {138, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(x_set, e_x.u1) annotation(
    Line(points = {{-100, 80}, {-58, 80}}, color = {0, 0, 127}));
  connect(x, e_x.u2) annotation(
    Line(points = {{-100, 0}, {-50, 0}, {-50, 72}}, color = {0, 0, 127}));
  connect(y_set, e_y.u1) annotation(
    Line(points = {{-100, 40}, {-38, 40}}, color = {0, 0, 127}));
  connect(y, e_y.u2) annotation(
    Line(points = {{-100, -40}, {-30, -40}, {-30, 32}}, color = {0, 0, 127}));
  connect(e_x.y, atan2_h.u2) annotation(
    Line(points = {{-40, 80}, {-16, 80}, {-16, -46}, {2, -46}}, color = {0, 0, 127}));
  connect(e_y.y, atan2_h.u1) annotation(
    Line(points = {{-20, 40}, {-10, 40}, {-10, -34}, {2, -34}}, color = {0, 0, 127}));
  connect(atan2_h.y, wrapAngle1.u) annotation(
    Line(points = {{26, -40}, {34, -40}}, color = {0, 0, 127}));
  connect(heading, wrapAngle.u) annotation(
    Line(points = {{-100, -80}, {-8, -80}}, color = {0, 0, 127}));
  connect(e_x.y, sqr_x.u1) annotation(
    Line(points = {{-40, 80}, {0, 80}, {0, 86}, {8, 86}}, color = {0, 0, 127}));
  connect(e_x.y, sqr_x.u2) annotation(
    Line(points = {{-40, 80}, {0, 80}, {0, 74}, {8, 74}}, color = {0, 0, 127}));
  connect(e_y.y, sqr_y.u1) annotation(
    Line(points = {{-20, 40}, {0, 40}, {0, 46}, {8, 46}}, color = {0, 0, 127}));
  connect(e_y.y, sqr_y.u2) annotation(
    Line(points = {{-20, 40}, {0, 40}, {0, 34}, {8, 34}}, color = {0, 0, 127}));
  connect(sqr_y.y, sqr_p.u2) annotation(
    Line(points = {{32, 40}, {40, 40}, {40, 54}, {46, 54}}, color = {0, 0, 127}));
  connect(sqr_x.y, sqr_p.u1) annotation(
    Line(points = {{32, 80}, {40, 80}, {40, 66}, {46, 66}}, color = {0, 0, 127}));
  connect(sqr_p.y, dst.u) annotation(
    Line(points = {{70, 60}, {90, 60}}, color = {0, 0, 127}));
  connect(wrapAngle1.y, e_h.u1) annotation(
    Line(points = {{58, -40}, {92, -40}}, color = {0, 0, 127}));
  connect(wrapAngle.y, e_h.u2) annotation(
    Line(points = {{16, -80}, {100, -80}, {100, -48}}, color = {0, 0, 127}));
  connect(e_h.y, e_head) annotation(
    Line(points = {{110, -40}, {160, -40}}, color = {0, 0, 127}));
  connect(dst.y, e_dst) annotation(
    Line(points = {{114, 60}, {160, 60}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0")),
  Diagram(coordinateSystem(extent = {{-100, -150}, {150, 100}})),
  Icon(coordinateSystem(extent = {{-100, -150}, {150, 100}})),
  version = "");
end dd_eps;
