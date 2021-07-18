within ElectroMechanicalDrives.Components.Translational;
model InitialVelocity "Initial velocity of flange"
  parameter Modelica.Units.SI.Velocity v0 "Initial velocity";
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
initial equation
  der(flange_a.s) = v0;
equation
  flange_a.f = 0;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 128, 0}), Text(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 128, 0}, textString = "v0=%v0")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Documentation(info="<html>
Sets initial velocity <code>v0</codew> at flange.
</html>"));
end InitialVelocity;
