fid=fopen('mstp1E2_1.tsp','r');
tline = fgets(fid);
scale=3;
i=1; 
while ischar(tline) 
    if i<3 
        i=i+1;
        tline = fgetl(fid);
        continue;
    end 
    if i==(scale+2)             %%ע���������һ��,2 = vihecle����Ŀ + 1
        break;
    end
    splitc = regexp(tline,' ','split');
   % ��ȡc�нڵ�ID
   sc=str2double(splitc);   % transmit a cell to an array
   id=find(isnan(sc)==1);   % find the index which is Nan
   drawsc=sc(1:id(1)-1);
   %
   % function ��ȡ������Ϣ
   % ��ͼ
   plot(a(drawsc',1),a(drawsc',2));
   hold on
   scatter(a(:,1),a(:,2))
    tline = fgetl(fid);
    i=i+1;
end
fclose(fid);
