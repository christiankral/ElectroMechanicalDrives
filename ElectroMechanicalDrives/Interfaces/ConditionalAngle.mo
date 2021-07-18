within ElectroMechanicalDrives.Interfaces;
model ConditionalAngle "Conditional input with internal input connector"

  parameter Boolean useConstantAngle = true
    "If false, signal input is used"
    annotation(Evaluate = true, HideResult = true, choices(checkBox = true));
  parameter Modelica.Units.SI.Angle constantAngle=0
    "Constant angle of gradient" annotation (Dialog(enable=useConstantAngle));

  Modelica.Blocks.Interfaces.RealInput variableAngle(unit = "rad") if not useConstantAngle
    "Angle of inclination of ramp" annotation(Placement(transformation(extent={{-140,
            -80},{-100,-40}}),iconTransformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Sources.Constant const(final k=constantAngle) if useConstantAngle
    annotation (Placement(transformation(extent={{-5,-5},{5,5}}, rotation=90, origin={-95,-75})));
protected
  Modelica.Blocks.Interfaces.RealInput angle(unit="rad")
    "Angle of inclination (either constant or signal input)" annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,origin={-90,-50})));

equation
  connect(angle, variableAngle) annotation (Line(points={{-90,-50},{-90,-50},{-90,
          -60},{-120,-60}},
                 color={0,0,127}));
  connect(const.y, angle)
    annotation (Line(points={{-95,-69.5},{-95,-64},{-95,-60},{-90,-60},{-90,-50}},
                                                             color={0,0,127}));
  annotation (                              Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end ConditionalAngle;
