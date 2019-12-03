% %% read data from .tsp file
fid=fopen('test1E2.tsp','r');
tline = fgetl(fid);
i=1; a=zeros(); 
while ischar(tline) 
    if i<=7          %% 7 is the lines which contain chars
        i=i+1;
        tline = fgetl(fid);
        continue;
    end 
    if i==(100+8)    %%注意这是最后一行,维数+1 
        break;       %%when the size of networks changes, we should update 101
    end
    c = regexp(tline,' ','split');
    a(i-7,1)=str2double(c{2});   %%提取坐标信息
    a(i-7,2)=str2double(c{3});
    tline = fgetl(fid);
    i=i+1;
end
fclose(fid);
%plot(a(ac',1),a(ac',2));