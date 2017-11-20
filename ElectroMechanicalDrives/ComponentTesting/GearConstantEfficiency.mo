within ElectroMechanicalDrives.ComponentTesting;
model GearConstantEfficiency "Test gear with constant efficiency"
  extends Modelica.Icons.Example;
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation (Placement(transformation(extent={{-70,22},{-50,42}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation (Placement(transformation(extent={{70,22},{50,42}})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor power_a1 annotation (Placement(transformation(extent={{-40,22},{-20,42}})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor power_b1 annotation (Placement(transformation(extent={{20,22},{40,42}})));
  Components.Rotational.GearConstantEfficiency gearConstantEfficiency1(ratio=2, efficiency=0.8) annotation (Placement(transformation(extent={{-10,22},{10,42}})));
  Modelica.Blocks.Sources.Ramp rampSpeed1(height=10, duration=0.5) annotation (Placement(transformation(extent={{-100,22},{-80,42}})));
  Modelica.Blocks.Sources.Ramp rampTorque1(
    height=10,
    duration=0.5,
    startTime=0.5,
    offset=-5) annotation (Placement(transformation(extent={{100,22},{80,42}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed2 annotation (Placement(transformation(extent={{-70,-20},{-50,0}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque2 annotation (Placement(transformation(extent={{70,-20},{50,0}})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor power_a2 annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor power_b2 annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Components.Rotational.GearConstantEfficiency gearConstantEfficiency2(
    ratio=2,
    useHeatPort=true,
    efficiency=0.8) annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  Modelica.Blocks.Sources.Ramp rampSpeed2(height=10, duration=0.5) annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
  Modelica.Blocks.Sources.Ramp rampTorque2(
    height=10,
    duration=0.5,
    startTime=0.5,
    offset=-5) annotation (Placement(transformation(extent={{100,-20},{80,0}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=293.15) annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
equation
  connect(power_a1.flange_b, gearConstantEfficiency1.flange_a) annotation (Line(points={{-20,32},{-10,32}}, color={0,0,0}));
  connect(gearConstantEfficiency1.flange_b, power_b1.flange_a) annotation (Line(points={{10,32},{20,32}}, color={0,0,0}));
  connect(rampSpeed1.y, speed1.w_ref) annotation (Line(points={{-79,32},{-72,32}}, color={0,0,127}));
  connect(speed1.flange, power_a1.flange_a) annotation (Line(points={{-50,32},{-40,32}}, color={0,0,0}));
  connect(power_b1.flange_b, torque1.flange) annotation (Line(points={{40,32},{50,32}}, color={0,0,0}));
  connect(torque1.tau, rampTorque1.y) annotation (Line(points={{72,32},{79,32}}, color={0,0,127}));
  connect(power_a2.flange_b, gearConstantEfficiency2.flange_a) annotation (Line(points={{-20,-10},{-10,-10}}, color={0,0,0}));
  connect(gearConstantEfficiency2.flange_b, power_b2.flange_a) annotation (Line(points={{10,-10},{20,-10}}, color={0,0,0}));
  connect(rampSpeed2.y, speed2.w_ref) annotation (Line(points={{-79,-10},{-72,-10}}, color={0,0,127}));
  connect(speed2.flange, power_a2.flange_a) annotation (Line(points={{-50,-10},{-40,-10}}, color={0,0,0}));
  connect(power_b2.flange_b, torque2.flange) annotation (Line(points={{40,-10},{50,-10}}, color={0,0,0}));
  connect(torque2.tau, rampTorque2.y) annotation (Line(points={{72,-10},{79,-10}}, color={0,0,127}));
  connect(fixedTemperature.port, gearConstantEfficiency2.heatPort) annotation (Line(points={{-20,-50},{-16,-50},{-16,-50},{-10,-50},{-10,-20}}, color={191,0,0}));
end GearConstantEfficiency;
