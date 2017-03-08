using PyPlot

figure(figsize=(4.5,3))
vlinear=0.2
x=[-1,-vlinear,vlinear,1]
y=[-1,-1,1,1]
plot(x,y,color="black",linewidth=2)
xticks([-vlinear,0,vlinear],["\$-v_\\mathrm{linear}\$","","\$+v_\\mathrm{linear}\$"])
yticks([-1,0,1],["\$-f_\\mathrm{constant}\$","\$0\$","-\$+f_\\mathrm{constant}\$"])
xlabel("\$v\$")
ylabel("\$f\$")
ylim(-1.1,1.1)
grid(true)
subplots_adjust(left=0.25, right=0.95, top=0.95, bottom=0.15)
savefig("friction.png")
# savefig("friction.pdf")
