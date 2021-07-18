within ElectroMechanicalDrives.Components.Translational;
model ConstantEfficiency
  "Efficiency model considering constant efficiency"
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialElementaryTwoFlangesAndSupport2;
  parameter Real efficiency(final min=Modelica.Constants.small,
    final max=1) = 1 "Efficiency coefficient";
  Modelica.Units.SI.Position s "Position of flange_a";
  Modelica.Units.SI.Velocity v "Absolute velocity of flange_a and flange_b";
  Modelica.Units.SI.Acceleration a
    "Absolute acceleration of flange_a and flange_b";
  Modelica.Units.SI.Power power_a=flange_a.f*v "Power input of flange_a";
  Modelica.Units.SI.Power power_b=flange_b.f*v "Power input of flange_b";
  Modelica.Units.SI.Force f_loss(final start=0) "Friction force";
  extends
    Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
equation
  s = flange_a.s - s_support;
  flange_a.s = flange_b.s;
  // Velocity and acceleration
  v = der(s);
  a = der(v);
  // Force balance
  flange_a.f + flange_b.f - f_loss = 0;
  flange_b.f = smooth(0, if power_a > 0 then -flange_a.f * efficiency else -flange_a.f / efficiency);
  lossPower = f_loss * v;
  annotation(defaultComponentName="efficiency",Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Solid, fillColor = {255, 255, 255}), Text(extent = {{-150, 150}, {150, 110}}, textString = "%name", lineColor = {0, 0, 255}), Text(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {255, 255, 255}, textString = "%%"),                                                                                                                                                                             Text(extent={{-150,-120},{150,-160}},    lineColor={0,0,0},
          textString="eff=%efficiency")}),                                                                                                                                                         Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Documentation(info="<html>
<p>Model of constant efficiency independent of speed and force.</p>
</html>"));
end ConstantEfficiency;
