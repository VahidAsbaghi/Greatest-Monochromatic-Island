%% ************* SECOND MUTATION OPERATOR ************************
function  pop_add=add_points(selpop,blue_coordinate,num_blue,P_ad)
%%  **** SECOND MUTATION DO:
% 1- SELECT A CHROMOSOME RANDOMLY
% 2- ADD NEW BLUE POINT TO THIS CHROM.
tt=0;
for j=1:length(selpop)
    rr=rand;
    if rr<=P_ad
        chr=selpop{j,1};
        l=length(chr);
        chr1=zeros(l+1,1);
        r=randi([1,l]);
        chr1(1:r)=chr(1:r);
        c=1:num_blue;
        for i=1:l
            indx= c==chr(i);
            c(indx)=0;
        end
        cc=nonzeros(c);
        ll=randperm(int8(round(length(cc))));
        if ~isempty(cc)
            cp=cc(ll(1));
            chr1(r+1,1)=cp;
            chr1(r+2:l+1)=chr(r+1:l);
            delta=g_triangulation_one(blue_coordinate(chr1,:),1,chr1);
            chr_temp1=g_create_poly1(delta);
            tt=tt+1;
            pop_add{tt,1}=chr_temp1;
        end
    end
end

%% ************************************* END FUNTION **********************
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------