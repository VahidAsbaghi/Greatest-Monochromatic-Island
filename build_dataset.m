%% ************ FUNCTION BUILD DATASET FOR TEST **********************
function [blue_coordinate,red_coordinate]=build_dataset(num_of_all,num_blue_island)
%% ***** BUILD DATASET ******
%this function build a dataset by triangulation theory.
%this test points are suitable for test genetic algorithm 
%1- generate some blue point and create a polygon by triangulation
%2- generate some red points outside of polygon and use of these as test
%dataset
xi=100;
yi=100;
blue_coordinate=zeros(num_blue_island,2);
blue_coordinate(1:num_blue_island,1)=randi([0,xi],num_blue_island,1);
blue_coordinate(1:num_blue_island,2)=randi([0,yi],num_blue_island,1);
dt1=cell(num_blue_island,1);
chr=(1:num_blue_island)';
delta=g_triangulation_one(blue_coordinate(chr,:),1,chr); 
chr_temp=g_create_poly1(delta);
i=1;

red_coordinate=zeros(num_of_all-num_blue_island,2);
while  i<=num_of_all-num_blue_island
    rr=randi([0,xi],1,2);
    INrr=inpolygon(rr(1),rr(2),blue_coordinate(chr_temp,1),blue_coordinate(chr_temp,2));
    while INrr>0
         rr=randi([0,xi],1,2);
         INrr=inpolygon(rr(1),rr(2),blue_coordinate(chr_temp,1),blue_coordinate(chr_temp,2));
    end
    red_coordinate(i,:)=rr;
    i=i+1;
end
figure; hold on; %draw test dataset
plot(blue_coordinate(chr_temp,1),blue_coordinate(chr_temp,2));
plot([blue_coordinate(chr_temp(1),1),blue_coordinate(chr_temp(num_blue_island),1)],[blue_coordinate(chr_temp(1),2),blue_coordinate(chr_temp(num_blue_island),2)])
scatter(blue_coordinate(:,1),blue_coordinate(:,2),'*');
scatter(red_coordinate(:,1),red_coordinate(:,2),'*','r');

%% *********************** END FUNCTION ***********************************
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------