within ElectroMechanicalDrives.Components.Vehicles;
model VehicleWithDrive "Vehicle with friction"
  parameter Real i = 1 "Transmission speed ratio machine/wheel" annotation(Dialog(group = "Power train", tab = "ElectroMechanical"));
  parameter Modelica.Units.SI.ElectricalTorqueConstant kBase=1
    "Transformation coefficient of base velocity range"
    annotation (Dialog(group="Electric machine", tab="ElectroMechanical"));
  parameter Modelica.Units.SI.AngularVelocity wBase
    "Maximum base angular velocity"
    annotation (Dialog(group="Electric machine", tab="ElectroMechanical"));
  parameter Integer ns(min = 1) = 1 "Number of series cells" annotation(Dialog(group = "Battery", tab = "ElectroMechanical"));
  parameter Integer np(min = 1) = 1 "Number of parallel cells" annotation(Dialog(group = "Battery", tab = "ElectroMechanical"));
  parameter Modelica.Units.SI.Voltage V1Cell=4.2
    "Maximum cell voltage > V0Cell"
    annotation (Dialog(group="Battery", tab="ElectroMechanical"));
  parameter Modelica.Units.SI.Voltage V0Cell=2.5
    "Minimum cell voltage < V1Cell"
    annotation (Dialog(group="Battery", tab="ElectroMechanical"));
  parameter Boolean allowOvercharge = false
    "Allows overcharging without error" annotation(Dialog(group = "Battery", tab = "ElectroMechanical"));
  parameter Boolean allowUndercharge = false
    "Allows undercharging without error" annotation(Dialog(group = "Battery", tab = "ElectroMechanical"));
  parameter Modelica.Units.SI.Energy ECell
    "Total cell energy between V0 and V1"
    annotation (Dialog(group="Battery", tab="ElectroMechanical"));
  parameter Modelica.Units.SI.Voltage ViniCell=V1Cell "Initial cell voltage"
    annotation (Dialog(group="Battery", tab="ElectroMechanical"));
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
  ElectroMechanicalDrives.Components.Electrical.IdealBattery battery(final ns = ns, final np = np, final V1Cell = V1Cell, final V0Cell = V0Cell, final ECell = ECell, final ViniCell = ViniCell, final allowOvercharge = allowOvercharge, final allowUndercharge = allowUndercharge) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={70,80})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent={{-30,40},
            {-10,60}})));
  Modelica.Electrical.Analog.Basic.Ground groundBattery annotation(Placement(transformation(extent={{60,40},
            {80,60}})));
  Modelica.Blocks.Math.Gain negative(final k=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,40})));
equation
  connect(idealGear.flange_a, machine.flange) annotation(Line(points={{-40,80},{-30,80}},                                                                              color = {0, 0, 0}, smooth = Smooth.None));
  connect(idealCurrentControlledConverter.dc_n2, machine.n) annotation(Line(points={{30,74},
          {20,74},{20,70},{-20,70}},                                                                                                         color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealCurrentControlledConverter.dc_p1, battery.pin_p) annotation(Line(points={{50,86},
          {60,86},{60,90},{70,90}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealCurrentControlledConverter.dc_n1, battery.pin_n) annotation(Line(points={{50,74},
          {60,74},{60,70},{70,70}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.None));
  connect(ground.p, machine.n) annotation(Line(points={{-20,60},{-20,70}},    color = {0, 0, 255}, smooth = Smooth.None));
  connect(groundBattery.p, battery.pin_n) annotation(Line(points={{70,60},{70,70}},        color = {0, 0, 255}, smooth = Smooth.None));
  connect(machine.p, idealCurrentControlledConverter.dc_p2) annotation(Line(points={{-20,90},
          {20,90},{20,86},{30,86}},                                                                                                          color = {0, 0, 255}, smooth = Smooth.None));
  connect(idealGear.flange_b, inertia.flange_a) annotation (Line(points={{-60,80},
          {-70,80},{-70,80},{-80,80},{-80,60}}, color={0,0,0}));
  connect(negative.y, idealCurrentControlledConverter.i2) annotation (Line(points={{40,51},{40,68}},         color={0,0,127}));
  connect(negative.u, iMachine) annotation (Line(points={{40,28},{40,-80},{0,-80},{0,-120}}, color={0,0,127}));
  annotation(defaultComponentName="vehicle",Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),           Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={
                                                                                                                                                                                                  Rectangle(extent={{
              -16.5,15.5},{16.5,-15.5}},                                                                                                                                                                                                       lineColor = {0, 0, 0},
            fillPattern =                                                                                                   FillPattern.VerticalCylinder, fillColor = {255, 255, 255},
          origin={-75.5,-60.5},
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
<li><a href=\"modelica://ElectroMechanicalDrives.Components.Machines.IdealCurrentFedMachine\">Ideal DC machine</a> considering field weakening range</li>
<li><a href=\"modelica://ElectroMechanicalDrives.Components.Electrical.IdealCurrentControlledConverter\">Ideal DC/DC converter</a></li>
<li><a href=\"modelica://ElectroMechanicalDrives.Components.Electrical.IdealBattery\">Re-chargeable ideal battery</a></li>
</ul>
<h5>Note</h5>
<p>Do not change <code>v_linear</code> except this is required for numerical reasons</p>
</html>"));
end VehicleWithDrive;
