%% *********** GENETIC REPLACE FUNCTION *******************
function [pop_new,fit_new]=g_replace(pop,fit_val,tempop,fit_val_tem)
%% REPLACE OLD POPULATION BY NEW ONE
% POLYCY IS:
% SELECT SOME ELITE INDIVIDUALS
% SELECT SOME RANDOM INDIVIDUALS
% SELECT SOME OF BEST INDIVIDUALS FROM CHROMOSOMES
l=length(pop);
pop_new=cell(l,1);
fit_new=zeros(l,1);
[fitval1,II]=sort(fit_val,'descend');
[fitvaltem1,II1]=sort(fit_val_tem,'descend');
pop1=pop(II,1);
tempop1=tempop(II1,1);
%ll=length(tempop);
l1=uint32(round(l*0.6));%best of new chor. select
l2=uint32(round(l*0.25));%elite select
l3=l-l1-l2;%random select

pop_new(1:l1,1)=tempop1(1:l1,1);
pop_new(l1+1:l1+l2,1)=pop1(1:l2,1);
fit_new(1:l1,1)=fitvaltem1(1:l1,1);
fit_new(l1+1:l1+l2,1)=fitval1(1:l2,1);

l4=randperm(l);
l5=l4(1:l3);
pop_new(l1+l2+1:l,1)=pop(l5,1);
fit_new(l1+l2+1:l,1)=fit_val(l5,1);

%% ************************************* END FUNTION **********************
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------