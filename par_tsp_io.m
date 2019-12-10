%%.tsp�ļ�
%%%% �����ɵ�����ת��ΪC��������ʶ�������
%% ����1���������ݼ�
% numnodes=1500;
% h0=[50; 50];
% rand('seed',0);
% s=[h0,rand(2,numnodes-1)*100];
%userConfig = struct('xy',s','nSalesmen',3);
%resultStruct = mtspf_ga(userConfig);
%save s.mat;

%% ����2����hovering locations�Ż�
%s=hnew(:,sid);

%% ����3: wirte .tsp file with the point set 
s=x';
%%
fid=fopen('test64.tsp','w');                %'w'�����ļ�   **�ļ���**
fprintf(fid, 'NAME : test64\n');           %            **�ļ���**
fprintf(fid, 'COMMENT : intervals of the same size\n');%              �ļ�˵��
fprintf(fid, 'TYPE : TSP\n');
fprintf(fid, 'DIMENSION : 64\n');         %            **�ڵ��ģ**
fprintf(fid, 'VEHICLES : 4\n');            %            ���˻�����
fprintf(fid, 'EDGE_WEIGHT_TYPE : EUC_2D\n');
fprintf(fid, 'NODE_COORD_SECTION\n');
for i=1:numel(s(1,:))
    fprintf(fid, '%-d %-f %-f\n', i,s(1,i),s(2,i));
end
fprintf(fid, 'EOF\n');
fclose(fid);

%%.par�ļ�
fid=fopen('test64.par','w'); %'w'�����ļ�                   **�ļ���**
fprintf(fid, 'SPECIAL\n');   %����MAVNS�㷨
fprintf(fid, 'PROBLEM_FILE = test64.tsp\n');%             **�ļ���**
fprintf(fid, 'MTSP_OBJECTIVE = MINMAX\n');
fprintf(fid, 'MTSP_SOLUTION_FILE = mstp64_4.tsp\n'); %    **����ļ���**
fprintf(fid, 'MAX_CANDIDATES = 6\n');
fprintf(fid, 'MAX_TRIALS = 1000\n');

% fprintf(fid, 'MOVE_TYPE = 5\n');
% fprintf(fid, 'PATCHING_C = 3\n');
% fprintf(fid, 'PATCHING_A = 2\n');
%pi�ļ�
fprintf(fid, 'RUNS = 1\n');
fprintf(fid, 'TRACE_LEVEL = 1\n');
fclose(fid);
