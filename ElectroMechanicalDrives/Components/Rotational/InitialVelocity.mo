within ElectroMechanicalDrives.Components.Rotational;
model InitialVelocity "Initial angularvelocity of flange"
  parameter Modelica.Units.SI.AngularVelocity w0 "Initial angular velocity";
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
initial equation
  der(flange_a.phi) = w0;
equation
  flange_a.tau = 0;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor=
              {95,95,95}),                                                                                                                                                               Text(extent = {{-60, 60}, {60, -60}}, lineColor=
              {95,95,95},
          textString="w0=%w0")}),                                                                                                                                                                                                        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Documentation(info="<html>
Sets initial velocity <code>w0</code> at flange.
</html>"));
end InitialVelocity;
