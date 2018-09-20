%% ****** CREATE POLYGON FOR GENETIC*******
function chr_temp2=g_create_poly1(delta)
%THIS FUNCTION CREATE AND SORT GENES AS THEM CREATE A SIMPLE POLYGON INPUT
%OF THIS FUNCTION IS TRIANGULATION RESULT FOR A CHROMOSOME
len=size(delta,1);
chr_temp2(1:3,1)=delta(1,:);
chr_temp2(4:len+2,1)=delta(2:len,3);

%% ************************************* END FUNTION **********************
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------