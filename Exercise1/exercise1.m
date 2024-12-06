%Exercise Q01 - Write an algorithm to find the area of the leaf and diseased area of the leaf
pkg load image

%Original image
I = imread('Exercise1\leaf.jpg');

%Convert the image to grayscale
I_gray = rgb2gray(I);
subplot(2,2,1);
imshow(I_gray)
title('Gray Image','fontsize',18)

%Apply thresholding to obtain a binary image
I_binary = graythresh(I_gray);
I = im2bw(I_gray,I_binary);
subplot(2,2,2);
imshow(I)
title('Binary Image','fontsize',18);

%Filled Image
I_filled = imfill(I,'holes');
subplot(2,2,3);
imshow(I_filled);
title('Filled Image','fontsize',18)

%Calculate the area of the leaf
leaf_area = bwarea(I_filled);
disp(['Area of the leaf: ',num2str(leaf_area),'pixels']);

%Calculate the area of the diseased regions
%complement image
complement = imcomplement(I); # intensity of bright and dark regions are reversed
subplot(2,2,4);
imshow(complement)
title('Complement Image','fontsize',18);
diseased_area = bwarea(complement);
disp(['Diseased area of the leaf: ',num2str(diseased_area),'pixels']);
