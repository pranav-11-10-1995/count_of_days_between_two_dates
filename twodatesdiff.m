clc;
occr=0;
display('NUMBER OF DAYS BETWEEN TWO GIVEN DATES')
display('(INCLUDING STARTING AND ENDING DAYS)')
display('DATE FORMAT : DD/MM/YYYY')
prompt= '\nGIVE THE STARTING DATE\n';
date1=input(prompt);     % accepts input from the user -> to give array as input ,enclose them in square bracket [2 1 4 5]
prompt= 'GIVE THE ENDING DATE\n';
date2=input(prompt);     % accepts input from the user -> to give array as input ,enclose them in square bracket [2 1 4 5]
yr1=date1(3);
yr2=date2(3);
mon1=date1(2);
mon2=date2(2);
if (mod(yr1,4)==0 && mon1==2 && date1(1)>=30)||(mod(yr2,4)==0 && mon2==2 && date2(1)>=30)
    display('INVALID DATE')
    display('IN LEAP YEAR - FEBRUARY HAS  29 DAYS')
end
 if (mod(yr1,4)~=0 && mon1==2 && date1(1)>=29) || (mod(yr2,4)~=0 && mon2==2 && date2(1)>=29)
      display('INVALID DATE')
      display('IN NON-LEAP YEAR - FEBRUARY HAS  28 DAYS')
 end
 if (mod(mon1,2)~=0 && mon1<=7 && date1(1)>=32) ||(mod(mon2,2)~=0 && mon2<=7 && date2(1)>=32)
       display('INVALID DATE')
       display('JAN, MAR ,MAY,JULY,AUG,OCT,DEC- 31 DAYS')
 end
 if (mod(mon1,2)==0 && mon1<=7 && date1(1)>=31) || (mod(mon2,2)==0 && mon2<=7 && date2(1)>=31)
       display('INVALID DATE')
       display('APR,JUN,SEPT,NOV-30 DAYS')
 end
 if (mod(mon1,2)~=0 && mon1>7 && date1(1)>=31) ||(mod(mon2,2)~=0 && mon2>7 && date2(1)>=31)
       display('INVALID DATE')
       display('APR,JUN,SEPT,NOV-30 DAYS')
 end
 if (mod(mon1,2)==0 && mon1>7 && date1(1)>=32) || (mod(mon2,2)==0 && mon2>7 && date2(1)>=32)
       display('INVALID DATE')
       display('JAN, MAR ,MAY,JULY,AUG,OCT,DEC- 31 DAYS')
 end
 if mon1>12 || mon2>12 || mon1<1 || mon2<1
       display('INVALID DATE')
       display('MONTH RANGES FROM 1 TO 12')
 end 
for i=date1(3):date2(3)
   if mod(i,4)==0
       occr=occr+1;
       date1(3)=date1(3)+1;
   end
end
occr;
if yr1==yr2 && date1(2)==date2(2) && date1(2)==2 && mod(yr1,4)==0
    days=date2(1)-date1(1)+1
else
date1(3)=yr1;
date2(3)=yr2;
ref1=[1 1 yr1];
ref2=[31 12 yr2];
yrdiff=(yr2-yr1+1)*365+occr;
mondiff=date1-ref1;
daymon=0;
lim=mondiff(2);
    while(ref1(2)<=7 && ref1(2)<=lim)
        if mod(ref1(2),2)~=0
           daymon=daymon+31;
        elseif ref1(2)==2
            daymon=daymon+28;
        elseif mod(ref1(2),2)==0 && ref1(2)~=2
            daymon=daymon+30;
        end
        ref1(2)=ref1(2)+1;
    end
    while(ref1(2)>7 && ref1(2)<=12 && ref1(2)<=lim)
        if mod(ref1(2),2)==0
           daymon=daymon+31;
        elseif mod(ref1(2),2)~=0 
            daymon=daymon+30;
        end
        ref1(2)=ref1(2)+1;
    end
daymon;
mondiff2=ref2-date2;
daymon2=0;
ref2=12-mondiff2(2);
 while(ref2<=7)
        if mod(ref2,2)~=0
           daymon2=daymon2+31;
        elseif ref2==2
            daymon2=daymon2+28;
        elseif mod(ref2,2)==0 && ref2~=2
            daymon2=daymon2+30;
        end
        ref2=ref2+1;
 end
    while(ref2>7 && ref2<=12)
        if mod(ref2,2)==0
           daymon2=daymon2+31;
        elseif mod(ref2,2)~=0 
            daymon2=daymon2+30;
        end
        ref2=ref2+1;
    end
daymon2;
days=yrdiff-daymon-mondiff(1)-daymon2+date2(1);
  if days<=0
    display('ENDING DATE COMES BEFORE STARTING DATE....')
    display('INTERCHANGE START & END DATES TO GET THE REQUIRED ANSWER')
    return
  else
    days
  end
end
  