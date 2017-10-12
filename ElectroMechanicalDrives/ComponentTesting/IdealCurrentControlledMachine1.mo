within ElectroMechanicalDrives.ComponentTesting;
model IdealCurrentControlledMachine1
  "Tests ideal machine without field weakening"
  extends Modelica.Icons.Example;
  Components.Electrical.IdealCurrentControlledConverter idealCurrentControlledConverter annotation(Placement(transformation(extent = {{-30, -10}, {-10, 10}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V = 100) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-60, -2})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(extent = {{-70, -60}, {-50, -40}})));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(Placement(transformation(extent = {{10, -60}, {30, -40}})));
  Modelica.Blocks.Sources.Ramp ramp(duration = 0.5, offset = 0, startTime = 0, height = -10) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-20, -50})));
  Components.Machines.IdealCurrentFedMachine machine(kBase=1, wBase=100,phi(start=0,fixed=true),w(start=0,fixed=true))
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Mechanics.Rotational.Sources.QuadraticSpeedDependentTorque quadraticSpeedDependentTorque(TorqueDirection = false, tau_nominal = -10, w_nominal = 100) annotation(Placement(transformation(extent = {{90, -10}, {70, 10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.1) annotation(Placement(transformation(extent = {{38, -10}, {58, 10}})));
equation
  connect(constantVoltage1.p, idealCurrentControlledConverter.dc_p1) annotation(Line(points = {{-60, 8}, {-60, 20}, {-40, 20}, {-40, 6}, {-30, 6}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(constantVoltage1.n, idealCurrentControlledConverter.dc_n1) annotation(Line(points = {{-60, -12}, {-60, -20}, {-40, -20}, {-40, -6}, {-30, -6}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(constantVoltage1.n, ground1.p) annotation(Line(points = {{-60, -12}, {-60, -40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealCurrentControlledConverter.i2, ramp.y) annotation(Line(points = {{-20, -12}, {-20, -39}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(idealCurrentControlledConverter.dc_p2, machine.p) annotation(Line(points = {{-10, 6}, {0, 6}, {0, 20}, {20, 20}, {20, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealCurrentControlledConverter.dc_n2, machine.n) annotation(Line(points = {{-10, -6}, {0, -6}, {0, -20}, {20, -20}, {20, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(machine.n, ground2.p) annotation(Line(points = {{20, -10}, {20, -40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(machine.flange, inertia.flange_a) annotation(Line(points = {{30, 0}, {38, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(inertia.flange_b, quadraticSpeedDependentTorque.flange) annotation(Line(points = {{58, 0}, {70, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(experiment(StopTime = 10,Interval=1E-3,Tolerance=1E-6),Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-100, 80}, {100, 60}}, lineColor = {0, 0, 127}, textString = "without field weakening")}));
end IdealCurrentControlledMachine1;
