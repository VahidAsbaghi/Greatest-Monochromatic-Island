%% ************** MUTATION FUNCTION *****************
function mut_pop=g_mutat(selpop,Pm,num_blue,blue_coordinate)
%% THIS FUNCTION DO MUTATION. SELECT 3 GENES AND CHENGE THEM RANDOMLY
l=length(selpop);
mut_pop=cell(1,1);
t=1;
for i=1:l
    r=rand;
    if r<Pm
        chr=selpop{i,1};
        len=length(chr);
        ll=randperm(len);
        rr=ll(1:3);
        r1=randi([1,num_blue],3,1);
        chr(rr,1)=r1;
        chr=unique(chr);
        if length(chr)>3
        delta=g_triangulation_one(blue_coordinate(chr,:),1,chr); 
        chr_temp1=g_create_poly1(delta);
        mut_pop{t,1}=(chr_temp1);
        t=t+1;
        end
    end
end
if isempty(mut_pop{1,1})
    mut_pop{1,1}=selpop{1,1};
end

%% ********************* END FUNCTION**************************************
%% ************************************************************************
%% ************************************************************************