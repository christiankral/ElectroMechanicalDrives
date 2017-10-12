within ElectroMechanicalDrives.ComponentTesting;
model MassFrictionangleCompare "Mass on slope with friction"
  extends Modelica.Icons.Example;
Components.Translational.MassStickingFriction                 massFriction1(
  m=1000,
  mu=0.02,
  peak=2,
  useConstantAngle=false,
    s(start=0,fixed=true),
    v(start=0,fixed=true))
    annotation (Placement(transformation(extent={{0,22},{20,42}})));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(Placement(transformation(extent={{50,22},{30,42}})));
  Modelica.Blocks.Sources.Constant const(k = 300) annotation(Placement(transformation(extent = {{100, -10}, {80, 10}})));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, offset = 0, startTime = 1, height = -0.01) annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
  Components.Translational.MassFriction massFriction2(
    m = 1000,
    mu = 0.02,
    useConstantAngle = false,
    s(start=0,fixed=true),
    v(start=0,fixed=true))
    annotation(Placement(transformation(extent={{0,-44},{20,-24}})));
  Modelica.Mechanics.Translational.Sources.Force force2 annotation(Placement(transformation(extent={{50,-44},
            {30,-24}})));
equation
  connect(const.y, force1.f) annotation(Line(points={{79,0},{70,0},{70,32},
          {52,32}},                                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(massFriction1.flange_b, force1.flange) annotation(Line(points={{20,32},
          {30,32}},                                                                             color = {0, 127, 0}, smooth = Smooth.None));
  connect(massFriction2.flange_b, force2.flange) annotation(Line(points={{20,-34},
          {30,-34}},                                                                              color = {0, 127, 0}, smooth = Smooth.None));
  connect(const.y, force2.f) annotation(Line(points={{79,0},{70,0},{70,-34},
          {52,-34}},                                                                            color = {0, 0, 127}, smooth = Smooth.None));
  connect(ramp.y, massFriction2.variableAngle) annotation(Line(points={{-39,0},
          {-20,0},{-20,-40},{-2,-40}},                                                                                                   color = {0, 0, 127}, smooth = Smooth.None));
  connect(ramp.y, massFriction1.variableAngle) annotation (Line(points={{
          -39,0},{-30,0},{-20,0},{-20,26},{-2,26}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}}),                                                                           graphics={  Text(extent = {{-90, 80}, {90, 60}}, lineColor=
              {255,0,0},
            fillPattern=FillPattern.VerticalCylinder,                                                                                                    fillColor=
              {255,255,255},                                                                                                    fontSize=
              16,
          textString="massFriction1 starts
moving after overcoming sticktion"),
                                 Text(extent={{-90,-80},{90,-100}},      lineColor = {0, 0, 255},
            fillPattern =                                                                                       FillPattern.VerticalCylinder, fillColor = {255, 255, 255}, fontSize = 16, textString = "massFriction2 starts moving immediately")}), experiment(StopTime = 3), __Dymola_experimentSetupOutput);
end MassFrictionangleCompare;
