using PyPlot
using ComplexEdu
using PlotEdu
if !isdefined(:colorCurrent1)
  using PlotColorTab20
end

figure(figsize=(3.3,2.8))
rc("text",usetex=true);
rc("text.latex",preamble="\\usepackage{fourier}\\usepackage[scaled=0.95]{inconsolata}");
rc("font", family="serif")

rel=0.2
t1=collect(-1:0.01:-rel);
t2=collect(-rel:0.01:rel);
t3=collect(rel:0.01:2);

y1=fill(-1.0,size(t1));
y3=fill(+1.0,size(t3));
y2=t2*y3[1]/t3[1];

plot(t1,y1,color="blue",linestyle=lineStyle1,linewidth=lineWidth1)
plot(t2,y2,color="blue",linestyle=lineStyle1,linewidth=lineWidth1)
plot(t3,y3,color="blue",linestyle=lineStyle1,linewidth=lineWidth1)
xlim(-1,1)
ylim(-1.1,1.1)
yticks([-1,0,1],["","",""])
xticks([-rel,0,rel],["",L"$\texttt{-v\_linear~~0~~v\_linear}$",""])
grid(true)
subplots_adjust(left=0.2, right=0.85, top=0.95, bottom=0.20)
xlabel(L"$\rightarrow~\texttt{v}$")
ylabel(L"$\rightarrow~\texttt{fRollingFriction}$")

save3fig("v_linear",dpi=96)
