function D=errcoeff(A,b,c,p)
%function D=errcoeff(A,b,c,p)
%
% Inputs: A,b,c -- Butcher tableau
%         p     -- order of accuracy of the method
% Computes the norm of the vector of truncation error coefficients
% for the terms of order p+1.
%
%For now we just use Butcher's approach.  We could alternatively use Albrecht's.

if p==1
  tau(1)=c'*b-1/2;
elseif p==2   
  tau(1)=c'.^2*b-1/3;
  tau(2)=b'*A*c-1/6;
elseif p==3
  tau(1)=c'.^3*b-1/4;
  tau(2)=(b'.*c')*A*c-1/8;
  tau(3)=b'*A*c.^2-1/12;
  tau(4)=b'*A^2*c-1/24;
elseif p==4
  tau(1)=c'.^4*b-1/5;
  tau(2)=(b.*c.^2)'*A*c-1/10;
  tau(3)=b'*(A*c).^2-1/20;
  tau(4)=(b.*c)'*A*c.^2-1/15;
  tau(5)=b'*A*c.^3-1/20;
  tau(6)=(b.*c)'*A^2*c-1/30;
  tau(7)=b'*A*diag(c)*A*c-1/40;
  tau(8)=b'*A^2*c.^2-1/60;
  tau(9)=b'*A^3*c-1/120;
elseif p==5
  tau(1)=c'.^5*b-1/6;
  tau(2)=b'*diag(c).^3*A*c-1/12;
  tau(3)=b'*diag(c)*(A*c).^2-1/24;
  tau(4)=b'*diag(c).^2*A*c.^2-1/18;
  tau(5)=b'*((A*c.^2).*(A*c))-1/36;
  tau(6)=b'*diag(c)*A*c.^3-1/24;
  tau(7)=b'*A*c.^4-1/30;
  tau(8)=b'*diag(c).^2*A^2*c-1/36;
  tau(9)=b'*((A^2*c).*(A*c))-1/72;
  tau(10)=b'*diag(c)*A*diag(c)*A*c-1/48;
  tau(11)=b'*A*diag(c).^2*A*c-1/60;
  tau(12)=b'*A*(A*c).^2-1/120;
  tau(13)=b'*diag(c)*A^2*c.^2-1/72;
  tau(14)=b'*A*diag(c)*A*c.^2-1/90;
  tau(15)=b'*A^2*c.^3-1/120;
  tau(16)=b'*diag(c)*A^3*c-1/144;
  tau(17)=b'*A*diag(c)*A^2*c-1/180;
  tau(18)=b'*A^2*diag(c)*A*c-1/240;
  tau(19)=b'*A^3*c.^2-1/360;
  tau(20)=b'*A^4*c-1/720;
elseif p==6
  % order 7 conditions:
  tau(1)=b'*(A*(c.^5))-1/42;
  tau(2)=b'*(A*(A*(c.^4)))-1/210;
  tau(3)=b'*(A*(A*(A*(c.^3))))-1/840;
  tau(4)=b'*(A*(A*(A*(A*(c.^2)))))-1/2520;
  tau(5)=b'*(A*(A*(A*(A*(A*(c))))))-1/5040;
  tau(6)=b'*(A*(A*(A*(c.*A*(c)))))-1/1680;
  tau(7)=b'*(A*(A*(c.*A*(c.^2))))-1/630;
  tau(8)=b'*(A*(A*(c.*A*(A*(c)))))-1/1260;
  tau(9)=b'*(A*(A*(c.^2.*A*(c))))-1/420;
  tau(10)=b'*(A*(A*(A*(c).*A*(c))))-1/840;
  tau(11)=b'*(A*(c.*A*(c.^3)))-1/168;
  tau(12)=b'*(A*(c.*A*(A*(c.^2))))-1/504;
  tau(13)=b'*(A*(c.*A*(A*(A*(c)))))-1/1008;
  tau(14)=b'*(A*(c.*A*(c.*A*(c))))-1/336;
  tau(15)=b'*(A*(c.^2.*A*(c.^2)))-1/126;
  tau(16)=b'*(A*(c.^2.*A*(A*(c))))-1/252;
  tau(17)=b'*(A*(c.^3.*A*(c)))-1/84;
  tau(18)=b'*(A*(A*(c).*A*(c.^2)))-1/252;
  tau(19)=b'*(A*(A*(c).*A*(A*(c))))-1/504;
  tau(20)=b'*(A*(c.*A*(c).*A*(c)))-1/168;
  tau(21)=b'*(A*(c.^4).*c)-1/35;
  tau(22)=b'*(A*(A*(c.^3)).*c)-1/140;
  tau(23)=b'*(A*(A*(A*(c.^2))).*c)-1/420;
  tau(24)=b'*(A*(A*(A*(A*(c)))).*c)-1/840;
  tau(25)=b'*(A*(A*(c.*A*(c))).*c)-1/280;
  tau(26)=b'*(A*(c.*A*(c.^2)).*c)-1/105;
  tau(27)=b'*(A*(c.*A*(A*(c))).*c)-1/210;
  tau(28)=b'*(A*(c.^2.*A*(c)).*c)-1/70;
  tau(29)=b'*(A*(A*(c).*A*(c)).*c)-1/140;
  tau(30)=b'*(A*(c.^3).*c.^2)-1/28;
  tau(31)=b'*(A*(A*(c.^2)).*c.^2)-1/84;
  tau(32)=b'*(A*(A*(A*(c))).*c.^2)-1/168;
  tau(33)=b'*(A*(c.*A*(c)).*c.^2)-1/56;
  tau(34)=b'*(A*(c.^2).*c.^3)-1/21;
  tau(35)=b'*(A*(A*(c)).*c.^3)-1/42;
  tau(36)=b'*(A*(c).*c.^4)-1/14;
  tau(37)=b'*(A*(c.^2).*A*(c.^2))-1/63;
  tau(38)=b'*(A*(A*(c)).*A*(c.^2))-1/126;
  tau(39)=b'*(A*(A*(c)).*A*(A*(c)))-1/252;
  tau(40)=b'*(A*(c.^3).*A*(c))-1/56;
  tau(41)=b'*(A*(A*(c.^2)).*A*(c))-1/168;
  tau(42)=b'*(A*(A*(A*(c))).*A*(c))-1/336;
  tau(43)=b'*(A*(c.*A*(c)).*A*(c))-1/112;
  tau(44)=b'*(A*(c.^2).*A*(c).*c)-1/42;
  tau(45)=b'*(A*(A*(c)).*A*(c).*c)-1/84;
  tau(46)=b'*(A*(c).*A*(c).*c.^2)-1/28;
  tau(47)=b'*(A*(c).*A*(c).*A*(c))-1/56;
  tau(48)=b'*(c.^6)-1/7;
elseif p==7
  % order 8 conditions:
  tau(1)=b'*(A*(c.^6))-1/56;
  tau(2)=b'*(A*(A*(c.^5)))-1/336;
  tau(3)=b'*(A*(A*(A*(c.^4))))-1/1680;
  tau(4)=b'*(A*(A*(A*(A*(c.^3)))))-1/6720;
  tau(5)=b'*(A*(A*(A*(A*(A*(c.^2))))))-1/20160;
  tau(6)=b'*(A*(A*(A*(A*(A*(A*(c)))))))-1/40320;
  tau(7)=b'*(A*(A*(A*(A*(c.*A*(c))))))-1/13440;
  tau(8)=b'*(A*(A*(A*(c.*A*(c.^2)))))-1/5040;
  tau(9)=b'*(A*(A*(A*(c.*A*(A*(c))))))-1/10080;
  tau(10)=b'*(A*(A*(A*(c.^2.*A*(c)))))-1/3360;
  tau(11)=b'*(A*(A*(A*(A*(c).*A*(c)))))-1/6720;
  tau(12)=b'*(A*(A*(c.*A*(c.^3))))-1/1344;
  tau(13)=b'*(A*(A*(c.*A*(A*(c.^2)))))-1/4032;
  tau(14)=b'*(A*(A*(c.*A*(A*(A*(c))))))-1/8064;
  tau(15)=b'*(A*(A*(c.*A*(c.*A*(c)))))-1/2688;
  tau(16)=b'*(A*(A*(c.^2.*A*(c.^2))))-1/1008;
  tau(17)=b'*(A*(A*(c.^2.*A*(A*(c)))))-1/2016;
  tau(18)=b'*(A*(A*(c.^3.*A*(c))))-1/672;
  tau(19)=b'*(A*(A*(A*(c).*A*(c.^2))))-1/2016;
  tau(20)=b'*(A*(A*(A*(c).*A*(A*(c)))))-1/4032;
  tau(21)=b'*(A*(A*(c.*A*(c).*A*(c))))-1/1344;
  tau(22)=b'*(A*(c.*A*(c.^4)))-1/280;
  tau(23)=b'*(A*(c.*A*(A*(c.^3))))-1/1120;
  tau(24)=b'*(A*(c.*A*(A*(A*(c.^2)))))-1/3360;
  tau(25)=b'*(A*(c.*A*(A*(A*(A*(c))))))-1/6720;
  tau(26)=b'*(A*(c.*A*(A*(c.*A*(c)))))-1/2240;
  tau(27)=b'*(A*(c.*A*(c.*A*(c.^2))))-1/840;
  tau(28)=b'*(A*(c.*A*(c.*A*(A*(c)))))-1/1680;
  tau(29)=b'*(A*(c.*A*(c.^2.*A*(c))))-1/560;
  tau(30)=b'*(A*(c.*A*(A*(c).*A*(c))))-1/1120;
  tau(31)=b'*(A*(c.^2.*A*(c.^3)))-1/224;
  tau(32)=b'*(A*(c.^2.*A*(A*(c.^2))))-1/672;
  tau(33)=b'*(A*(c.^2.*A*(A*(A*(c)))))-1/1344;
  tau(34)=b'*(A*(c.^2.*A*(c.*A*(c))))-1/448;
  tau(35)=b'*(A*(c.^3.*A*(c.^2)))-1/168;
  tau(36)=b'*(A*(c.^3.*A*(A*(c))))-1/336;
  tau(37)=b'*(A*(c.^4.*A*(c)))-1/112;
  tau(38)=b'*(A*(A*(c.^2).*A*(c.^2)))-1/504;
  tau(39)=b'*(A*(A*(c.^2).*A*(A*(c))))-1/1008;
  tau(40)=b'*(A*(A*(A*(c)).*A*(A*(c))))-1/2016;
  tau(41)=b'*(A*(A*(c).*A*(c.^3)))-1/448;
  tau(42)=b'*(A*(A*(c).*A*(A*(c.^2))))-1/1344;
  tau(43)=b'*(A*(A*(c).*A*(A*(A*(c)))))-1/2688;
  tau(44)=b'*(A*(A*(c).*A*(c.*A*(c))))-1/896;
  tau(45)=b'*(A*(c.*A*(c).*A*(c.^2)))-1/336;
  tau(46)=b'*(A*(c.*A*(c).*A*(A*(c))))-1/672;
  tau(47)=b'*(A*(c.^2.*A*(c).*A*(c)))-1/224;
  tau(48)=b'*(A*(A*(c).*A*(c).*A*(c)))-1/448;
  tau(49)=b'*(A*(c.^5).*c)-1/48;
  tau(50)=b'*(A*(A*(c.^4)).*c)-1/240;
  tau(51)=b'*(A*(A*(A*(c.^3))).*c)-1/960;
  tau(52)=b'*(A*(A*(A*(A*(c.^2)))).*c)-1/2880;
  tau(53)=b'*(A*(A*(A*(A*(A*(c))))).*c)-1/5760;
  tau(54)=b'*(A*(A*(A*(c.*A*(c)))).*c)-1/1920;
  tau(55)=b'*(A*(A*(c.*A*(c.^2))).*c)-1/720;
  tau(56)=b'*(A*(A*(c.*A*(A*(c)))).*c)-1/1440;
  tau(57)=b'*(A*(A*(c.^2.*A*(c))).*c)-1/480;
  tau(58)=b'*(A*(A*(A*(c).*A*(c))).*c)-1/960;
  tau(59)=b'*(A*(c.*A*(c.^3)).*c)-1/192;
  tau(60)=b'*(A*(c.*A*(A*(c.^2))).*c)-1/576;
  tau(61)=b'*(A*(c.*A*(A*(A*(c)))).*c)-1/1152;
  tau(62)=b'*(A*(c.*A*(c.*A*(c))).*c)-1/384;
  tau(63)=b'*(A*(c.^2.*A*(c.^2)).*c)-1/144;
  tau(64)=b'*(A*(c.^2.*A*(A*(c))).*c)-1/288;
  tau(65)=b'*(A*(c.^3.*A*(c)).*c)-1/96;
  tau(66)=b'*(A*(A*(c).*A*(c.^2)).*c)-1/288;
  tau(67)=b'*(A*(A*(c).*A*(A*(c))).*c)-1/576;
  tau(68)=b'*(A*(c.*A*(c).*A*(c)).*c)-1/192;
  tau(69)=b'*(A*(c.^4).*c.^2)-1/40;
  tau(70)=b'*(A*(A*(c.^3)).*c.^2)-1/160;
  tau(71)=b'*(A*(A*(A*(c.^2))).*c.^2)-1/480;
  tau(72)=b'*(A*(A*(A*(A*(c)))).*c.^2)-1/960;
  tau(73)=b'*(A*(A*(c.*A*(c))).*c.^2)-1/320;
  tau(74)=b'*(A*(c.*A*(c.^2)).*c.^2)-1/120;
  tau(75)=b'*(A*(c.*A*(A*(c))).*c.^2)-1/240;
  tau(76)=b'*(A*(c.^2.*A*(c)).*c.^2)-1/80;
  tau(77)=b'*(A*(A*(c).*A*(c)).*c.^2)-1/160;
  tau(78)=b'*(A*(c.^3).*c.^3)-1/32;
  tau(79)=b'*(A*(A*(c.^2)).*c.^3)-1/96;
  tau(80)=b'*(A*(A*(A*(c))).*c.^3)-1/192;
  tau(81)=b'*(A*(c.*A*(c)).*c.^3)-1/64;
  tau(82)=b'*(A*(c.^2).*c.^4)-1/24;
  tau(83)=b'*(A*(A*(c)).*c.^4)-1/48;
  tau(84)=b'*(A*(c).*c.^5)-1/16;
  tau(85)=b'*(A*(c.^3).*A*(c.^2))-1/96;
  tau(86)=b'*(A*(A*(c.^2)).*A*(c.^2))-1/288;
  tau(87)=b'*(A*(A*(A*(c))).*A*(c.^2))-1/576;
  tau(88)=b'*(A*(c.*A*(c)).*A*(c.^2))-1/192;
  tau(89)=b'*(A*(c.^3).*A*(A*(c)))-1/192;
  tau(90)=b'*(A*(A*(c.^2)).*A*(A*(c)))-1/576;
  tau(91)=b'*(A*(A*(A*(c))).*A*(A*(c)))-1/1152;
  tau(92)=b'*(A*(c.*A*(c)).*A*(A*(c)))-1/384;
  tau(93)=b'*(A*(c.^4).*A*(c))-1/80;
  tau(94)=b'*(A*(A*(c.^3)).*A*(c))-1/320;
  tau(95)=b'*(A*(A*(A*(c.^2))).*A*(c))-1/960;
  tau(96)=b'*(A*(A*(A*(A*(c)))).*A*(c))-1/1920;
  tau(97)=b'*(A*(A*(c.*A*(c))).*A*(c))-1/640;
  tau(98)=b'*(A*(c.*A*(c.^2)).*A*(c))-1/240;
  tau(99)=b'*(A*(c.*A*(A*(c))).*A*(c))-1/480;
  tau(100)=b'*(A*(c.^2.*A*(c)).*A*(c))-1/160;
  tau(101)=b'*(A*(A*(c).*A*(c)).*A*(c))-1/320;
  tau(102)=b'*(A*(c.^2).*A*(c.^2).*c)-1/72;
  tau(103)=b'*(A*(A*(c)).*A*(c.^2).*c)-1/144;
  tau(104)=b'*(A*(A*(c)).*A*(A*(c)).*c)-1/288;
  tau(105)=b'*(A*(c.^3).*A*(c).*c)-1/64;
  tau(106)=b'*(A*(A*(c.^2)).*A*(c).*c)-1/192;
  tau(107)=b'*(A*(A*(A*(c))).*A*(c).*c)-1/384;
  tau(108)=b'*(A*(c.*A*(c)).*A*(c).*c)-1/128;
  tau(109)=b'*(A*(c.^2).*A*(c).*c.^2)-1/48;
  tau(110)=b'*(A*(A*(c)).*A*(c).*c.^2)-1/96;
  tau(111)=b'*(A*(c).*A*(c).*c.^3)-1/32;
  tau(112)=b'*(A*(c.^2).*A*(c).*A*(c))-1/96;
  tau(113)=b'*(A*(A*(c)).*A*(c).*A*(c))-1/192;
  tau(114)=b'*(A*(c).*A*(c).*A*(c).*c)-1/64;
  tau(115)=b'*(c.^7)-1/8;

elseif p>=9
  disp('Accuracy objective for p>=9 is not coded up yet');
end

D=norm(tau);
