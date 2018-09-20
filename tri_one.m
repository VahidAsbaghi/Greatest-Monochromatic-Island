%% ********** TRIANGULATION FUNCTION **********
function [I_teta,teta2]=tri_one(coordinates,point_num)
%% TAKE SOME POINT'S COORDINATES AND SORT THEM TO CREATE A SIMPLE POLYGON
%% BASED ON TRIANGULATION AND ANGLE
l=length(coordinates);
a1=coordinates(point_num,1);
b1=coordinates(point_num,2);
teta=zeros(l,1);
for i=1:l
    a2=coordinates(i,1);
    b2=coordinates(i,2);
    if (b2-b1)>=0 && (a2-a1)>=0 
        teta(i,1)=atand((b2-b1)./(a2-a1));
    elseif (b2-b1)>=0 && (a2-a1)<0
        teta(i,1)=atand((b2-b1)./(a2-a1))+180;
    elseif (b2-b1)<0 && (a2-a1)<0
        teta(i,1)=atand((b2-b1)./(a2-a1))+180;
    else
        teta(i,1)=atand((b2-b1)./(a2-a1))+360;
    end
end

[teta1,I_teta]=sort(teta,'ascend');
[teta_t,II]=max(abs(teta1(1:l-2)-teta1(2:l-1)));
if teta_t>180
    teta2=teta-teta(I_teta(II+1));
    for i=1:l
        if teta2(i)<0
            teta2(i)=teta2(i)+360;
        end
    end
    [teta2,I_teta]=sort(teta2,'ascend');
else
    teta2=teta1;
end

%% ********************* END FUNCTION ************************************
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------