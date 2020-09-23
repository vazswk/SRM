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
    fea = SRM(filename);    % 102个类型的特征  结构体形式 
    c = struct2cell(fea);   %  数组的形式存储102个类型的特征，每个特征下对应不同的维数的向量
    f=[];
    for i=1:length(c)
        f = [f,c{i}];   %将102种类型的特征，构造成列向量下的单个类型特征;共计：size(f)_= [22510,1]
    end
    F(w,:) = f;   %将f以行向量的形式存储， w代表样本的个数。即每个样本的特征通过F对应一行的元素表示 %写成：的形式，就可以用parfor
    names{w} = files(w).name;
    toc
end
disp('end')
save(feature_path,'F','names');