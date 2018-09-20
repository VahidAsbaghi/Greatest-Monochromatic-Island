%% ******** FUNCTION MAIN **********
function [N_Bls_Island_GA,N_Bls_Island,num_blue]=main(Gen,Pc,Pm,Pm1,Popsize,N_Pts,N_Bls,rand_gen,flag1)
%% THIS FUNCTION IS MAIN 

x_len=100; % x direction length
y_len=100; % y direction length of search space
if rand_gen==1  %if you want to generate points randomly
    num=N_Pts;
    point_coordinate=zeros(num,2);
    point_class=zeros(num,1);
    % 1 is class red, 2 is class blue
    figure;
    title('Random Red and Blue Points Coordinates');
    hold on;
    for i=1:num %create random points
        p=rand;
        x_c=randi([1,x_len]);
        y_c=randi([1,y_len]);
        point_coordinate(i,1)=x_c;
        point_coordinate(i,2)=y_c;
        if p<0.5  %by equal probability, set a class, red or blue to each point
            point_class(i)=1;
            scatter(x_c,y_c,'r');
        else
            point_class(i)=2;
            scatter(x_c,y_c,'b');
        end
    end
    hold off;
    p_r=point_class==1;
    p_b=point_class==2;
    num_blue=sum(p_b); %count number of blue points
    num_red=sum(p_r);
    red_coordinate=zeros(num_red,2);
    blue_coordinate=zeros(num_blue,2);
    red_coordinate(:,1)=point_coordinate(p_r,1); %separate red and blue point coordinates
    red_coordinate(:,2)=point_coordinate(p_r,2);
    blue_coordinate(:,1)=point_coordinate(p_b,1);
    blue_coordinate(:,2)=point_coordinate(p_b,2);
    
else %if you want generate points nonrandomly and by traiangulation method
    num_of_all=N_Pts;
    num=num_of_all;
    num_blue_island=N_Bls;
    num_blue=num_blue_island;
    num_red=num-num_blue;
    [blue_coordinate,red_coordinate]=build_dataset(num_of_all,num_blue_island);
end

%%
if flag1==3 || flag1==2 % if you want start first algorithm or both algorithms
    dt1=cell(num_blue,1);
    for i=1:num_blue %triangulation based on each blue point as a head-point
        delta=triangulation_one(blue_coordinate,i);
        dt1{i,1}=delta;
    end
    i=0;
    while i<=num_blue %plot each triangulation result
        i=i+1;
        if i>num_blue
            break;
        end
        figure;
        subplot(2,2,1);
        triplot(dt1{i,1},blue_coordinate(:,1),blue_coordinate(:,2));
        hold on;
        scatter(red_coordinate(:,1),red_coordinate(:,2),'*','r');
        title('Triangulation by Blue Points');
        i=i+1;
        if i>num_blue
            break;
        end
        subplot(2,2,2);
        triplot(dt1{i,1},blue_coordinate(:,1),blue_coordinate(:,2));
        hold on;
        scatter(red_coordinate(:,1),red_coordinate(:,2),'*','r');
        i=i+1;
        if i>num_blue
            break;
        end
        subplot(2,2,3);
        triplot(dt1{i,1},blue_coordinate(:,1),blue_coordinate(:,2));
        hold on;
        scatter(red_coordinate(:,1),red_coordinate(:,2),'*','r');
        i=i+1;
        if i>num_blue
            break;
        end
        subplot(2,2,4);
        triplot(dt1{i,1},blue_coordinate(:,1),blue_coordinate(:,2));
        hold on;
        scatter(red_coordinate(:,1),red_coordinate(:,2),'*','r');
    end
    
    [x_l,~]=size(dt1{1,1});
    IN1=cell(num_blue,1);
    IN2=zeros(num_blue,x_l);
    for j=1:num_blue %determine whether exist red points in each triangle and determine vacant triangles
        for i=1:x_l
            xv(1)=blue_coordinate(dt1{j,1}(i,1),1);
            xv(2)=blue_coordinate(dt1{j,1}(i,2),1);
            xv(3)=blue_coordinate(dt1{j,1}(i,3),1);
            yv(1)=blue_coordinate(dt1{j,1}(i,1),2);
            yv(2)=blue_coordinate(dt1{j,1}(i,2),2);
            yv(3)=blue_coordinate(dt1{j,1}(i,3),2);
            IN1{j,1}(:,i) = inpolygon(red_coordinate(:,1),red_coordinate(:,2),xv,yv);
            IN2(j,i)=sum(IN1{j,1}(:,i));
        end
    end
    maxx=0;
    count=0;
    ver_del=0;
    for i=1:num_blue %compute maximum number of triangles that are neighbor and vacant
        count=0;
        ver_del=0;
        for j=1:x_l
            if IN2(i,j)==0
                count=count+1;
                ver_del(count)=j;
            else
                ver_del=0;
                count=0;
            end
            if count>=maxx
                maxx=count;
                vert1=ver_del;
                ii=i;
            end
        end
    end
    
    N_Bls_Island=create_poly(blue_coordinate,ii,vert1,dt1,red_coordinate,num_blue,num); %plot polygon
    N_Bls_Island_GA=0;
end
if flag1==1 || flag1==3 %if you want run genetic or both algorithms
    [chr_best,fit_max]=genetic(red_coordinate,blue_coordinate,num_blue,num_red,Gen,Pc,Pm,Pm1,Popsize); %run genetic main function
    lch=length(chr_best);
    N_Bls_Island_GA=lch;
    if flag1==1
        N_Bls_Island=0;
    end
    figure; %plot genetic results
    hold on;
    plot(blue_coordinate(chr_best,1),blue_coordinate(chr_best,2));
    plot([blue_coordinate(chr_best(lch),1),blue_coordinate(chr_best(1),1)],[blue_coordinate(chr_best(lch),2),blue_coordinate(chr_best(1),2)]);
    scatter(red_coordinate(:,1),red_coordinate(:,2),'SizeData',4,'Marker','*','MarkerFaceColor','red','MarkerEdgeColor','r');
    scatter(blue_coordinate(:,1),blue_coordinate(:,2),'*','b');
    linbl=sum(inpolygon(blue_coordinate(:,1),blue_coordinate(:,2),blue_coordinate(chr_best,1),blue_coordinate(chr_best,2)));
    title(['Number of blue points in island: ', num2str(linbl)]);
end

%% ************************************* END FUNTION **********************
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------