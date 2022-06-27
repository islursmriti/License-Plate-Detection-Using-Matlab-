
[filename,filepath] = uigetfile({'*.*';'*.jpg';'*.png';'*.bmp'},'seach image to be displayed');
fullname = [filepath filename];
axes(handles.axes1);
imshow(fullname);
axis off;
pause(1);

im = imread(fullname);

%% Initialization
%preprocessing
im = imresize(im, [480 NaN]);
imgray = rgb2gray(im);
axes(handles.axes14);
imshow(imgray);
axis off;
pause(1);
imbin = imbinarize(imgray);
im = edge(imgray, 'sobel');

%extracting plate region
im = imdilate(im, strel('diamond', 2));
im = imfill(im, 'holes');
im = imerode(im, strel('diamond', 10));
axes(handles.axes15);
imshow(im);
axis off;
pause(1);


Iprops=regionprops(im,'BoundingBox','Area', 'Image');
area = Iprops.Area;
count = numel(Iprops);
maxa= area;
boundingBox = Iprops.BoundingBox;
for i=1:count
   if maxa<Iprops(i).Area
       maxa=Iprops(i).Area;
       boundingBox=Iprops(i).BoundingBox;
   end
end    


im = imcrop(imbin, boundingBox);

%resize number plate to 240 NaN
im = imresize(im, [240 NaN]);

%clear dust
im = imopen(im, strel('rectangle', [4 4]));

%remove some object if it width is too long or too small than 500
im = bwareaopen(~im, 500);
%%%get width
 [h, w] = size(im);

axes(handles.axes2);
imshow(im);
axis off;
pause(1);

%read letter%character segmentation
Iprops=regionprops(im,'BoundingBox','Area', 'Image');
count = numel(Iprops);

noPlate=[]; % Initializing the variable of number plate string.

for i=1:count
   ow = length(Iprops(i).Image(1,:));
   oh = length(Iprops(i).Image(:,1));
   if ow<(h/2) & oh>(h/3)
       letter=readLetter(Iprops(i).Image); % Reading the letter corresponding the binary image 'N'.
       figure;
       imshow(Iprops(i).Image);
       noPlate=[noPlate letter]; % Appending every subsequent character in noPlate variable.
   end
end

%xlswrite('C:\Users\hp\Documents\MATLAB\authorized_vehicles_list.xlsx',r,'Sheet1','A1');
disp(noPlate);
set(handles.text3,'string',noPlate);
[~,a] = xlsread('database.xlsx');

p = strcmp(noPlate,a(:,2));
rowNum = find(p==1);

if p==0
 
   disp('The number plate is not authorized');
   set(handles.text5,'string',"not authorized");
   set(handles.text6,'string',"not allowed");
else
  
    disp('The number plate is authorized');
    set(handles.text5,'string',"authorized");
  set(handles.text6,'string',"allowed to enter");
end

im = noPlate(1:2);
if(im=='AN')
    disp('STATE: Andaman and Nicobar')
    set(handles.text4,'string',"Andaman and Nicobar");
end
if(im=='AP')
    disp('STATE: Andra Pradesh')
    set(handles.text4,'string',"Andra Pradesh");
end
if(im=='AR')
    disp('STATE: Arunachal Pradesh')
    set(handles.text4,'string',"Arunachal Pradesh");
end
if(im=='AS')
    disp('STATE: Assam')
    set(handles.text4,'string',"Assam");  
end
if(im=='BR')
    disp('STATE: Bihar')
    set(handles.text4,'string',"Bihar");
end
if(im=='CG')
    disp('STATE: Chhattisgarh')
    set(handles.text4,'string',"Chattisgarh");
end
if(im=='CH')
    disp('STATE: Chandigarh')
    set(handles.text4,'string',"Chandigarh");
end
if(im=='DD')
    disp('STATE: Dadra and Nagar Haveli and Daman and Diu')
    set(handles.text4,'string'," Dadra and Nagar Haveli and Daman and Diu");
end
if(im=='DL')
    disp('STATE: Delhi')
    set(handles.text4,'string',"Delhi");
end
if(im=='GA')
    disp('STATE: Goa')
    set(handles.text4,'string',"Goa");
end
if(im=='GJ')
    disp('STATE: Gujarat')
    set(handles.text4,'string',"Gujarat");
end
if(im=='HP')
    disp('STATE: Himachal Pradesh')
    set(handles.text4,'string',"Himachal Pradesh");
end
if(im=='HR')
    disp('STATE: Haryana')
    set(handles.text4,'string',"Haryana");
end
if(im=='JH')
    disp('STATE: Jharkhand')
    set(handles.text4,'string',"Jharkhand");
end
if(im=='JK')
    disp('STATE: Jammu and Kashmir')
    set(handles.text4,'string',"Jammu and Kashmir");
end
if(im=='KA')
    disp('STATE: Karnataka')
    set(handles.text4,'string',"Karnataka");
end
if(im=='KL')
    disp('STATE: Kerala')
    set(handles.text4,'string',"Kerala");
end
if(im=='LA')
    disp('STATE: Ladakh')
    set(handles.text4,'string',"Ladakh");
end
if(im=='LD')
    disp('STATE: Lakshadweep')
    set(handles.text4,'string',"Lakshadweep");
end
if(im=='MH')
    disp('STATE: Maharashtra')
     set(handles.text4,'string',"Maharashtra");
end
if(im=='ML')
    disp('STATE: Meghalaya')
    set(handles.text4,'string'," Meghalaya ");
end
if(im=='MN')
    disp('STATE: Manipur')
    set(handles.text4,'string'," Manipur ");
end
if(im=='MP')
    disp('STATE: Madhya Pradesh')
    set(handles.text4,'string'," Madhya Pradesh");
end
if(im=='MZ')
    disp('STATE: Mizoram')
    set(handles.text4,'string'," : Mizoram ");
end
if(im=='NL')
    disp('STATE: Nagaland')
    set(handles.text4,'string'," Nagaland ");
end
if(im=='OD')
    disp('STATE: Odisha')
    set(handles.text4,'string'," : Odisha ");
end
if(im=='PB')
    disp('STATE: Punjab')
    set(handles.text4,'string'," Punjab ");
end
if(im=='PY')
    disp('STATE: Puducherry')
    set(handles.text4,'string'," Puducherry ");
end
if(im=='RJ')
    disp('STATE: Rajasthan')
    set(handles.text4,'string'," Rajasthan ");
end
if(im=='SK')
    disp('STATE: Sikkim')
    set(handles.text4,'string'," Sikkim ");
end
if(im=='TN')
    disp('STATE: Tamil Nadu')
    set(handles.text4,'string'," Tamil Nadu");
end
if(im=='TR')
    disp('STATE: Tripura')
    set(handles.text4,'string'," Tripura ");
end
if(im=='TS')
    disp('STATE: Telangana ')
    set(handles.text4,'string'," Telangana ");
end
if(im=='UK')
    disp('STATE: Uttarakhand')
    set(handles.text4,'string'," Uttarakhand ");
end
if(im=='UP')
    disp('STATE: Uttar Pradesh')
    set(handles.text4,'string'," Uttar Pradesh");
end
if(im=='WB')
    disp('STATE: West Bengal')
    set(handles.text4,'string'," West Bengal");
end
