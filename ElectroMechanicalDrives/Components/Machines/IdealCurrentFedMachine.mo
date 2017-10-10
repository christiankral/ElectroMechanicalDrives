within ElectroMechanicalDrives.Components.Machines;
model IdealCurrentFedMachine
  "Ideal electric machine to be supplied with current"
  parameter Boolean useSupport = false
    "= true, if support flange enabled, otherwise implicitly grounded"                                    annotation(Evaluate = true, HideResult = true, choices(checkBox = true));
  parameter Modelica.SIunits.ElectricalTorqueConstant kBase = 1
    "Transformation coefficient of base velocity range";
  parameter Modelica.SIunits.AngularVelocity wBase
    "Maximum base angular velocity";
  Modelica.SIunits.Voltage v "Voltage drop between the two pins";
  Modelica.SIunits.Current i
    "Current flowing from positive to negative pin";
  Modelica.SIunits.Power power "Power";
  Modelica.SIunits.Angle phi
    "Angle of shaft flange with respect to support (= flange.phi - support.phi)";
  Modelica.SIunits.AngularVelocity w
    "Angular velocity of flange relative to support";
  Modelica.SIunits.ElectricalTorqueConstant k
    "Transformation coefficient of base speed range";
  Modelica.SIunits.Torque tau = flange.tau "Torque acting at flange";
  Modelica.SIunits.Torque tauElectrical = -tau "Electrical torque";
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(Placement(transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(Placement(transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange annotation(Placement(transformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Support support if useSupport
    "Support/housing of emf shaft"                                                                      annotation(Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
protected
  Modelica.Mechanics.Rotational.Components.Fixed fixed if not useSupport annotation(Placement(transformation(extent = {{-90, -20}, {-70, 0}})));
  Modelica.Mechanics.Rotational.Interfaces.InternalSupport internalSupport(tau = -flange.tau) annotation(Placement(transformation(extent = {{-90, -10}, {-70, 10}})));
equation
  k = smooth(1, if w > wBase then kBase * wBase / w else if w < (-wBase) then -kBase * wBase / w else kBase);
  v = p.v - n.v;
  0 = p.i + n.i;
  i = p.i;
  power = v * i;
  phi = flange.phi - internalSupport.phi;
  w = der(phi);
  k * w = v;
  flange.tau = -k * i;
  connect(internalSupport.flange, support) annotation(Line(points = {{-80, 0}, {-100, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(internalSupport.flange, fixed.flange) annotation(Line(points = {{-80, 0}, {-80, -10}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(defaultComponentName = "machine", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-85, 10}, {-36, -10}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, fillColor = {192, 192, 192}), Line(points = {{0, 90}, {0, 40}}, color = {0, 0, 255}), Rectangle(extent = {{35, 10}, {100, -10}}, lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.HorizontalCylinder, fillColor = {192, 192, 192}), Ellipse(extent = {{-40, 40}, {40, -40}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                   FillPattern.Solid, lineColor = {0, 0, 255}), Line(points = {{0, -90}, {0, -40}}, color = {0, 0, 255}), Text(extent = {{0, -50}, {199, -90}}, textString = "%name", lineColor = {0, 0, 255}), Text(extent = {{20, 60}, {209, 26}}, lineColor = {160, 160, 164}, textString = "k=%k"), Line(visible = not useSupport, points = {{-100, -30}, {-40, -30}}, color = {0, 0, 0}), Line(visible = not useSupport, points = {{-100, -50}, {-80, -30}}, color = {0, 0, 0}), Line(visible = not useSupport, points = {{-80, -50}, {-60, -30}}, color = {0, 0, 0}), Line(visible = not useSupport, points = {{-60, -50}, {-40, -30}}, color = {0, 0, 0}), Line(visible = not useSupport, points = {{-70, -30}, {-70, -10}}, color = {0, 0, 0}), Text(extent = {{20, 100}, {209, 66}}, lineColor = {160, 160, 164}, textString = "wbase=%wbase")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Polygon(points = {{-17, 95}, {-20, 85}, {-23, 95}, {-17, 95}}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164},
            fillPattern =                                                                                                   FillPattern.Solid), Line(points = {{-20, 110}, {-20, 85}}, color = {160, 160, 164}), Text(extent = {{-40, 110}, {-30, 90}}, lineColor = {160, 160, 164}, textString = "i"), Line(points = {{9, 75}, {19, 75}}, color = {192, 192, 192}), Line(points = {{-20, -110}, {-20, -85}}, color = {160, 160, 164}), Polygon(points = {{-17, -100}, {-20, -110}, {-23, -100}, {-17, -100}}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164},
            fillPattern =                                                                                                   FillPattern.Solid), Text(extent = {{-40, -110}, {-30, -90}}, lineColor = {160, 160, 164}, textString = "i"), Line(points = {{8, -79}, {18, -79}}, color = {192, 192, 192}), Line(points = {{14, 80}, {14, 70}}, color = {192, 192, 192})}), Documentation(info="<html>
<p>This simple electromagnetic force model is derived from
<a href=\"Modelica.Electrical.Analog.Basic.EMF\">EMF</a> 
and transforms electrical power into rotational mechanical power. 
If the speed exceeds the base speed field weakening is automatically applied. The machine model
has to be supplied by a current source (e.g. an ideal 
<a href=\"ElectroMechanicalDrives.Components.Electrical.IdealCurrentControlledConverter\">converter</a>), 
not a voltage source source.</p>

<pre>
v = k*w
tau = -k*i</pre>

<p>Where <code>k = kBase</code> in the base velocity range <code>w &le; wBase</code>.</p>

</html>",
      revisions = "<html>
</html>"));
end IdealCurrentFedMachine;
