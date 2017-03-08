within ElectroMechanicalDrives.Components.Machines;
model IdealCurrentControlledMachine
  "Ideal electric machine with current control input"
  parameter Boolean useSupport = false
    "= true, if support flange enabled, otherwise implicitly grounded"                                    annotation(Evaluate = true, HideResult = true, choices(checkBox = true));
  parameter Modelica.SIunits.ElectricalTorqueConstant kBase = 1
    "Transformation coefficient of base velocity range";
  parameter Modelica.SIunits.AngularVelocity wBase
    "Maximum base angular velocity";
  Modelica.SIunits.Voltage v "Voltage drop between the two pins";
  Modelica.Blocks.Interfaces.RealInput i(unit = "A")
    "Controlled current input"                                                  annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 120}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 120})));
  Modelica.SIunits.Power power "Power";
  Modelica.SIunits.Angle phi
    "Angle of shaft flange with respect to support (= flange.phi - support.phi)";
  Modelica.SIunits.AngularVelocity w
    "Angular velocity of flange relative to support";
  Modelica.SIunits.ElectricalTorqueConstant k
    "Transformation coefficient of base speed range";
  Modelica.SIunits.Torque tau = flange.tau "Torque acting at flange";
  Modelica.SIunits.Torque tauElectrical = -tau "Electrical torque";
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange annotation(Placement(transformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Support support if useSupport
    "Support/housing of emf shaft"                                                                      annotation(Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
protected
  Modelica.Mechanics.Rotational.Components.Fixed fixed if not useSupport annotation(Placement(transformation(extent = {{-90, -20}, {-70, 0}})));
  Modelica.Mechanics.Rotational.Interfaces.InternalSupport internalSupport(tau = -flange.tau) annotation(Placement(transformation(extent = {{-90, -10}, {-70, 10}})));
equation
  k = smooth(1, if w > wBase then kBase * wBase / w else if w < (-wBase) then -kBase * wBase / w else kBase);
  power = v * i;
  phi = flange.phi - internalSupport.phi;
  w = der(phi);
  k * w = v;
  flange.tau = -k * i;
  connect(internalSupport.flange, support) annotation(Line(points = {{-80, 0}, {-100, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(internalSupport.flange, fixed.flange) annotation(Line(points = {{-80, 0}, {-80, -10}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(defaultComponentName = "machine", Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-85, 10}, {-36, -10}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, fillColor = {192, 192, 192}), Rectangle(extent = {{35, 10}, {100, -10}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, fillColor = {192, 192, 192}), Ellipse(extent = {{-40, 40}, {40, -40}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                   FillPattern.Solid, lineColor = {0, 0, 255}), Text(extent = {{0, -50}, {199, -90}}, textString = "%name", lineColor = {0, 0, 255}), Text(extent = {{20, 60}, {209, 26}}, lineColor = {160, 160, 164}, textString = "k=%k"), Line(visible = not useSupport, points = {{-100, -30}, {-40, -30}}, color = {0, 0, 0}), Line(visible = not useSupport, points = {{-100, -50}, {-80, -30}}, color = {0, 0, 0}), Line(visible = not useSupport, points = {{-80, -50}, {-60, -30}}, color = {0, 0, 0}), Line(visible = not useSupport, points = {{-60, -50}, {-40, -30}}, color = {0, 0, 0}), Line(visible = not useSupport, points = {{-70, -30}, {-70, -10}}, color = {0, 0, 0}), Text(extent = {{20, 100}, {209, 66}}, lineColor = {160, 160, 164}, textString = "wbase=%wbase"), Line(points = {{0, 100}, {0, 40}}, color = {0, 0, 255}, smooth = Smooth.None)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info = "<html>
<p>EMF transforms electrical energy into rotational mechanical energy. It is used as basic building block of an electrical motor. The mechanical connector flange can be connected to elements of the Modelica.Mechanics.Rotational library. flange.tau is the cut-torque, flange.phi is the angle at the rotational connection.</p>

<pre>
v = k*w
tau = -k*i</pre>

<p>Where <code>k = kBase</code> in the base velocity range</p>

</html>",
      revisions = "<html>
</html>"));
end IdealCurrentControlledMachine;
