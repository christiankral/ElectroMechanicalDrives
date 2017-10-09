model GearMachine
  Modelica.Mechanics.Rotational.Components.Inertia inertia annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ElectroMechanicalDrives.Components.Rotational.ConstantEfficiency constantEfficiency annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed annotation(
    Placement(visible = true, transformation(origin = {-60, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(torque.flange, inertia.flange_a) annotation(
    Line(points = {{-50, 0}, {-35, 0}, {-35, 0}, {-20, 0}}, pattern = LinePattern.Dash));
  connect(speed.flange, inertia.flange_a) annotation(
    Line(points = {{-50, -28}, {-40, -28}, {-40, 0}, {-20, 0}}, pattern = LinePattern.Dash));
  connect(inertia.flange_b, idealGear.flange_b) annotation(
    Line(points = {{0, 0}, {40, 0}}));
  connect(constantEfficiency.flange_b, flange) annotation(
    Line(points = {{80, 0}, {100, 0}}));
  connect(idealGear.flange_b, constantEfficiency.flange_a) annotation(
    Line(points = {{40, 0}, {60, 0}}));
  annotation(
    uses(Modelica(version = "3.2.2"), ElectroMechanicalDrives(version = "1.0.0")),
    Diagram(graphics = {Line(origin = {0.38251, -0.76502}, points = {{-30, 50}, {-30, 30}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {0.38251, -0.38248}, points = {{10, 50}, {10, 30}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {0.38251, -1.14754}, points = {{90, 50}, {90, 30}}, arrow = {Arrow.None, Arrow.Filled}), Rectangle(origin = {50, 0}, fillColor = {255, 255, 127}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, extent = {{-40, 20}, {40, -20}}), Rectangle(origin = {-70, -6}, fillColor = {255, 255, 127}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, extent = {{-10, 26}, {40, -44}}), Text(extent = {{-50, 54}, {-10, 60}}, textString = "machine"), Text(extent = {{-10, 54}, {30, 60}}, textString = "shaft"), Text(extent = {{70, 54}, {110, 60}}, textString = "load"), Text(extent = {{-80, 22}, {-30, 28}}, textString = "electric machine"), Text(extent = {{10, 22}, {90, 28}}, textString = "ideal gear + gear efficiency"), Text(origin = {0, 4},extent = {{-30, 12}, {10, 24}}, textString = "machine
inertia")}, coordinateSystem(initialScale = 0.1)));
end GearMachine;