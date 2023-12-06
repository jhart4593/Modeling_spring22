function HW4_final
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
    K_ml1 = 0;
    K_ml2 = 0.0004;
    B_i = 50;
    C_f = 0.0001;
    
    P01 = 1000;
    phi01 = .003335;
    omegam01 = 0;
    
    xV10 = [phi01;0];
    tspan1 = [0 0.0029];
    [tV1,xV1] = ode45(@(tV1,xV1) odefun1(tV1,xV1,J_i,L,K,J_m,B_m,d_m,d_p,A,K_pl,wp,Tl,K_ml1,B_i,C_f,P01),tspan1,xV10);
    
    xV20 = [xV1(end,1);xV1(end,2);0;1000];
    tspan2 = [0.003 0.15];
    [tV2,xV2] = ode45(@(tV2,xV2) odefun2(tV2,xV2,J_i,L,K,J_m,B_m,d_m,d_p,A,K_pl,wp,Tl,K_ml2,B_i,C_f),tspan2,xV20);
    
    tV1
    
%     tV1 = 
%     extraxV = 
%     
%     tV = [tV1;tV2]
%     xV = [xV1;xV2]
    
    tiledlayout(1,3)
    nexttile
    plot(tV,xV(:,3))
    title('Omegam')
    nexttile
    plot(tV,xV(:,1))
    title('Phi')
    nexttile
    plot(tV,xV(:,4))
    title('P')
    
end

    %function from t = 0 to 0.003
    function xVdot1 = odefun1(tV1,xV1,J_i,L,K,J_m,B_m,d_m,d_p,A,K_pl,wp,Tl,K_ml1,B_i,C_f,P01)
        xVdot1 = [xV1(2);
            1/J_i*(-L*(K*L*xV1(1)+A*P01))-B_i*xV1(2));
        return
    end
    
    %function from t = 0.003 to end
    function xVdot2 = odefun2(tV2,xV2,J_i,L,K,J_m,B_m,d_m,d_p,A,K_pl,wp,Tl,K_ml2,B_i,C_f)
        xVdot2 = [xV2(2);
            1/J_i*(-L*(K*L*xV2(1)+A*xV2(4))-B_i*xV2(2));
            1/J_m*(d_m*xV2(4)-B_m*xV2(3)+Tl);
            1/C_f*(A*L*xV2(2)-d_m*xV2(3)+wp*d_p*xV2(1)-xV2(4)*(K_pl+K_ml2));];
        return
    end