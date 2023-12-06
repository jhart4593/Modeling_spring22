function HW4_NL_mass
    L = 1; %m
    m = 0.1; %kg
    T = 100; %N
    x0 = 1; %m
    xV0 = [x0;0];
    tspan = [0 1];
    [tV,xV] = ode45(@(tV,xV) odefun(tV,xV,L,m,T),tspan,xV0);
    plot(tV,xV)
    legend('x','p')
    
end

    function xVdot = odefun(tV,xV,L,m,T)
        xVdot = [xV(2)/m;
            -2*T*(xV(1)/sqrt(L^2+xV(1)^2))];
        return
    end
    