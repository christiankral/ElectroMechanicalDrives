within ElectroMechanicalDrives.BaseClasses;
partial model MassFriction "Partial model with mass, inclination and friction"
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialElementaryTwoFlangesAndSupport2;
  extends ElectroMechanicalDrives.Interfaces.ConditionalAngle;
  parameter Modelica.SIunits.Mass m(min = 0, start = 1)
    "Mass of the sliding mass";
  parameter Real mu = 0 "Friction coefficient";
  parameter Modelica.SIunits.Velocity v_linear = 0.01 "Speed limit of constant rolling friction (do not change unless required)" annotation(Dialog(tab = "Tuning",groupImage="modelica://ElectroMechanicalDrives/Resources/Images/v_linearBase.png"));
  Modelica.SIunits.Force f_frictionSliding "Nominal sliding friction force";
  Modelica.SIunits.Position s "Position of flange_a";
  Modelica.SIunits.Velocity v "Absolute velocity of flange_a and flange_b";
  Modelica.SIunits.Acceleration a
    "Absolute acceleration of flange_a and flange_b";
  Modelica.SIunits.Force f_friction "Friction force";
  Modelica.SIunits.Force f_gradient "Force caused by gradient";
  Modelica.SIunits.Power power_gradient = f_gradient*v "Power caused by gradient";
  Modelica.SIunits.Force f "Total force";
  extends
    Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
equation
  s = flange_a.s - s_support;
  flange_a.s = flange_b.s;
  // Velocity and acceleration
  v = der(s);
  a = der(v);
  // Sliding friction force
  f_frictionSliding = m * Modelica.Constants.g_n * cos(angle) * mu;
  // Force due to gradient
  f_gradient = m * Modelica.Constants.g_n * sin(angle);
  // Total force
  f = flange_a.f + flange_b.f;
  // Force balance
  flange_a.f + flange_b.f - f_friction = m * a + m * Modelica.Constants.g_n * sin(angle);
  lossPower = f_friction * v;
  annotation(defaultComponentName = "massFriction", Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={                                             Line(points={{
              -100,-60},{100,-60}},                                                                                                                                                                                                        color = {0, 0, 0}, smooth = Smooth.None), Text(extent = {{-150, 100}, {150, 60}}, textString = "%name", lineColor = {0, 0, 255}), Text(extent={{-150,-60},{150,-90}},      lineColor = {0, 0, 0}, textString = "m=%m"), Line(points={{
              -100,0},{-60,0}},                                                                                                                                                                                                        color = {0, 127, 0}), Line(points={{
              60,0},{100,0}},                                                                                                                                                                                                        color = {0, 127, 0}),
        Rectangle(
          extent={{-60,-40},{60,40}},
          lineColor={0,127,0},
          fillPattern=FillPattern.Sphere,
          fillColor={160,215,160})}));
end MassFriction;
