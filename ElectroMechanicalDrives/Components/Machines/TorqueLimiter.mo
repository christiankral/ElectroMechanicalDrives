within ElectroMechanicalDrives.Components.Machines;
block TorqueLimiter "Torque limiter including field weakening"

  Modelica.Blocks.Interfaces.RealInput tau "Torque" annotation (Placement(
        transformation(extent={{-140,-20},{-100,20}}), iconTransformation(
          extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput w annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Modelica.Blocks.Interfaces.RealOutput tauLimited "Limited torque" annotation (
     Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
  Modelica.SIunits.Torque tauLimitPos "Torque, limited by tauLimit";
  parameter Boolean useFieldWeakening = true
    "True, if field weakening is considered";
  parameter Modelica.SIunits.Torque tauLimit = Modelica.Constants.inf
    "Torque limit (nominal torque)";
  parameter Modelica.SIunits.AngularVelocity wBase = Modelica.Constants.inf
    "Base angular frequency"  annotation(Dialog(enable=useFieldWeakening));
equation
  tauLimitPos = if useFieldWeakening then smooth(1, if w > wBase then tauLimit * wBase / w else if w < (-wBase) then -tauLimit * wBase / w else tauLimit) else tauLimit;
  tauLimited = max(min(tau,tauLimitPos),-tauLimitPos);

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}),
                                     graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255}),
        Line(points={{-60,-60},{60,-60}}, color={28,108,200}),
        Line(points={{-60,40},{0,40},{10,24},{20,10},{30,0},{40,-8},{50,-16},{60,
              -20}}, color={28,108,200}),
        Line(points={{-60,-60},{-60,60},{-54,60},{-60,80},{-66,60},{-60,60}},
            color={28,108,200}),
        Line(points={{60,-60},{60,-54},{80,-60},{60,-66},{60,-60}}, color={28,108,
              200})}),
    Documentation(info="<html>
<p>
This block enables a simplified approach of torque deduction due by field weakening.
The field weakening behavior is characterized by:</p>

    <ul>
    <li>the maximum torque of the machine, <code>tauLimit</code> for <code>w &le; wBase</code></li>
    <li>the base speed limit <code>wBase</code><li>
    <li>torque reduction proportial to <code>wBase/w</code> for <code>w &gt; wBase</code></li> 
</html>"));
end TorqueLimiter;
