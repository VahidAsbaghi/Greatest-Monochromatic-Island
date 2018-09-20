%% ******* CREATE POLYGON FUNCTION ****************
function N_Bls_isl=create_poly(blue_coordinate,ii,vert1,dt1,red_coordinate,num_blue,num)
%% ***THIS FUNCTION CREATE AND DRAW BEST GREATEST POLYGON THAT FIND BY
%% FIRST ALGORITHM.
%
dt=dt1{ii,1};
l=length(vert1);
dot=zeros(l+2,1); %for select points as vertexes of polygon 
dot(1:3)=dt(vert1(1),:); %extract vertex points from triangles 
for i=2:l
    dot(2+i)=dt(vert1(i),3);
end
N_Bls_isl=length(vert1)+2;
figure;
title(['Optimal Greatest Blue Mono-Color Island. number of blue:',num2str(num_blue),' All: ',num2str(num),' points in island: ',num2str(length(vert1)+2)]);
hold on;
for i=1:l+1 %draw polygon
    line([blue_coordinate(dot(i),1),blue_coordinate(dot(i+1),1)],[blue_coordinate(dot(i),2),blue_coordinate(dot(i+1),2)]);
end
line([blue_coordinate(dot(1),1),blue_coordinate(dot(l+2),1)],[blue_coordinate(dot(1),2),blue_coordinate(dot(l+2),2)]);
scatter(blue_coordinate(:,1),blue_coordinate(:,2),'*'); %draw blue points
scatter(red_coordinate(:,1),red_coordinate(:,2),'.','r');

%% ************************************* END FUNTION **********************
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------