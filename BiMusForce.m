function [F_total,F_pee,F_ce] = BiMusForce(a,x,x_dot)
%Creates a simple muscle with position, velocity
%Inputs: 
%        a - muscle activation 0-1
%        x - position of the mass (m)
%        x_dot - velocity of the mass (m/s)
%Outputs:
%        F_total = force of the muscle for the given inputs
%        F_pee = force of the parallel elastic element
%        F_ce = force of the contractile element
W  = 0.63;
Lceopt = 0.1028;
Lslack = 0.0175;	
k_pee=75;
Fmax = 700;

Vmax = 10*Lceopt;
A = 0.25;
gmax = 1.5;
c = Vmax*A*(gmax-1)/(A+1);

Lce=x;
if abs(x) > Lslack
    F_pee=k_pee*(x-Lslack)^2;
else
    F_pee=0;
end
F_total = F_pee;
F_ce = 0;

if a~=0
    if x_dot <= 0
        gLce_dot = (Vmax + x_dot)/(Vmax - x_dot/A);
    elseif x_dot > 0
        gLce_dot = (gmax*x_dot + c)/(x_dot+c);
    end
force_length=exp(-1.*(((Lce-Lceopt)./(W.*Lceopt)).^2));
F_ce = a*Fmax*force_length*gLce_dot;
F_total=F_ce+F_pee;
end

end