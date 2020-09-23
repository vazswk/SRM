function my_SRMQ1_jpg(image_path,feature_path)
%image_path = 'E:\tangnianyao\code';
%feature_path = 'E:\dct\jrm_si-qe81_50.mat';
files=dir([image_path '\*.jpg']);
file_num=length(files)
F = zeros(file_num,12753);
names = cell(file_num,1);
for w =1:file_num
    tic
    jpegfilename=[image_path '\' files(w).name];
    tmp = jpegfilename;
    tmp(end-2:end) = 'pgm';
    p = imread(jpegfilename);
    imwrite(p,tmp,'pgm');
    fea = SRMQ1_mex({tmp});
    delete(tmp);
    %fea = SRMQ1(jpegfilename);  
    c = struct2cell(fea);
    f=[];
    for i=1:length(c)
        f = [f c{i}];
    end
    F(w,:) = f(:);
    names{w} = files(w).name;
    toc
end
save(feature_path,'F','names');