within ElectroMechanicalDrives.Components.Rotational;
model ConstantEfficiency
  "Efficiency model considering constant efficiency"
  extends Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2;
  parameter Real efficiency = 0.9 "Efficiency coefficient";
  Modelica.SIunits.Angle phi "Angle of flange_a";
  Modelica.SIunits.AngularVelocity w
    "Absolute angular velocity of flange_a and flange_b";
  Modelica.SIunits.AngularAcceleration a
    "Absolute acceleration of flange_a and flange_b";
  Modelica.SIunits.Power power_a(start=0) = flange_a.tau * w
    "Power input of flange_a";
  Modelica.SIunits.Power power_b = flange_b.tau * w
    "Power input of flange_b";
  Modelica.SIunits.Torque tau_loss(final start = 0) "Friction torque";
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
equation
  phi = flange_a.phi - phi_support;
  flange_a.phi = flange_b.phi;
  // Velocity and acceleration
  w = der(phi);
  a = der(w);
  // Torque balance
  flange_a.tau + flange_b.tau - tau_loss = 0;
  power_b = smooth(1, if power_a > 0 then -power_a * efficiency else -power_a / efficiency);
  lossPower = tau_loss * w;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0},
          fillPattern =                                                                                                   FillPattern.Solid, fillColor = {255, 255, 255}), Text(extent = {{-150, 150}, {150, 110}}, textString = "%name", lineColor = {0, 0, 255}), Text(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0},
          fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {255, 255, 255}, textString = "%%")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Documentation(info="<html>
<p>Model of constant efficiency independent of speed and torque.</p>
</html>"));
end ConstantEfficiency;
