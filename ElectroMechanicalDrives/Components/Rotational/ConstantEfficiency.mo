within ElectroMechanicalDrives.Components.Rotational;
model ConstantEfficiency
  "Efficiency model considering constant efficiency"
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2;
  parameter Real efficiency(final min=Modelica.Constants.small,
    final max=1) = 1 "Efficiency coefficient";
  Modelica.Units.SI.Angle phi "Angle of flange_a";
  Modelica.Units.SI.AngularVelocity w
    "Absolute angular velocity of flange_a and flange_b";
  Modelica.Units.SI.AngularAcceleration a
    "Absolute acceleration of flange_a and flange_b";
  Modelica.Units.SI.Power power_a(start=0) = flange_a.tau*w
    "Power input of flange_a";
  Modelica.Units.SI.Power power_b=flange_b.tau*w "Power input of flange_b";
  Modelica.Units.SI.Torque tau_loss(final start=0) "Friction torque";
  extends
    Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
equation
  phi = flange_a.phi - phi_support;
  flange_a.phi = flange_b.phi;
  // Velocity and acceleration
  w = der(phi);
  a = der(w);
  // Torque balance
  flange_a.tau + flange_b.tau - tau_loss = 0;
  flange_b.tau = smooth(0, if power_a > 0 then -flange_a.tau * efficiency else -flange_a.tau / efficiency);
  lossPower = tau_loss * w;
  annotation(defaultComponentName="efficiency",Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0},
          fillPattern =                                                                                                   FillPattern.Solid, fillColor = {255, 255, 255}), Text(extent = {{-150, 150}, {150, 110}}, textString = "%name", lineColor = {0, 0, 255}), Text(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0},
          fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {255, 255, 255}, textString = "%%"),                                                                                                                                                                               Text(extent={{-150,-120},{150,-160}},    lineColor={0,0,0},
          textString="eff=%efficiency")}),                                                                                                                                                       Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Documentation(info="<html>
<p>Model of constant efficiency independent of speed and torque.</p>
</html>"));
end ConstantEfficiency;
