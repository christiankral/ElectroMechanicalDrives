within ElectroMechanicalDrives.Interfaces;
model PartialVehicle "Partial vehicle with friction"

  extends ElectroMechanicalDrives.Interfaces.ConditionalAngle;
  parameter Modelica.SIunits.Density rho = 1.2 "Mass density of air" annotation(Dialog(group = "Ambient"));
  parameter Real mu = 0.02 "Rolling friction coefficient" annotation(Dialog(group = "Ambient"));
  parameter Modelica.SIunits.Area A = 3 "Area of cross section of vehicle" annotation(Dialog(group = "Vehicle"));
  parameter Real cx = 0.3 "Drag coefficient (cw in German)" annotation(Dialog(group = "Vehicle"));
  parameter Modelica.SIunits.Mass m = 1000 "Total mass of vehicle" annotation(Dialog(group = "Vehicle"));
  parameter Modelica.SIunits.Length r = 0.35 "Wheel radius" annotation(Dialog(group = "Vehicle"));
  parameter Real j = 0 "Relative mass increase due to rotating inertias" annotation(Dialog(group = "Vehicle"));
  parameter Modelica.SIunits.Velocity v_linear = 0.01 "Speed limit of constant rolling friction" annotation(Dialog(group = "Vehicle"));
  final parameter Modelica.SIunits.Inertia J = j * m * r ^ 2 "Total inertia with respect to wheel" annotation(Evaluate = true);
  Modelica.SIunits.Acceleration a "Vehicle acceleration";
  Modelica.SIunits.Velocity v "Vehicle velovity";
  Modelica.SIunits.Length s "Distance";
  Modelica.SIunits.AngularAcceleration alpha "Angular acceleration of wheel(s)";
  Modelica.SIunits.AngularVelocity w "Angular velocity of wheel(s)";
  Modelica.SIunits.Angle phi "Angul of wheel(s)";
  Modelica.SIunits.Force f_a = flangeT_a.f "Force of flangeT a";
  Modelica.SIunits.Force f_b = flangeT_b.f "Force of flangeT b";
  Modelica.SIunits.Torque tau_a = flangeR_a.tau "Torque of flangeR_a";
  Modelica.SIunits.Torque tau_b = flangeR_b.tau "Torque of flangeR_b";

  Modelica.Mechanics.Translational.Interfaces.Flange_a flangeT_a "Left translational flange of vehicle" annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flangeT_b "Right translational flange of vehicle" annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flangeR_a "Left rotational flange_a of wheel_a" annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flangeR_b "Right rotational flange_b of wheel_b" annotation (Placement(transformation(extent={{90,-110},{110,-90}})));

  ElectroMechanicalDrives.Components.Translational.AthmosphericFriction atmosphericFriction(final rho = rho, final A = A, final cx = cx) annotation(Placement(transformation(extent={{10,-10},{-10,10}},rotation=0,origin={20,-20})));
  ElectroMechanicalDrives.Components.Translational.MassFriction rollingFriction(final m = m, final mu = mu, final v_linear = v_linear,
    final useSupport=false,
    final useConstantAngle=useConstantAngle,
    final constantAngle=constantAngle)
    annotation(Placement(transformation(extent={{10,10},{-10,-10}},rotation=180,origin={-20,-20})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel wheel_a(final radius=r) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-70,-80})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(final J = J) annotation(Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-80,50})));

  Modelica.Mechanics.Rotational.Components.IdealRollingWheel wheelInternal(final radius=r)
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-80,18})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel wheel_b(final radius=r)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,-80})));

equation
  s = flangeT_a.s;
  v = der(s);
  a = der(v);
  phi = flangeR_a.phi;
  w = der(phi);
  alpha = der(w);
  connect(wheelInternal.flangeR, inertia.flange_b)
    annotation (Line(points={{-80,28},{-80,40}},   color={0,0,0}));
  connect(wheelInternal.flangeT, flangeT_a)
    annotation (Line(points={{-80,8},{-80,0},{-100,0}},   color={0,127,0}));
  connect(wheel_a.flangeR, flangeR_a) annotation (Line(points={{-70,-90},{-70,
          -90},{-70,-102},{-70,-100},{-100,-100}}, color={0,0,0}));
  connect(angle, rollingFriction.variableAngle) annotation (Line(points={{-90,-50},
          {-90,-50},{-90,-26},{-32,-26}},                 color={0,0,127}));
  connect(wheel_b.flangeR, flangeR_b) annotation (Line(points={{80,-90},{80,
          -90},{80,-100},{100,-100}}, color={0,0,0}));
  connect(flangeT_a, rollingFriction.flange_b) annotation (Line(points={{-100,0},
          {0,0},{0,-20},{-2,-20},{-10,-20}}, color={0,127,0}));
  connect(rollingFriction.flange_b, atmosphericFriction.flange)
    annotation (Line(points={{-10,-20},{0,-20},{10,-20}}, color={0,127,0}));
  connect(flangeT_a, flangeT_b)
    annotation (Line(points={{-100,0},{100,0},{100,0}}, color={0,127,0}));
  connect(wheel_a.flangeT, rollingFriction.flange_b) annotation (Line(points={{-70,-70},{-70,0},{0,0},{0,-20},{-10,-20}}, color={0,127,0}));
  connect(wheel_b.flangeT, flangeT_b) annotation (Line(points={{80,-70},{80,0},{100,0}}, color={0,127,0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}})),                                                                                     Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}}),                                                                                                    graphics={     Text(extent={{
              -150,150},{150,110}},                                                                                                                                                        lineColor = {0, 0, 255}, textString = "%name"),
        Ellipse(extent={{-120,-120},{-80,-80}}, lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-100,-80},{-100,-40},{100,-40},{100,-80},{-100,-80}},
          lineColor={0,0,0},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Ellipse(extent={{80,-120},{120,-80}},   lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>Do not change <code>v_linear</code> except this is required for numerical reasons</p>
</html>"));
end PartialVehicle;
