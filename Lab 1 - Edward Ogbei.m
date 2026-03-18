% ============================================
% LAB01.m
% Laboratory 1 - Basic operations and functions in MATLAB
%
% Name: Edward Ogbei
% Student Number: 141521
% Course: Computer vision, pattern recognition & image retrieval - lab - JK 2025/26ST-L
% ============================================


%% =========================
% Exercise 1
% =========================
% Load one RGB image, convert to grayscale, save it with "Sz" suffix,
% and display both original and grayscale.

files = dir('*.jpg');   % get jpg files in current folder

if isempty(files)
    error('No JPG images found in current folder.');
end

img1 = imread(files(1).name);

% Convert to grayscale safely
if size(img1,3) == 3
    img1_gray = rgb2gray(img1);
else
    img1_gray = img1;
end

% Save with "Sz" suffix
[name,~,ext] = fileparts(files(1).name);
new_name = [name '_Sz' ext];
imwrite(img1_gray, new_name);

% Display
figure('Name','Exercise 1');
subplot(1,2,1);
imshow(img1);
title('Original Image');

subplot(1,2,2);
imshow(img1_gray);
title('Grayscale Image');


%% =========================
% Exercise 2
% =========================
% Load two RGB photos and display originals plus assembled pair.

if length(files) < 2
    error('At least two JPG images are required.');
end

imgA = imread(files(1).name);
imgB = imread(files(2).name);

figure('Name','Exercise 2');

subplot(2,2,1);
imshow(imgA);
title('Original 1');

subplot(2,2,2);
imshow(imgB);
title('Original 2');

subplot(2,2,[3 4]);
imshowpair(imgA, imgB, 'montage');
title('Assembled Pair');


%% =========================
% Exercise 3
% =========================
% Convert all images in Pom1 to grayscale and save into Pom2.

if ~exist('Pom1','dir')
    mkdir('Pom1');
end

if ~exist('Pom2','dir')
    mkdir('Pom2');
end

disp('Place at least two JPG images inside the Pom1 folder.');
pause;

pomFiles = dir(fullfile('Pom1','*.jpg'));
num_files = length(pomFiles);

figure('Name','Exercise 3 - Grayscale Batch');

for i = 1:num_files
    
    img = imread(fullfile('Pom1', pomFiles(i).name));
    
    if size(img,3) == 3
        img_gray = rgb2gray(img);
    else
        img_gray = img;
    end
    
    imwrite(img_gray, fullfile('Pom2', pomFiles(i).name));
    
    subplot(1, num_files, i);
    imshow(img_gray);
    title(['Gray: ', pomFiles(i).name]);
end


%% =========================
% Exercise 4
% =========================
% Resize images from Pom1 to 227x227x3 and save into Pom3.

if ~exist('Pom3','dir')
    mkdir('Pom3');
end

figure('Name','Exercise 4 - Resized Batch');

for i = 1:num_files
    
    img = imread(fullfile('Pom1', pomFiles(i).name));
    
    % Ensure 3 channels
    if size(img,3) == 1
        img = cat(3,img,img,img);
    end
    
    img_resized = imresize3(img, [227 227 3]);
    
    imwrite(img_resized, fullfile('Pom3', pomFiles(i).name));
    
    subplot(1, num_files, i);
    imshow(img_resized);
    title(['Resized: ', pomFiles(i).name]);
end

disp('Lab 01 completed successfully.');