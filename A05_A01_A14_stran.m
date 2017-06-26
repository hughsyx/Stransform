clear cc_05_14_filt_5_tmp
Day = [77,78,79,80,81,82,83,84,85];
for iday = 1:length(Day)
    day = Day(iday)
cc_05_14_filt_5 = zeros(1,7999);
tic
for iwin = 1:96
%     ST04 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,4)',0.05);
%     ST05 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,5)',0.05);
%     ST06 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,6)',0.05);
%     ST07 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,7)',0.05);
%     ST08 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,8)',0.05);
%     ST09 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,9)',0.05);
%     ST10 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,10)',0.05);
%     ST11 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,11)',0.05);
%     ST12 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,12)',0.05);
%     ST13 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,13)',0.05);
%     ST14 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,14)',0.05);
%     ST15 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,15)',0.05);
%     ST16 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,16)',0.05);
%     ST17 = stran_my(C1_A01_80_filt(18000+000:18000+4000-1,iwin,17)',0.05);
    ST04 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,4)'])',0.05);
    ST05 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,5)'])',0.05);
    ST06 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,6)'])',0.05);
    ST07 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,7)'])',0.05);
    ST08 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,8)'])',0.05);
    ST09 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,9)'])',0.05);
    ST10 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,10)'])',0.05);
    ST11 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,11)'])',0.05);
    ST12 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,12)'])',0.05);
    ST13 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,13)'])',0.05);
    ST14 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,14)'])',0.05);
    ST15 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,15)'])',0.05);
    ST16 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,16)'])',0.05);
    ST17 = stran_my(eval(['C1_A01_',num2str(day),'_filt(18000+000:18000+4000-1,iwin,17)'])',0.05);
    
    Phi04 = angle(ST04);
    Phi05 = angle(ST05);
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
    Phi16 = angle(ST16);
    Phi17 = angle(ST17);
    d05 = distance(latlon(5,1),latlon(5,2),latlon(4:17,1),latlon(4:17,2),almanac('earth','ellipsoid'));
    d14 = distance(latlon(14,1),latlon(14,2),latlon(4:17,1),latlon(4:17,2),almanac('earth','ellipsoid'));
    for i=1:length(s)
        for j=1:length(d05)
            delta(i,j) = d05(j)*s(i);
        end
    end
    delta_Ind = fix(delta/0.05);
    
    c1 = zeros(size(ST06));
    for i=max(delta_Ind(1,:)+1):4000-max(delta_Ind(1,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi04(j,i-delta_Ind(1,1))+2*pi*f(j)*delta(1,1)));
        tmp = tmp+exp(1i*(Phi05(j,i+delta_Ind(1,2))-2*pi*f(j)*delta(1,2)));
        tmp = tmp+exp(1i*(Phi06(j,i+delta_Ind(1,3))-2*pi*f(j)*delta(1,3)));
        tmp = tmp+exp(1i*(Phi07(j,i+delta_Ind(1,4))-2*pi*f(j)*delta(1,4)));
        tmp = tmp+exp(1i*(Phi08(j,i+delta_Ind(1,5))-2*pi*f(j)*delta(1,5)));
        tmp = tmp+exp(1i*(Phi09(j,i+delta_Ind(1,6))-2*pi*f(j)*delta(1,6)));
        tmp = tmp+exp(1i*(Phi10(j,i+delta_Ind(1,7))-2*pi*f(j)*delta(1,7)));
        tmp = tmp+exp(1i*(Phi11(j,i+delta_Ind(1,8))-2*pi*f(j)*delta(1,8)));
        tmp = tmp+exp(1i*(Phi12(j,i+delta_Ind(1,9))-2*pi*f(j)*delta(1,9)));
        tmp = tmp+exp(1i*(Phi13(j,i+delta_Ind(1,10))-2*pi*f(j)*delta(1,10)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(1,11))-2*pi*f(j)*delta(1,11)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(1,12))-2*pi*f(j)*delta(1,12)));
        tmp = tmp+exp(1i*(Phi16(j,i+delta_Ind(1,13))-2*pi*f(j)*delta(1,13)));
        tmp = tmp+exp(1i*(Phi17(j,i+delta_Ind(1,14))-2*pi*f(j)*delta(1,14)));
        c1(j,i) = tmp/14;
        end
    end
    c1 = abs(c1);
    c2 = zeros(size(ST06));
    for i=max(delta_Ind(2,:)+1):4000-max(delta_Ind(2,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi04(j,i-delta_Ind(2,1))+2*pi*f(j)*delta(2,1)));
        tmp = tmp+exp(1i*(Phi05(j,i+delta_Ind(2,2))-2*pi*f(j)*delta(2,2)));
        tmp = tmp+exp(1i*(Phi06(j,i+delta_Ind(2,3))-2*pi*f(j)*delta(2,3)));
        tmp = tmp+exp(1i*(Phi07(j,i+delta_Ind(2,4))-2*pi*f(j)*delta(2,4))); 
        tmp = tmp+exp(1i*(Phi08(j,i+delta_Ind(2,5))-2*pi*f(j)*delta(2,5)));
        tmp = tmp+exp(1i*(Phi09(j,i+delta_Ind(2,6))-2*pi*f(j)*delta(2,6)));
        tmp = tmp+exp(1i*(Phi10(j,i+delta_Ind(2,7))-2*pi*f(j)*delta(2,7)));
        tmp = tmp+exp(1i*(Phi11(j,i+delta_Ind(2,8))-2*pi*f(j)*delta(2,8))); 
        tmp = tmp+exp(1i*(Phi12(j,i+delta_Ind(2,9))-2*pi*f(j)*delta(2,9)));
        tmp = tmp+exp(1i*(Phi13(j,i+delta_Ind(2,10))-2*pi*f(j)*delta(2,10)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(2,11))-2*pi*f(j)*delta(2,11)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(2,12))-2*pi*f(j)*delta(2,12)));
        tmp = tmp+exp(1i*(Phi16(j,i+delta_Ind(2,13))-2*pi*f(j)*delta(2,13)));
        tmp = tmp+exp(1i*(Phi17(j,i+delta_Ind(2,14))-2*pi*f(j)*delta(2,14)));
        c2(j,i) = max(abs(tmp)/14,c1(j,i));
        end
    end
    c3 = zeros(size(ST06));
    for i=max(delta_Ind(3,:)+1):4000-max(delta_Ind(3,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi04(j,i-delta_Ind(3,1))+2*pi*f(j)*delta(3,1)));
        tmp = tmp+exp(1i*(Phi05(j,i+delta_Ind(3,2))-2*pi*f(j)*delta(3,2)));
        tmp = tmp+exp(1i*(Phi06(j,i+delta_Ind(3,3))-2*pi*f(j)*delta(3,3)));
        tmp = tmp+exp(1i*(Phi07(j,i+delta_Ind(3,4))-2*pi*f(j)*delta(3,4)));
        tmp = tmp+exp(1i*(Phi08(j,i+delta_Ind(3,5))-2*pi*f(j)*delta(3,5)));
        tmp = tmp+exp(1i*(Phi09(j,i+delta_Ind(3,6))-2*pi*f(j)*delta(3,6)));
        tmp = tmp+exp(1i*(Phi10(j,i+delta_Ind(3,7))-2*pi*f(j)*delta(3,7)));
        tmp = tmp+exp(1i*(Phi11(j,i+delta_Ind(3,8))-2*pi*f(j)*delta(3,8)));
        tmp = tmp+exp(1i*(Phi12(j,i+delta_Ind(3,9))-2*pi*f(j)*delta(3,9)));
        tmp = tmp+exp(1i*(Phi13(j,i+delta_Ind(3,10))-2*pi*f(j)*delta(3,10)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(3,11))-2*pi*f(j)*delta(3,11)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(3,12))-2*pi*f(j)*delta(3,12)));
        tmp = tmp+exp(1i*(Phi16(j,i+delta_Ind(3,13))-2*pi*f(j)*delta(3,13)));
        tmp = tmp+exp(1i*(Phi17(j,i+delta_Ind(3,14))-2*pi*f(j)*delta(3,14)));
        c3(j,i) = max(abs(tmp)/14,c2(j,i));
        end
    end
    c4 = zeros(size(ST06));
    for i=max(delta_Ind(4,:)+1):4000-max(delta_Ind(4,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi04(j,i-delta_Ind(4,1))+2*pi*f(j)*delta(4,1)));
        tmp = tmp+exp(1i*(Phi05(j,i+delta_Ind(4,2))-2*pi*f(j)*delta(4,2)));
        tmp = tmp+exp(1i*(Phi06(j,i+delta_Ind(4,3))-2*pi*f(j)*delta(4,3)));
        tmp = tmp+exp(1i*(Phi07(j,i+delta_Ind(4,4))-2*pi*f(j)*delta(4,4)));
        tmp = tmp+exp(1i*(Phi08(j,i+delta_Ind(4,5))-2*pi*f(j)*delta(4,5)));
        tmp = tmp+exp(1i*(Phi09(j,i+delta_Ind(4,6))-2*pi*f(j)*delta(4,6)));
        tmp = tmp+exp(1i*(Phi10(j,i+delta_Ind(4,7))-2*pi*f(j)*delta(4,7)));
        tmp = tmp+exp(1i*(Phi11(j,i+delta_Ind(4,8))-2*pi*f(j)*delta(4,8)));
        tmp = tmp+exp(1i*(Phi12(j,i+delta_Ind(4,9))-2*pi*f(j)*delta(4,9)));
        tmp = tmp+exp(1i*(Phi13(j,i+delta_Ind(4,10))-2*pi*f(j)*delta(4,10)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(4,11))-2*pi*f(j)*delta(4,11)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(4,12))-2*pi*f(j)*delta(4,12)));
        tmp = tmp+exp(1i*(Phi16(j,i+delta_Ind(4,13))-2*pi*f(j)*delta(4,13)));
        tmp = tmp+exp(1i*(Phi17(j,i+delta_Ind(4,14))-2*pi*f(j)*delta(4,14)));
        c4(j,i) = max(abs(tmp)/14,c3(j,i));
        end
    end
    c5 = zeros(size(ST06));
    for i=max(delta_Ind(5,:)+1):4000-max(delta_Ind(5,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi04(j,i-delta_Ind(5,1))+2*pi*f(j)*delta(5,1)));
        tmp = tmp+exp(1i*(Phi05(j,i+delta_Ind(5,2))-2*pi*f(j)*delta(5,2)));
        tmp = tmp+exp(1i*(Phi06(j,i+delta_Ind(5,3))-2*pi*f(j)*delta(5,3)));
        tmp = tmp+exp(1i*(Phi07(j,i+delta_Ind(5,4))-2*pi*f(j)*delta(5,4)));
        tmp = tmp+exp(1i*(Phi08(j,i+delta_Ind(5,5))-2*pi*f(j)*delta(5,5)));
        tmp = tmp+exp(1i*(Phi09(j,i+delta_Ind(5,6))-2*pi*f(j)*delta(5,6)));
        tmp = tmp+exp(1i*(Phi10(j,i+delta_Ind(5,7))-2*pi*f(j)*delta(5,7)));
        tmp = tmp+exp(1i*(Phi11(j,i+delta_Ind(5,8))-2*pi*f(j)*delta(5,8)));
        tmp = tmp+exp(1i*(Phi12(j,i+delta_Ind(5,9))-2*pi*f(j)*delta(5,9)));
        tmp = tmp+exp(1i*(Phi13(j,i+delta_Ind(5,10))-2*pi*f(j)*delta(5,10)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(5,11))-2*pi*f(j)*delta(5,11)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(5,12))-2*pi*f(j)*delta(5,12)));
        tmp = tmp+exp(1i*(Phi16(j,i+delta_Ind(5,13))-2*pi*f(j)*delta(5,13)));
        tmp = tmp+exp(1i*(Phi17(j,i+delta_Ind(5,14))-2*pi*f(j)*delta(5,14)));
        c5(j,i) = max(abs(tmp)/14,c4(j,i));
        end
    end
    c5_5 = c5.^5;
    c5_5 = c5_5/max(max(abs(c5_5)));
    ST05_filt_5 = ST05.*c5_5;
    C1_A01_05_filt_5 = inv_stran_my(ST05_filt_5,0.05);
    clear c1 c2 c3 c4 c5 c5_5 tmp

    for i=1:length(s)
        for j=1:length(d14)
            delta(i,j) = d14(j)*s(i);
        end
    end
    delta_Ind = fix(delta/0.05);
    
    c1 = zeros(size(ST06));
    for i=max(delta_Ind(1,:)+1):4000-max(delta_Ind(1,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi04(j,i-delta_Ind(1,1))+2*pi*f(j)*delta(1,1)));
        tmp = tmp+exp(1i*(Phi05(j,i-delta_Ind(1,2))+2*pi*f(j)*delta(1,2)));
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(1,3))+2*pi*f(j)*delta(1,3)));
        tmp = tmp+exp(1i*(Phi07(j,i-delta_Ind(1,4))+2*pi*f(j)*delta(1,4)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(1,5))+2*pi*f(j)*delta(1,5)));
        tmp = tmp+exp(1i*(Phi09(j,i-delta_Ind(1,6))+2*pi*f(j)*delta(1,6)));
        tmp = tmp+exp(1i*(Phi10(j,i-delta_Ind(1,7))+2*pi*f(j)*delta(1,7)));
        tmp = tmp+exp(1i*(Phi11(j,i-delta_Ind(1,8))+2*pi*f(j)*delta(1,8)));
        tmp = tmp+exp(1i*(Phi12(j,i-delta_Ind(1,9))+2*pi*f(j)*delta(1,9)));
        tmp = tmp+exp(1i*(Phi13(j,i-delta_Ind(1,10))+2*pi*f(j)*delta(1,10)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(1,11))-2*pi*f(j)*delta(1,11)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(1,12))-2*pi*f(j)*delta(1,12)));
        tmp = tmp+exp(1i*(Phi16(j,i+delta_Ind(1,13))-2*pi*f(j)*delta(1,13)));
        tmp = tmp+exp(1i*(Phi17(j,i+delta_Ind(1,14))-2*pi*f(j)*delta(1,14)));
        c1(j,i) = tmp/14;
        end
    end
    c1 = abs(c1);
    c2 = zeros(size(ST06));
    for i=max(delta_Ind(2,:)+1):4000-max(delta_Ind(2,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi04(j,i-delta_Ind(2,1))+2*pi*f(j)*delta(2,1)));
        tmp = tmp+exp(1i*(Phi05(j,i-delta_Ind(2,2))+2*pi*f(j)*delta(2,2)));
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(2,3))+2*pi*f(j)*delta(2,3)));
        tmp = tmp+exp(1i*(Phi07(j,i-delta_Ind(2,4))+2*pi*f(j)*delta(2,4))); 
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(2,5))+2*pi*f(j)*delta(2,5)));
        tmp = tmp+exp(1i*(Phi09(j,i-delta_Ind(2,6))+2*pi*f(j)*delta(2,6)));
        tmp = tmp+exp(1i*(Phi10(j,i-delta_Ind(2,7))+2*pi*f(j)*delta(2,7)));
        tmp = tmp+exp(1i*(Phi11(j,i-delta_Ind(2,8))+2*pi*f(j)*delta(2,8))); 
        tmp = tmp+exp(1i*(Phi12(j,i-delta_Ind(2,9))+2*pi*f(j)*delta(2,9)));
        tmp = tmp+exp(1i*(Phi13(j,i-delta_Ind(2,10))+2*pi*f(j)*delta(2,10)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(2,11))-2*pi*f(j)*delta(2,11)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(2,12))-2*pi*f(j)*delta(2,12)));
        tmp = tmp+exp(1i*(Phi16(j,i+delta_Ind(2,13))-2*pi*f(j)*delta(2,13)));
        tmp = tmp+exp(1i*(Phi17(j,i+delta_Ind(2,14))-2*pi*f(j)*delta(2,14)));
        c2(j,i) = max(abs(tmp)/14,c1(j,i));
        end
    end
    c3 = zeros(size(ST06));
    for i=max(delta_Ind(3,:)+1):4000-max(delta_Ind(3,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi04(j,i-delta_Ind(3,1))+2*pi*f(j)*delta(3,1)));
        tmp = tmp+exp(1i*(Phi05(j,i-delta_Ind(3,2))+2*pi*f(j)*delta(3,2)));
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(3,3))+2*pi*f(j)*delta(3,3)));
        tmp = tmp+exp(1i*(Phi07(j,i-delta_Ind(3,4))+2*pi*f(j)*delta(3,4)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(3,5))+2*pi*f(j)*delta(3,5)));
        tmp = tmp+exp(1i*(Phi09(j,i-delta_Ind(3,6))+2*pi*f(j)*delta(3,6)));
        tmp = tmp+exp(1i*(Phi10(j,i-delta_Ind(3,7))+2*pi*f(j)*delta(3,7)));
        tmp = tmp+exp(1i*(Phi11(j,i-delta_Ind(3,8))+2*pi*f(j)*delta(3,8)));
        tmp = tmp+exp(1i*(Phi12(j,i-delta_Ind(3,9))+2*pi*f(j)*delta(3,9)));
        tmp = tmp+exp(1i*(Phi13(j,i-delta_Ind(3,10))+2*pi*f(j)*delta(3,10)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(3,11))-2*pi*f(j)*delta(3,11)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(3,12))-2*pi*f(j)*delta(3,12)));
        tmp = tmp+exp(1i*(Phi16(j,i+delta_Ind(3,13))-2*pi*f(j)*delta(3,13)));
        tmp = tmp+exp(1i*(Phi17(j,i+delta_Ind(3,14))-2*pi*f(j)*delta(3,14)));
        c3(j,i) = max(abs(tmp)/14,c2(j,i));
        end
    end
    c4 = zeros(size(ST06));
    for i=max(delta_Ind(4,:)+1):4000-max(delta_Ind(4,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi04(j,i-delta_Ind(4,1))+2*pi*f(j)*delta(4,1)));
        tmp = tmp+exp(1i*(Phi05(j,i-delta_Ind(4,2))+2*pi*f(j)*delta(4,2)));
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(4,3))+2*pi*f(j)*delta(4,3)));
        tmp = tmp+exp(1i*(Phi07(j,i-delta_Ind(4,4))+2*pi*f(j)*delta(4,4)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(4,5))+2*pi*f(j)*delta(4,5)));
        tmp = tmp+exp(1i*(Phi09(j,i-delta_Ind(4,6))+2*pi*f(j)*delta(4,6)));
        tmp = tmp+exp(1i*(Phi10(j,i-delta_Ind(4,7))+2*pi*f(j)*delta(4,7)));
        tmp = tmp+exp(1i*(Phi11(j,i-delta_Ind(4,8))+2*pi*f(j)*delta(4,8)));
        tmp = tmp+exp(1i*(Phi12(j,i-delta_Ind(4,9))+2*pi*f(j)*delta(4,9)));
        tmp = tmp+exp(1i*(Phi13(j,i-delta_Ind(4,10))+2*pi*f(j)*delta(4,10)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(4,11))-2*pi*f(j)*delta(4,11)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(4,12))-2*pi*f(j)*delta(4,12)));
        tmp = tmp+exp(1i*(Phi16(j,i+delta_Ind(4,13))-2*pi*f(j)*delta(4,13)));
        tmp = tmp+exp(1i*(Phi17(j,i+delta_Ind(4,14))-2*pi*f(j)*delta(4,14)));
        c4(j,i) = max(abs(tmp)/14,c3(j,i));
        end
    end
    c5 = zeros(size(ST06));
    for i=max(delta_Ind(5,:)+1):4000-max(delta_Ind(5,:)+1)
        for j=1:220
        tmp = 0;
        tmp = tmp+exp(1i*(Phi04(j,i-delta_Ind(5,1))+2*pi*f(j)*delta(5,1)));
        tmp = tmp+exp(1i*(Phi05(j,i-delta_Ind(5,2))+2*pi*f(j)*delta(5,2)));
        tmp = tmp+exp(1i*(Phi06(j,i-delta_Ind(5,3))+2*pi*f(j)*delta(5,3)));
        tmp = tmp+exp(1i*(Phi07(j,i-delta_Ind(5,4))+2*pi*f(j)*delta(5,4)));
        tmp = tmp+exp(1i*(Phi08(j,i-delta_Ind(5,5))+2*pi*f(j)*delta(5,5)));
        tmp = tmp+exp(1i*(Phi09(j,i-delta_Ind(5,6))+2*pi*f(j)*delta(5,6)));
        tmp = tmp+exp(1i*(Phi10(j,i-delta_Ind(5,7))+2*pi*f(j)*delta(5,7)));
        tmp = tmp+exp(1i*(Phi11(j,i-delta_Ind(5,8))+2*pi*f(j)*delta(5,8)));
        tmp = tmp+exp(1i*(Phi12(j,i-delta_Ind(5,9))+2*pi*f(j)*delta(5,9)));
        tmp = tmp+exp(1i*(Phi13(j,i-delta_Ind(5,10))+2*pi*f(j)*delta(5,10)));
        tmp = tmp+exp(1i*(Phi14(j,i+delta_Ind(5,11))-2*pi*f(j)*delta(5,11)));
        tmp = tmp+exp(1i*(Phi15(j,i+delta_Ind(5,12))-2*pi*f(j)*delta(5,12)));
        tmp = tmp+exp(1i*(Phi16(j,i+delta_Ind(5,13))-2*pi*f(j)*delta(5,13)));
        tmp = tmp+exp(1i*(Phi17(j,i+delta_Ind(5,14))-2*pi*f(j)*delta(5,14)));
        c5(j,i) = max(abs(tmp)/14,c4(j,i));
        end
    end
    c5_5 = c5.^5;
    c5_5 = c5_5/max(max(abs(c5_5)));
    ST14_filt_5 = ST14.*c5_5;
    C1_A01_14_filt_5 = inv_stran_my(ST14_filt_5,0.05);
    
    clear c1 c2 c3 c4 c5 c5_5 ST04 ST05 ST06 ST07 ST08 ST09 ST10 ST11 ST12 ST13 ST14 ST15 ST16 ST17 Phi*
    cc_05_14_filt_5 = cc_05_14_filt_5 + real(ifftshift(ifft(fft(C1_A01_14_filt_5,7999).*conj(fft(C1_A01_05_filt_5,7999)))));
end
cc_05_14_filt_5_tmp(iday,:) = cc_05_14_filt_5;
toc
end