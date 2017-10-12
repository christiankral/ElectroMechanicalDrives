within ElectroMechanicalDrives.ComponentTesting;
model MassMovementForce "Movement of mass without propulsion"
  extends Modelica.Icons.Example;
  Modelica.Mechanics.Translational.Sources.Force force1
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  Components.Translational.MassFriction massFriction1(
    m=1000,
    s(start=0,fixed=true),
    v(start=0,fixed=true))
    annotation (Placement(transformation(extent={{0,10},{20,30}})));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, offset = 0,
    startTime=0,
    height=1000)                                                                           annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}})));
  Modelica.Mechanics.Translational.Sources.Force force2
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  Components.Translational.MassStickingFriction massFriction2(
    m=1000,
    peak=2,
    s(start=0,fixed=true),
    v(start=0,fixed=true))
    annotation (Placement(transformation(extent={{0,-30},{20,-10}})));
equation
  connect(force1.flange, massFriction1.flange_a) annotation (Line(
      points={{-20,20},{0,20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(ramp.y, force1.f) annotation (Line(
      points={{-59,0},{-50,0},{-50,20},{-42,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(force2.flange, massFriction2.flange_a) annotation (Line(
      points={{-20,-20},{0,-20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(ramp.y, force2.f) annotation (Line(points={{-59,0},{-54,0},{-50,0},
          {-50,-20},{-42,-20}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}})));
end MassMovementForce;
