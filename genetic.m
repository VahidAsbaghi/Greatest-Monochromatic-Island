%% ********** GENETIC FUNCTION ***********
function [chr_best,fit_max]=genetic(red_coordinate,blue_coordinate,num_blue,num_red,Gen,Pc,Pm,Pm1,Popsize)
%% *************** MAIN GENETIC FUNCTION *********************************
%
pop_size=Popsize; %population size
P_ad=Pm1; % second mutation probability
G=Gen; % number of generations or number of iteration
pop=cell(pop_size,1); 
for i=1:pop_size %generate first population
    len_chr=randi([5,num_blue]);
    vert1=randperm(num_blue)';
    chr(1:len_chr,1)=vert1(1:len_chr,1);
    chr=unique(chr);
    delta=g_triangulation_one(blue_coordinate(chr,:),1,chr); 
    chr_temp=g_create_poly1(delta);
    pop{i,1}=chr_temp;
end

%compute fitness function of first population
fit_val=g_fitness(pop,red_coordinate,blue_coordinate,1,G);

for i=1:G % iterate genetic algorithm
    selpop=g_select(fit_val,pop,Pc); %selection operator
    cross_pop=g_cross_over(selpop,blue_coordinate); %crossover operation
    selpop1=[selpop;cross_pop]; 
    mut_pop=g_mutat(selpop1,Pm,num_blue,blue_coordinate); %first mutation operation
    pop_add=add_points(selpop,blue_coordinate,num_blue,P_ad); %second mutation
    tempop=[mut_pop;cross_pop;pop_add]; 
    fit_val_tem=g_fitness(tempop,red_coordinate,blue_coordinate,i,G); %compute fitness of new members
    [pop_new,fit_new]=g_replace(pop,fit_val,tempop,fit_val_tem); % replace and generate new population
    pop=pop_new;
    fit_val=fit_new;
end
[fit_max,II]=max(fit_val);
chr_best=pop{II,1};

%% ************************ END FUNCTION **********************************
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------