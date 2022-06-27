ReadObj = VideoReader('cars1.mp4'); 
CurFrame = 0;
GetFrame = [90 150 160];
while hasFrame(ReadObj)
    CurImage = readFrame(ReadObj);
    CurFrame = CurFrame+1;
    if ismember(CurFrame, GetFrame)
        imwrite(CurImage, sprintf('frame%d.jpg', CurFrame));
    end
end