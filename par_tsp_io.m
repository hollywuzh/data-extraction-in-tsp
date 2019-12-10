%%.tsp文件
%%%% 将生成的数据转换为C编译器可识别的类型
%% 方案1：制造数据集
% numnodes=1500;
% h0=[50; 50];
% rand('seed',0);
% s=[h0,rand(2,numnodes-1)*100];
%userConfig = struct('xy',s','nSalesmen',3);
%resultStruct = mtspf_ga(userConfig);
%save s.mat;

%% 方案2：对hovering locations优化
%s=hnew(:,sid);

%% 方案3: wirte .tsp file with the point set 
s=x';
%%
fid=fopen('test64.tsp','w');                %'w'更新文件   **文件名**
fprintf(fid, 'NAME : test64\n');           %            **文件名**
fprintf(fid, 'COMMENT : intervals of the same size\n');%              文件说明
fprintf(fid, 'TYPE : TSP\n');
fprintf(fid, 'DIMENSION : 64\n');         %            **节点规模**
fprintf(fid, 'VEHICLES : 4\n');            %            无人机数量
fprintf(fid, 'EDGE_WEIGHT_TYPE : EUC_2D\n');
fprintf(fid, 'NODE_COORD_SECTION\n');
for i=1:numel(s(1,:))
    fprintf(fid, '%-d %-f %-f\n', i,s(1,i),s(2,i));
end
fprintf(fid, 'EOF\n');
fclose(fid);

%%.par文件
fid=fopen('test64.par','w'); %'w'更新文件                   **文件名**
fprintf(fid, 'SPECIAL\n');   %运行MAVNS算法
fprintf(fid, 'PROBLEM_FILE = test64.tsp\n');%             **文件名**
fprintf(fid, 'MTSP_OBJECTIVE = MINMAX\n');
fprintf(fid, 'MTSP_SOLUTION_FILE = mstp64_4.tsp\n'); %    **输出文件名**
fprintf(fid, 'MAX_CANDIDATES = 6\n');
fprintf(fid, 'MAX_TRIALS = 1000\n');

% fprintf(fid, 'MOVE_TYPE = 5\n');
% fprintf(fid, 'PATCHING_C = 3\n');
% fprintf(fid, 'PATCHING_A = 2\n');
%pi文件
fprintf(fid, 'RUNS = 1\n');
fprintf(fid, 'TRACE_LEVEL = 1\n');
fclose(fid);
