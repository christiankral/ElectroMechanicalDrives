within ElectroMechanicalDrives.Components.Internal.Blocks;
model ConditionalAngle "Block with conditional input"

  parameter Boolean useConstantAngle = false
    "If false signal input is used"
    annotation(Evaluate = true, HideResult = true, choices(checkBox = true));
  parameter Modelica.SIunits.Angle constantAngle = 0
    "Constant angle of gradient" annotation(Dialog(enable = useConstantAngle));

  Modelica.Blocks.Interfaces.RealInput variableAngle(unit = "rad") = angle if not useConstantAngle
    "Angle of inclination of ramp" annotation(Placement(transformation(extent={{-140,
            -20},{-100,20}}), iconTransformation(extent={{-140,
            -20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput angle(unit = "rad")
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  Modelica.Blocks.Sources.Constant const(final k=constantAngle) if useConstantAngle
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
equation
  connect(const.y, angle) annotation (Line(points={{-39,-50},{0,-50},{0,0},{110,
          0}}, color={0,0,127}));
  connect(variableAngle, angle)
    annotation (Line(points={{-120,0},{110,0},{110,0}}, color={0,0,127}));
  annotation (Icon(graphics={      Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end ConditionalAngle;
