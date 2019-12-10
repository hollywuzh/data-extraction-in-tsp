fid=fopen('mstp64_4.tsp','r');
tline = fgets(fid);
scale=3;
i=1;
a=x;                            % Here x denote the point set which hich has 
                                % the intervals of the same size
while ischar(tline) 
    if i<3 
        i=i+1;
        tline = fgetl(fid);
        continue;
    end 
    if i==(scale+5)             %%注意这是最后一行,2 = vihecle的数目 + 1
        break;
    end
    splitc = regexp(tline,' ','split');
   % 提取c中节点ID
   sc=str2double(splitc);   % transmit a cell to an array
   id=find(isnan(sc)==1);   % find the index which is Nan
   drawsc=sc(1:id(1)-1);
   %
   % function 提取坐标信息
   % 画图
   plot(a(drawsc',1),a(drawsc',2));
   hold on
   scatter(a(:,1),a(:,2))
    tline = fgetl(fid);
    i=i+1;
end
fclose(fid);
