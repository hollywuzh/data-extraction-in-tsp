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
    if i==(scale+2) %%ע���������һ��,2 = vihecle����Ŀ + 1
        break;
    end
    c = regexp(tline,' ','split');
       % ��ȡc�нڵ�ID    
       %%function ��ȡ������Ϣ

    tline = fgetl(fid);
    i=i+1;
end
fclose(fid);
