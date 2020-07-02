within ElectroMechanicalDrives.Components.Vehicles;
model VehicleWithDriveLoss "Vehicle with friction"
  parameter Real i = 1 "Transmission speed ratio wheel/machine" annotation(Dialog(group = "Power train", tab = "ElectroMechanical"));
  parameter Modelica.SIunits.ElectricalTorqueConstant kBase = 1
    "Transformation coefficient of base velocity range" annotation(Dialog(group = "Electric machine", tab = "ElectroMechanical"));
  parameter Modelica.SIunits.AngularVelocity wBase
    "Maximum base angular velocity" annotation(Dialog(group = "Electric machine", tab = "ElectroMechanical"));
  parameter Modelica.SIunits.Resistance Ra = 0
    "Internal armature resistance of machine"  annotation(Dialog(group = "Electric machine", tab = "ElectroMechanical"));
  parameter Integer ns(min = 1) = 1 "Number of series cells" annotation(Dialog(group = "Battery", tab = "ElectroMechanical"));
  parameter Integer np(min = 1) = 1 "Number of parallel cells" annotation(Dialog(group = "Battery", tab = "ElectroMechanical"));
  parameter Modelica.SIunits.Voltage V1Cell = 4.2 "Maximum cell voltage > V0Cell" annotation(Dialog(group = "Battery", tab = "ElectroMechanical"));
  parameter Modelica.SIunits.Voltage V0Cell = 2.5 "Minimum cell voltage < V1Cell" annotation(Dialog(group = "Battery", tab = "ElectroMechanical"));
  parameter Boolean allowOvercharge = false
    "Allows overcharging without error" annotation(Dialog(group = "Battery", tab = "ElectroMechanical"));
  parameter Boolean allowUndercharge = false
    "Allows undercharging without error" annotation(Dialog(group = "Battery", tab = "ElectroMechanical"));
  parameter Modelica.SIunits.Energy ECell
    "Total cell energy between V0 and V1" annotation(Dialog(group = "Battery", tab = "ElectroMechanical"));
  parameter Modelica.SIunits.Resistance RCell = 0 "Internal cell resitance" annotation(Dialog(group = "Battery", tab = "ElectroMechanical"));
  parameter Modelica.SIunits.Voltage ViniCell = V1Cell "Initial cell voltage" annotation(Dialog(group = "Battery", tab = "ElectroMechanical"));
  extends ElectroMechanicalDrives.Components.Vehicles.Vehicle;
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio = i) annotation(Placement(transformation(extent={{-40,70},
            {-60,90}})));
  Machines.IdealCurrentFedMachine machine(final kBase = kBase, final wBase = wBase) annotation(Placement(transformation(extent={{-10,70},
            {-30,90}})));
  ElectroMechanicalDrives.Components.Electrical.IdealCurrentControlledConverter idealCurrentControlledConverter annotation(Placement(transformation(extent={{50,70},
            {30,90}})));
  Modelica.Blocks.Interfaces.RealInput iMachine "Machine current input" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  ElectroMechanicalDrives.Components.Electrical.Battery battery(final ns = ns, final np = np, final V1Cell = V1Cell, final V0Cell = V0Cell, final ECell = ECell, final RCell = RCell, final ViniCell = ViniCell, final allowOvercharge = allowOvercharge, final allowUndercharge = allowUndercharge) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={70,80})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent={{-30,40},
            {-10,60}})));
  Modelica.Electrical.Analog.Basic.Ground groundBattery annotation(Placement(transformation(extent={{60,40},
            {80,60}})));
  Modelica.Electrical.Analog.Basic.Resistor machineResistor(final R=Ra)   annotation(Placement(transformation(extent={{10,80},
            {-10,100}})));
  Modelica.Blocks.Math.Gain negative(final k=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,40})));
equation
  connect(idealGear.flange_a, machine.flange) annotation(Line(points={{-40,80},
          {-30,80}},                                                                             color = {0, 0, 0}, smooth = Smooth.None));
  connect(idealCurrentControlledConverter.dc_n2, machine.n) annotation(Line(points={{30,74},
          {20,74},{20,70},{-20,70}},                                                                                              color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealCurrentControlledConverter.dc_p1, battery.pin_p) annotation(Line(points={{50,86},
          {60,86},{60,90},{70,90}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealCurrentControlledConverter.dc_n1, battery.pin_n) annotation(Line(points={{50,74},
          {60,74},{60,70},{70,70}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.None));
  connect(ground.p, machine.n) annotation(Line(points={{-20,60},{-20,70}},    color = {0, 0, 255}, smooth = Smooth.None));
  connect(groundBattery.p, battery.pin_n) annotation(Line(points={{70,60},
          {70,70}},                                                                        color = {0, 0, 255}, smooth = Smooth.None));
  connect(machineResistor.n, machine.p) annotation(Line(points={{-10,90},
          {-20,90}},                                                                    color = {0, 0, 255}, smooth = Smooth.None));
  connect(machineResistor.p, idealCurrentControlledConverter.dc_p2) annotation(Line(points={{10,90},
          {20,90},{20,86},{30,86}},                                                                                                        color = {0, 0, 255}, smooth = Smooth.None));
  connect(inertia.flange_a, idealGear.flange_b) annotation (Line(points={
          {-80,60},{-80,80},{-60,80}}, color={0,0,0}));
  connect(negative.y, idealCurrentControlledConverter.i2) annotation (Line(points={{40,51},{40,68}},         color={0,0,127}));
  connect(negative.u, iMachine) annotation (Line(points={{40,28},{40,-80},{0,-80},{0,-120}}, color={0,0,127}));
  annotation(defaultComponentName="vehicle",Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-72, 28}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points={{
              -66,-36},{-86,-28},{-46,-16},{-86,-8},{-66,4}},                                                                                                                                                                                                        color = {255, 0, 0}, smooth = Smooth.Bezier),
                                                                                                  Rectangle(extent={{
              -16.5,16.5},{16.5,-16.5}},                                                                                                     lineColor = {0, 0, 0},
            fillPattern = FillPattern.VerticalCylinder, fillColor = {255, 255, 255},
          origin={-75.5,-59.5},
          rotation=90)}),
    Documentation(info="<html>
<p>This vehicle model considers<p>
<ul>
<li><a href=\"modelica://ElectroMechanicalDrives.Components.Translational.RollingFriction\">Rolling friction</a></li>
<li><a href=\"modelica://ElectroMechanicalDrives.Components.Translational.AthmosphericFriction\">Athmospheric friction</a></li>
<li>The effect of effective mass increase due to inertias</li>
<li>The impact of going up or down an inclined way by means of the constant angle parameter <code>constantAnge</code>
or the signal input <code>variableAngle</code>.</li>
<li>The vehicle has to translational sides and two roational axes to be driven</li>
<li>Ideal gear</li>
<li><a href=\"modelica://ElectroMechanicalDrives.Components.Machines.IdealCurrentFedMachine\">Ideal DC machine</a> including armature resistor considering field weakening range</li>
<li><a href=\"modelica://ElectroMechanicalDrives.Components.Electrical.IdealCurrentControlledConverter\">Ideal DC/DC converter</a></li>
<li><a href=\"modelica://ElectroMechanicalDrives.Components.Electrical.Battery\">Re-chargeable battery</a> with internal resistor</li>
</ul>
<h5>Note</h5>
<p>Do not change <code>v_linear</code> except this is required for numerical reasons</p>
</html>"));
end VehicleWithDriveLoss;
