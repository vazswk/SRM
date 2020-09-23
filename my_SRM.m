function my_SRM(Image_path,feature_path)
%image_path = 'E:\BOSS\BOSS100Q75';QF=75;
%feature_path = 'E:\dct\jrm_si-qe81_50.mat';
image_path = Image_path{1};
files=dir([image_path '\*.pgm']);
file_num=length(files)
F = zeros(file_num,34671);
names = cell(file_num,1);

for w =1:file_num
    tic
    filename = [image_path '\' files(w).name];   %% jpegfilename = 'C:\Users\VAZ\Desktop\3.jpg';
    fea = SRM(filename);    % 102�����͵�����  �ṹ����ʽ 
    c = struct2cell(fea);   %  �������ʽ�洢102�����͵�������ÿ�������¶�Ӧ��ͬ��ά��������
    f=[];
    for i=1:length(c)
        f = [f,c{i}];   %��102�����͵�������������������µĵ�����������;���ƣ�size(f)_= [22510,1]
    end
    F(w,:) = f;   %��f������������ʽ�洢�� w���������ĸ�������ÿ������������ͨ��F��Ӧһ�е�Ԫ�ر�ʾ %д�ɣ�����ʽ���Ϳ�����parfor
    names{w} = files(w).name;
    toc
end
disp('end')
save(feature_path,'F','names');