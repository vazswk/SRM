function my_SCRMQ1(image_path,feature_path)
files=dir([image_path '\*.pgm']);
file_num=length(files)
F = zeros(file_num,18157);
names = cell(file_num,1);

parfor w =1:file_num
    tic
    filename = [image_path '\' files(w).name];  
    fea = SCRMQ1(filename);  
    c = struct2cell(fea);   
    f=[];
    for i=1:length(c)
        f = [f,c{i}];   %��102�����͵�������������������µĵ�����������;���ƣ�size(f)_= [22510,1]
    end
    F(w,:) = f;   %��f������������ʽ�洢�� w���������ĸ�������ÿ������������ͨ��F��Ӧһ�е�Ԫ�ر�ʾ %д�ɣ�����ʽ���Ϳ�����parfor
    names{w} = files(w).name;
    toc
end
disp('end')
save(feature_path,'F','names','-v7.3');