global im;
%% Read the image
[filename,pathname]=uigetfile('*.jpg','faces1');
A = iamread(fullfile(pathname,filename), 'jpg');

%% Get FaceDetector Object
FaceDetector = vision.CascadeObjectDetector();

%% Use Face Detector on A and get the facess
BBOX = step(FaceDetector,A);

%% Annotate these faces on the top of the Image
B = insertObjectAnnotation(A,'rectangle',BBOX,'Face');
imshow(B), title = 'Detected Faces';


%% Display the number of faces in a string
n = size(BBOX,1);
str_n = num2str(n);
str = strcat('Number of Detected Faces', str_n);
disp(str);