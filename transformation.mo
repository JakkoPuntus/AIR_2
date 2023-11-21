model transformation
  Modelica.Blocks.Interfaces.RealInput v_set annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, 56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_set annotation(
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-92, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Gain vs_g(k = 1/R)  annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain ws_g(k = 1/R) annotation(
    Placement(visible = true, transformation(origin = {-52, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add vr_add annotation(
    Placement(visible = true, transformation(origin = {-10, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add vl_add annotation(
    Placement(visible = true, transformation(origin = {-10, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vl annotation(
    Placement(visible = true, transformation(origin = {110, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {78, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vr annotation(
    Placement(visible = true, transformation(origin = {110, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {52, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(vs_g.u, v_set) annotation(
    Line(points = {{-62, 60}, {-100, 60}}, color = {0, 0, 127}));
  connect(w_set, ws_g.u) annotation(
    Line(points = {{-100, -60}, {-64, -60}}, color = {0, 0, 127}));
  connect(vs_g.y, vl_add.u1) annotation(
    Line(points = {{-38, 60}, {-22, 60}}, color = {0, 0, 127}));
  connect(ws_g.y, vr_add.u2) annotation(
    Line(points = {{-40, -60}, {-22, -60}}, color = {0, 0, 127}));
  connect(ws_g.y, vl_add.u2) annotation(
    Line(points = {{-40, -60}, {-40, 48}, {-22, 48}}, color = {0, 0, 127}));
  connect(vs_g.y, vr_add.u1) annotation(
    Line(points = {{-38, 60}, {-40, 60}, {-40, -48}, {-22, -48}}, color = {0, 0, 127}));
  connect(vl_add.y, vl) annotation(
    Line(points = {{2, 54}, {110, 54}}, color = {0, 0, 127}));
  connect(vr_add.y, vr) annotation(
    Line(points = {{2, -54}, {110, -54}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0")));
end transformation;
