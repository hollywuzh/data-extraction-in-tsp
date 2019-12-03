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
    if i==(scale+2) %%注意这是最后一行,2 = vihecle的数目 + 1
        break;
    end
    c = regexp(tline,' ','split');
       % 提取c中节点ID    
       %%function 提取坐标信息

    tline = fgetl(fid);
    i=i+1;
end
fclose(fid);
