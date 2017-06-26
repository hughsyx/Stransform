cc_07_15_filt_5 = zeros(1,7999);
for iwin = 1:96
    ST06 = stran_my(C1_A01_82_filt(18000+8000:18000+12000-1,iwin,6)',0.05);
    ST07 = stran_my(C1_A01_82_filt(18000+8000:18000+12000-1,iwin,7)',0.05);
    ST08 = stran_my(C1_A01_82_filt(18000+8000:18000+12000-1,iwin,8)',0.05);
    ST09 = stran_my(C1_A01_82_filt(18000+8000:18000+12000-1,iwin,9)',0.05);
    ST10 = stran_my(C1_A01_82_filt(18000+8000:18000+12000-1,iwin,10)',0.05);
    ST11 = stran_my(C1_A01_82_filt(18000+8000:18000+12000-1,iwin,11)',0.05);
    ST12 = stran_my(C1_A01_82_filt(18000+8000:18000+12000-1,iwin,12)',0.05);
    ST13 = stran_my(C1_A01_82_filt(18000+8000:18000+12000-1,iwin,13)',0.05);
    ST14 = stran_my(C1_A01_82_filt(18000+8000:18000+12000-1,iwin,14)',0.05);
    ST15 = stran_my(C1_A01_82_filt(18000+8000:18000+12000-1,iwin,15)',0.05);
    Phi06 = angle(ST06);
    Phi07 = angle(ST07);
    Phi08 = angle(ST08);
    Phi09 = angle(ST09);
    Phi10 = angle(ST10);
    Phi11 = angle(ST11);
    Phi12 = angle(ST12);
    Phi13 = angle(ST13);
    Phi14 = angle(ST14);
    Phi15 = angle(ST15);
    d07 = distance(latlon(7,1),latlon(7,2),latlon(6:15,1),latlon(6:15,2),almanac('earth','ellipsoid'));
    d15 = distance(latlon(15,1),latlon(15,2),latlon(6:15,1),latlon(6:15,2),almanac('earth','ellipsoid'));
    for i=1:length(s)
        for j=1:length(d07)
            delta(i,j) = d07(j)*s(i);
        end
    end
    delta_Ind = fix(delta/0.05);
    
    c1 = zeros(size(ST06));
    for i=max(delta_Ind(1,:)+1):4000-max(delta_Ind(1,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(1,1))+2*pi*f(j)*delta(1,1)));
        tmp = tmp+exp(1i*(Phi07(j,i+delta_Ind(1,2))-2*pi*f(j)*delta(1,2)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(1,3))+2*pi*f(j)*delta(1,3)));
        tmp = tmp+exp(1i*(Phi09(j,i+delta_Ind(1,4))-2*pi*f(j)*delta(1,4)));
        tmp = tmp+exp(1i*(Phi10(j,i+delta_Ind(1,5))-2*pi*f(j)*delta(1,5)));
        tmp = tmp+exp(1i*(Phi11(j,i+delta_Ind(1,6))-2*pi*f(j)*delta(1,6)));
        tmp = tmp+exp(1i*(Phi12(j,i+delta_Ind(1,7))-2*pi*f(j)*delta(1,7)));
        tmp = tmp+exp(1i*(Phi13(j,i+delta_Ind(1,8))-2*pi*f(j)*delta(1,8)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(1,9))-2*pi*f(j)*delta(1,9)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(1,10))-2*pi*f(j)*delta(1,10)));
        c1(j,i) = tmp/10;
        end
    end
    c1 = abs(c1);
    c2 = zeros(size(ST06));
    for i=max(delta_Ind(2,:)+1):4000-max(delta_Ind(2,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(2,1))+2*pi*f(j)*delta(2,1)));
        tmp = tmp+exp(1i*(Phi07(j,i+delta_Ind(2,2))-2*pi*f(j)*delta(2,2)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(2,3))+2*pi*f(j)*delta(2,3)));
        tmp = tmp+exp(1i*(Phi09(j,i+delta_Ind(2,4))-2*pi*f(j)*delta(2,4))); 
        tmp = tmp+exp(1i*(Phi10(j,i+delta_Ind(2,5))-2*pi*f(j)*delta(2,5)));
        tmp = tmp+exp(1i*(Phi11(j,i+delta_Ind(2,6))-2*pi*f(j)*delta(2,6)));
        tmp = tmp+exp(1i*(Phi12(j,i+delta_Ind(2,7))-2*pi*f(j)*delta(2,7)));
        tmp = tmp+exp(1i*(Phi13(j,i+delta_Ind(2,8))-2*pi*f(j)*delta(2,8)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(2,9))-2*pi*f(j)*delta(2,9)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(2,10))-2*pi*f(j)*delta(2,10)));
        c2(j,i) = max(abs(tmp)/10,c1(j,i));
        end
    end
    c3 = zeros(size(ST06));
    for i=max(delta_Ind(3,:)+1):4000-max(delta_Ind(3,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(3,1))+2*pi*f(j)*delta(3,1)));
        tmp = tmp+exp(1i*(Phi07(j,i+delta_Ind(3,2))-2*pi*f(j)*delta(3,2)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(3,3))+2*pi*f(j)*delta(3,3)));
        tmp = tmp+exp(1i*(Phi09(j,i+delta_Ind(3,4))-2*pi*f(j)*delta(3,4)));
        tmp = tmp+exp(1i*(Phi10(j,i+delta_Ind(3,5))-2*pi*f(j)*delta(3,5)));
        tmp = tmp+exp(1i*(Phi11(j,i+delta_Ind(3,6))-2*pi*f(j)*delta(3,6)));
        tmp = tmp+exp(1i*(Phi12(j,i+delta_Ind(3,7))-2*pi*f(j)*delta(3,7)));
        tmp = tmp+exp(1i*(Phi13(j,i+delta_Ind(3,8))-2*pi*f(j)*delta(3,8)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(3,9))-2*pi*f(j)*delta(3,9)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(3,10))-2*pi*f(j)*delta(3,10)));
        c3(j,i) = max(abs(tmp)/10,c2(j,i));
        end
    end
    c4 = zeros(size(ST06));
    for i=max(delta_Ind(4,:)+1):4000-max(delta_Ind(4,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(4,1))+2*pi*f(j)*delta(4,1)));
        tmp = tmp+exp(1i*(Phi07(j,i+delta_Ind(4,2))-2*pi*f(j)*delta(4,2)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(4,3))+2*pi*f(j)*delta(4,3)));
        tmp = tmp+exp(1i*(Phi09(j,i+delta_Ind(4,4))-2*pi*f(j)*delta(4,4)));
        tmp = tmp+exp(1i*(Phi10(j,i+delta_Ind(4,5))-2*pi*f(j)*delta(4,5)));
        tmp = tmp+exp(1i*(Phi11(j,i+delta_Ind(4,6))-2*pi*f(j)*delta(4,6)));
        tmp = tmp+exp(1i*(Phi12(j,i+delta_Ind(4,7))-2*pi*f(j)*delta(4,7)));
        tmp = tmp+exp(1i*(Phi13(j,i+delta_Ind(4,8))-2*pi*f(j)*delta(4,8)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(4,9))-2*pi*f(j)*delta(4,9)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(4,10))-2*pi*f(j)*delta(4,10)));
        c4(j,i) = max(abs(tmp)/10,c3(j,i));
        end
    end
    c5 = zeros(size(ST06));
    for i=max(delta_Ind(5,:)+1):4000-max(delta_Ind(5,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(5,1))+2*pi*f(j)*delta(5,1)));
        tmp = tmp+exp(1i*(Phi07(j,i+delta_Ind(5,2))-2*pi*f(j)*delta(5,2)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(5,3))+2*pi*f(j)*delta(5,3)));
        tmp = tmp+exp(1i*(Phi09(j,i+delta_Ind(5,4))-2*pi*f(j)*delta(5,4)));
        tmp = tmp+exp(1i*(Phi10(j,i+delta_Ind(5,5))-2*pi*f(j)*delta(5,5)));
        tmp = tmp+exp(1i*(Phi11(j,i+delta_Ind(5,6))-2*pi*f(j)*delta(5,6)));
        tmp = tmp+exp(1i*(Phi12(j,i+delta_Ind(5,7))-2*pi*f(j)*delta(5,7)));
        tmp = tmp+exp(1i*(Phi13(j,i+delta_Ind(5,8))-2*pi*f(j)*delta(5,8)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(5,9))-2*pi*f(j)*delta(5,9)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(5,10))-2*pi*f(j)*delta(5,10)));
        c5(j,i) = max(abs(tmp)/10,c4(j,i));
        end
    end
    c5_5 = c5.^5;
    c5_5 = c5_5/max(max(abs(c5_5)));
    ST07_filt_5 = ST07.*c5_5;
    C1_A01_07_filt_5 = inv_stran_my(ST07_filt_5,0.05);
    clear c1 c2 c3 c4 c5 c5_5 tmp

    for i=1:length(s)
        for j=1:length(d15)
            delta(i,j) = d15(j)*s(i);
        end
    end
    delta_Ind = fix(delta/0.05);
    
    c1 = zeros(size(ST06));
    for i=max(delta_Ind(1,:)+1):4000-max(delta_Ind(1,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(1,1))+2*pi*f(j)*delta(1,1)));
        tmp = tmp+exp(1i*(Phi07(j,i-delta_Ind(1,2))+2*pi*f(j)*delta(1,2)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(1,3))+2*pi*f(j)*delta(1,3)));
        tmp = tmp+exp(1i*(Phi09(j,i-delta_Ind(1,4))+2*pi*f(j)*delta(1,4)));
        tmp = tmp+exp(1i*(Phi10(j,i-delta_Ind(1,5))+2*pi*f(j)*delta(1,5)));
        tmp = tmp+exp(1i*(Phi11(j,i-delta_Ind(1,6))+2*pi*f(j)*delta(1,6)));
        tmp = tmp+exp(1i*(Phi12(j,i-delta_Ind(1,7))+2*pi*f(j)*delta(1,7)));
        tmp = tmp+exp(1i*(Phi13(j,i-delta_Ind(1,8))+2*pi*f(j)*delta(1,8)));
        tmp = tmp+exp(1i*(Phi14(j,i-delta_Ind(1,9))+2*pi*f(j)*delta(1,9)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(1,10))-2*pi*f(j)*delta(1,10)));
        c1(j,i) = tmp/10;
        end
    end
    c1 = abs(c1);
    c2 = zeros(size(ST06));
    for i=max(delta_Ind(2,:)+1):4000-max(delta_Ind(2,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(2,1))+2*pi*f(j)*delta(2,1)));
        tmp = tmp+exp(1i*(Phi07(j,i-delta_Ind(2,2))+2*pi*f(j)*delta(2,2)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(2,3))+2*pi*f(j)*delta(2,3)));
        tmp = tmp+exp(1i*(Phi09(j,i-delta_Ind(2,4))+2*pi*f(j)*delta(2,4))); 
        tmp = tmp+exp(1i*(Phi10(j,i-delta_Ind(2,5))+2*pi*f(j)*delta(2,5)));
        tmp = tmp+exp(1i*(Phi11(j,i-delta_Ind(2,6))+2*pi*f(j)*delta(2,6)));
        tmp = tmp+exp(1i*(Phi12(j,i-delta_Ind(2,7))+2*pi*f(j)*delta(2,7)));
        tmp = tmp+exp(1i*(Phi13(j,i-delta_Ind(2,8))+2*pi*f(j)*delta(2,8)));
        tmp = tmp+exp(1i*(Phi14(j,i-delta_Ind(2,9))+2*pi*f(j)*delta(2,9)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(2,10))-2*pi*f(j)*delta(2,10)));
        c2(j,i) = max(abs(tmp)/10,c1(j,i));
        end
    end
    c3 = zeros(size(ST06));
    for i=max(delta_Ind(3,:)+1):4000-max(delta_Ind(3,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(3,1))+2*pi*f(j)*delta(3,1)));
        tmp = tmp+exp(1i*(Phi07(j,i-delta_Ind(3,2))+2*pi*f(j)*delta(3,2)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(3,3))+2*pi*f(j)*delta(3,3)));
        tmp = tmp+exp(1i*(Phi09(j,i-delta_Ind(3,4))+2*pi*f(j)*delta(3,4)));
        tmp = tmp+exp(1i*(Phi10(j,i-delta_Ind(3,5))+2*pi*f(j)*delta(3,5)));
        tmp = tmp+exp(1i*(Phi11(j,i-delta_Ind(3,6))+2*pi*f(j)*delta(3,6)));
        tmp = tmp+exp(1i*(Phi12(j,i-delta_Ind(3,7))+2*pi*f(j)*delta(3,7)));
        tmp = tmp+exp(1i*(Phi13(j,i-delta_Ind(3,8))+2*pi*f(j)*delta(3,8)));
        tmp = tmp+exp(1i*(Phi14(j,i-delta_Ind(3,9))+2*pi*f(j)*delta(3,9)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(3,10))-2*pi*f(j)*delta(3,10)));
        c3(j,i) = max(abs(tmp)/10,c2(j,i));
        end
    end
    c4 = zeros(size(ST06));
    for i=max(delta_Ind(4,:)+1):4000-max(delta_Ind(4,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(4,1))+2*pi*f(j)*delta(4,1)));
        tmp = tmp+exp(1i*(Phi07(j,i-delta_Ind(4,2))+2*pi*f(j)*delta(4,2)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(4,3))+2*pi*f(j)*delta(4,3)));
        tmp = tmp+exp(1i*(Phi09(j,i-delta_Ind(4,4))+2*pi*f(j)*delta(4,4)));
        tmp = tmp+exp(1i*(Phi10(j,i-delta_Ind(4,5))+2*pi*f(j)*delta(4,5)));
        tmp = tmp+exp(1i*(Phi11(j,i-delta_Ind(4,6))+2*pi*f(j)*delta(4,6)));
        tmp = tmp+exp(1i*(Phi12(j,i-delta_Ind(4,7))+2*pi*f(j)*delta(4,7)));
        tmp = tmp+exp(1i*(Phi13(j,i-delta_Ind(4,8))+2*pi*f(j)*delta(4,8)));
        tmp = tmp+exp(1i*(Phi14(j,i-delta_Ind(4,9))+2*pi*f(j)*delta(4,9)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(4,10))-2*pi*f(j)*delta(4,10)));
        c4(j,i) = max(abs(tmp)/10,c3(j,i));
        end
    end
    c5 = zeros(size(ST06));
    for i=max(delta_Ind(5,:)+1):4000-max(delta_Ind(5,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(5,1))+2*pi*f(j)*delta(5,1)));
        tmp = tmp+exp(1i*(Phi07(j,i-delta_Ind(5,2))+2*pi*f(j)*delta(5,2)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(5,3))+2*pi*f(j)*delta(5,3)));
        tmp = tmp+exp(1i*(Phi09(j,i-delta_Ind(5,4))+2*pi*f(j)*delta(5,4)));
        tmp = tmp+exp(1i*(Phi10(j,i-delta_Ind(5,5))+2*pi*f(j)*delta(5,5)));
        tmp = tmp+exp(1i*(Phi11(j,i-delta_Ind(5,6))+2*pi*f(j)*delta(5,6)));
        tmp = tmp+exp(1i*(Phi12(j,i-delta_Ind(5,7))+2*pi*f(j)*delta(5,7)));
        tmp = tmp+exp(1i*(Phi13(j,i-delta_Ind(5,8))+2*pi*f(j)*delta(5,8)));
        tmp = tmp+exp(1i*(Phi14(j,i-delta_Ind(5,9))+2*pi*f(j)*delta(5,9)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(5,10))-2*pi*f(j)*delta(5,10)));
        c5(j,i) = max(abs(tmp)/10,c4(j,i));
        end
    end
    c5_5 = c5.^5;
    c5_5 = c5_5/max(max(abs(c5_5)));
    ST15_filt_5 = ST15.*c5_5;
    C1_A01_15_filt_5 = inv_stran_my(ST15_filt_5,0.05);
    
    clear c1 c2 c3 c4 c5 c5_5 ST06 ST07 ST08 ST09 ST10 ST11 ST12 ST13 ST14 ST15 Phi*
    cc_07_15_filt_5 = cc_07_15_filt_5 + real(ifftshift(ifft(fft(C1_A01_15_filt_5,7999).*conj(fft(C1_A01_07_filt_5,7999)))));
end