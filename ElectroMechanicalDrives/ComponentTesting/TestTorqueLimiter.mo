within ElectroMechanicalDrives.ComponentTesting;
model TestTorqueLimiter "Testing of torque limiter"
  extends Modelica.Icons.Example;
  Components.Machines.TorqueLimiter torqueLimiter(tauLimit=100, wBase=100)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Ramp ramp_w(
    height=400,
    duration=0.5,
    offset=-200)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Blocks.Sources.Ramp ramp_tau(
    duration=0.5,
    height=-400,
    offset=200,
    startTime=0.5)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(ramp_w.y, torqueLimiter.w) annotation (Line(points={{-39,-30},{
          -22,-30},{0,-30},{0,-12}}, color={0,0,127}));
  connect(ramp_tau.y, torqueLimiter.tau)
    annotation (Line(points={{-39,0},{-26,0},{-12,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}})));
end TestTorqueLimiter;
