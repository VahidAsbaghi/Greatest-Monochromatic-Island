%% **** TRIANGULATION FUNCTION *********
function delta=triangulation_one(blue_coordinate,point_num)
%% THIS FUNCTION DO TRIANGULATION FOR FIRST ALGORITHM BY CALLING tri_one
%% FUNCTION.
l=length(blue_coordinate);
delta=zeros((l-2),3);
delta(:,1)=point_num;

if point_num~=l
    delta(1,2)=point_num+1;
else
    delta(1,2)=1;
end


[I_teta,teta1]=tri_one(blue_coordinate,point_num);

delta(:,2)=I_teta(1:l-2,1);
delta(:,3)=I_teta(2:l-1,1);

%% ******************* END FUNCTION ***************************************
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
