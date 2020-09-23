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
        f = [f,c{i}];   %将102种类型的特征，构造成列向量下的单个类型特征;共计：size(f)_= [22510,1]
    end
    F(w,:) = f;   %将f以行向量的形式存储， w代表样本的个数。即每个样本的特征通过F对应一行的元素表示 %写成：的形式，就可以用parfor
    names{w} = files(w).name;
    toc
end
disp('end')
save(feature_path,'F','names','-v7.3');