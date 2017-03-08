within ElectroMechanicalDrives.Components.Translational;
model GenericAthmosphericFriction "Athomspheric friction"
  extends Modelica.Mechanics.Translational.Interfaces.PartialForce;
  parameter Modelica.SIunits.Force fRef= 1
    "Reference athmospheric friction force at reference speed vRef";
  parameter Modelica.SIunits.Velocity vRef = 1 "Reference speed";
  Modelica.SIunits.Velocity v "Velocity of flange";
  Modelica.Mechanics.Translational.Sources.QuadraticSpeedDependentForce quadraticSpeedDependentForce(final useSupport = useSupport,                                              final ForceDirection = false,
    final v_nominal=vRef,
    final f_nominal=-fRef)                                                                                                     annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));
equation
  v = der(s);
  connect(quadraticSpeedDependentForce.support, support) annotation(Line(points = {{0, -10}, {0, -100}}, color = {0, 127, 0}, pattern = LinePattern.None, smooth = Smooth.None));
  connect(quadraticSpeedDependentForce.flange, flange) annotation(Line(points = {{10, 0}, {100, 0}}, color = {0, 127, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics={
                                         Line(
              points={{-100,-100},{-80,-98},{-60,-92},{-40,-82},{-20,-68},{0,-50},{20,-28},{40,-2},{60,28},{80,62},{100,100}},
              color={0,0,127},
              smooth=Smooth.Bezier)},                                                                                                   coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Documentation(info="<html>
<p>
This model calculates represents a generic version of an athmospheric friction force. 
Friction force is determined as a function of the square of the speed. In this generic friction model 
the characteristic of the friction forcec is determined by the reference friction force <code>fRef</code> at the reference speed <code>v_ref</code>.
</p>
</html>"));
end GenericAthmosphericFriction;
