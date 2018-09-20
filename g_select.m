%% ********** GENETIC SELECTION OPERATOR ************
function selpop=g_select(fit_val,pop,Pc)
%% SELECTION BASED ON ROULETE WHEEL ALGORITHM
l=length(pop);
sel_num=uint8(round(Pc*l));
[fitval,II]=sort(fit_val,'descend');
fitval=fitval./sum(fit_val);
pop1=pop(II,1);
q=cumsum(fitval);
selpop=cell(sel_num,1);
i=1;
while i<=sel_num
    r=rand;
    for j=1:l
        if r<=q(j)
            selpop{i,1}=pop1{j,1};
            i=i+1;
            break;
        end
    end
end

%% ************************************* END FUNTION **********************
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
        