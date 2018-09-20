%% ***** TRIANGULATION GENETIC ***********
function delta=g_triangulation_one(blue_coordinate1,point_num,chr)
%% THIS FUNCTION DO TRIANGULATION FOR A GIVEN CHROMOSOME BY CALLING
%% g_tri_one FUNCTION
l=length(blue_coordinate1);
delta=zeros((l-2),3);
delta(:,1)=chr(point_num);
if point_num~=l
    delta(1,2)=chr(point_num+1);
else
    delta(1,2)=chr(1);
end



[I_teta,teta1]=g_tri_one(blue_coordinate1,1);
I_teta1=chr(I_teta);
delta(:,2)=I_teta1(1:l-2,1);
delta(:,3)=I_teta1(2:l-1,1);

%% ************************************* END FUNTION **********************
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------