function HW4_pump
    J_i = 0.1;
    L = 1;
    K = 100;
    J_m = 0.043;
    B_m = 20;
    d_m = 0.486;
    d_p = 1;
    A = 0.5;
    K_pl = 0.0006;
    wp = 180;
    Tl = 0;
    K_ml = 0.0004;
    B_i = 50;
    C_f = 0.0001;
    
    Vf0 = 1000*C_f;
    
    xV0 = [0;0;0;0;Vf0];
    tspan = [0 0.15];
    [tV,xV] = ode45(@(tV,xV) odefun(tV,xV,J_i,L,K,J_m,B_m,d_m,d_p,A,K_pl,wp,Tl,K_ml,B_i,C_f),tspan,xV0);
    
    wm = xV(:,4)./J_m;
    phi = xV(:,1);
    p = xV(:,5)./C_f;
    
    plot(tV,p)
    legend('wm','phi')
    
end

    function xVdot = odefun(tV,xV,J_i,L,K,J_m,B_m,d_m,d_p,A,K_pl,wp,Tl,K_ml,B_i,C_f)
        xVdot = [xV(3)/J_i;
            L*cos(xV(1))*xV(3)/J_i;
            -L*cos(xV(1))*(K*xV(2)+A/C_f*xV(5))-B_i/J_i*xV(3);
            d_m/C_f*xV(5)-B_m/J_m*xV(4)+Tl;
            -(K_pl+K_ml)*xV(5)/C_f-d_m/J_m*xV(4)+wp*d_p*xV(1)];
        return
    end