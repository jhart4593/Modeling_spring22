function HW4_test
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
    
    P0 = 1000;
    
    xV0 = [0;0;0;P0];
    tspan = [0 0.15];
    [tV,xV] = ode45(@(tV,xV) odefun(tV,xV,J_i,L,K,J_m,B_m,d_m,d_p,A,K_pl,wp,Tl,K_ml,B_i,C_f),tspan,xV0);
    
    plot(tV,xV(:,4))
    %legend('wm','phi')
    
end

    function xVdot = odefun(tV,xV,J_i,L,K,J_m,B_m,d_m,d_p,A,K_pl,wp,Tl,K_ml,B_i,C_f)
        xVdot = [xV(2);
            1/J_i*(-L*cos(xV(1))*(K*L*sin(xV(1))+A*xV(4))-B_i*xV(2));
            1/J_m*(d_m*xV(4)-B_m*xV(3)+Tl);
            1/C_f*(-d_m*xV(3)+wp*d_p*xV(1)-xV(4)*(K_pl+K_ml));];
        return
    end