%% ************** CROSSOVER FINCTION *******************
function cross_pop=g_cross_over(selpop,blue_coordinate)
% THIS FUNCTION OPERATE ONE POINT CROSSOVER 
l=length(selpop);
if rem(l,2)==0
    cross_pop=cell(l-1,1);
else
    cross_pop=cell(l-1,1);
end
i=1;
k=1;
while i<l
    if k>=l
        k=1;
    end
    chr1=selpop{i,1};
    chr2=selpop{k+1,1};
    l1=length(chr1);
    l2=length(chr2);
    r1=randi([2,l1-1]);
    r2=randi([2,l2-1]);
    while (r1+l2-r2>length(blue_coordinate))
        r1=randi([2,l1-1]);
        r2=randi([2,l2-1]);
    end
    chr_new1=unique([chr1(1:r1);chr2(r2+1:l2)]);
    if length(chr_new1)>3
    delta=g_triangulation_one(blue_coordinate(chr_new1,:),1,chr_new1); 
    chr_temp1=g_create_poly1(delta);
    cross_pop{i,1}=(chr_temp1);
    i=i+1;
    k=k+1;
    end
    k=k+1;
end

%% ************************************* END FUNTION **********************
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------