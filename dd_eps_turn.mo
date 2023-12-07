model dd_eps_turn
  Modelica.Blocks.Interfaces.RealInput p_set annotation(
    Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 64}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput h_set annotation(
    Placement(visible = true, transformation(origin = {-100, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-84, -44}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.WrapAngle wrapAngle2 annotation(
    Placement(visible = true, transformation(origin = {-52, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation(
    Placement(visible = true, transformation(origin = {-6, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant c180deg(k = 3.1415)  annotation(
    Placement(visible = true, transformation(origin = {-90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback minus180 annotation(
    Placement(transformation(origin = {-24, -70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.LessEqualThreshold lessEqualThreshold(threshold = 1.5707)  annotation(
    Placement(visible = true, transformation(origin = {34, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant c1(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-48, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant cm1(k = -1)  annotation(
    Placement(visible = true, transformation(origin = {-50, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product p_mult annotation(
    Placement(visible = true, transformation(origin = {120, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch p_sign annotation(
    Placement(visible = true, transformation(origin = {68, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput p_out annotation(
    Placement(visible = true, transformation(origin = {160, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput h_out annotation(
    Placement(visible = true, transformation(origin = {160, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.WrapAngle wrapAngle annotation(
    Placement(visible = true, transformation(origin = {122, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(h_set, wrapAngle2.u) annotation(
    Line(points = {{-100, -30}, {-64, -30}}, color = {0, 0, 127}));
  connect(wrapAngle2.y, abs1.u) annotation(
    Line(points = {{-41, -30}, {-19, -30}}, color = {0, 0, 127}));
  connect(abs1.y, lessEqualThreshold.u) annotation(
    Line(points = {{6, -30}, {22, -30}}, color = {0, 0, 127}));
  connect(minus180.y, switch1.u3) annotation(
    Line(points = {{-15, -70}, {70, -70}, {70, -38}, {78, -38}}, color = {0, 0, 127}));
  connect(lessEqualThreshold.y, switch1.u2) annotation(
    Line(points = {{46, -30}, {78, -30}}, color = {255, 0, 255}));
  connect(c1.y, p_sign.u1) annotation(
    Line(points = {{-37, 52}, {56, 52}}, color = {0, 0, 127}));
  connect(cm1.y, p_sign.u3) annotation(
    Line(points = {{-38, 16}, {-18, 16}, {-18, 36}, {56, 36}}, color = {0, 0, 127}));
  connect(p_set, p_mult.u1) annotation(
    Line(points = {{-100, 80}, {88, 80}, {88, 86}, {108, 86}}, color = {0, 0, 127}));
  connect(p_sign.y, p_mult.u2) annotation(
    Line(points = {{80, 44}, {98, 44}, {98, 74}, {108, 74}}, color = {0, 0, 127}));
  connect(p_mult.y, p_out) annotation(
    Line(points = {{132, 80}, {140, 80}, {140, 60}, {160, 60}}, color = {0, 0, 127}));
  connect(switch1.y, wrapAngle.u) annotation(
    Line(points = {{102, -30}, {110, -30}}, color = {0, 0, 127}));
  connect(wrapAngle.y, h_out) annotation(
    Line(points = {{134, -30}, {160, -30}}, color = {0, 0, 127}));
  connect(wrapAngle2.y, minus180.u1) annotation(
    Line(points = {{-40, -30}, {-32, -30}, {-32, -70}}, color = {0, 0, 127}));
  connect(c180deg.y, minus180.u2) annotation(
    Line(points = {{-78, -90}, {-24, -90}, {-24, -78}}, color = {0, 0, 127}));
  connect(wrapAngle2.y, switch1.u1) annotation(
    Line(points = {{-40, -30}, {-30, -30}, {-30, -10}, {68, -10}, {68, -22}, {78, -22}}, color = {0, 0, 127}));
  connect(lessEqualThreshold.y, p_sign.u2) annotation(
    Line(points = {{46, -30}, {50, -30}, {50, 44}, {56, 44}}, color = {255, 0, 255}));

annotation(
    uses(Modelica(version = "4.0.0")),
  Diagram(coordinateSystem(extent = {{-100, -100}, {150, 100}})),
  Icon(coordinateSystem(extent = {{-100, -100}, {150, 100}})),
  version = "");
end dd_eps_turn;
