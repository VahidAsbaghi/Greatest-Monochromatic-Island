%% ************* FINTNESS FUNCTION OF GENETIC ALGORITHM ***************
function fit_val=g_fitness(pop,red_coordinate,blue_coordinate,G,max_gen)
%% ************** FITNESS COMPUTATION ******************************
%
l=length(pop);
IN=zeros(l,1);
IN1=zeros(l,1);
fit_val=zeros(l,1);
for i=1:l
    chr=pop{i,1};
    xv=blue_coordinate(chr,1);
    yv=blue_coordinate(chr,2);
    IN(i,1)=sum(inpolygon(red_coordinate(:,1),red_coordinate(:,2),xv,yv)); %sum number of red points in polygon
    IN1(i,1)=sum(inpolygon(blue_coordinate(:,1),blue_coordinate(:,2),xv,yv));
    if IN(i,1)==0
        fit_val(i,1)=length(chr)+IN1(i,1);
    else
        fit_val(i,1)=1;
    end
    if fit_val(i,1)<=0
        fit_val(i,1)=1;
    end
end

%% ************************************* END FUNTION **********************
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
