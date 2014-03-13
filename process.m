function [ ] = process( input_image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    close all;
    imin = normalize(input_image);
    mask = imread('mask.jpg');
    red = imin(:,:,1);
    red(mask < 255) = 0;
    green = imin(:,:,2);
    green(mask < 255) = 0;
    blue = imin(:,:,3);
    blue(mask < 255) = 0;
    
    hist = imhist(blue)
    hist(1) = 0;
    figure('name', 'bluehist')
    plot(hist)
    
    hist = imhist(green)
    hist(1) = 0;
    figure('name', 'greenhist')
    plot(hist)
    
    hist = imhist(red)
    hist(1) = 0;
    figure('name', 'redhist')
    plot(hist)
    
    figure('name','red')
    ot = uint8((otsu(red,10)-1)*(28.3));
    imshow(ot)

    figure('name','green')
    ot = uint8((otsu(green,10)-1)*(28.3));
    imshow(ot)
    
    figure('name','blue')
    ot = uint8((otsu(blue,10)-1)*(28.3));
    imshow(ot)
    
    
    %Mask the original image
    tmp = imin(:,:,1);
    tmp(mask < 255) = 0;
    imin(:,:,1) = tmp;
    tmp = imin(:,:,2);
    tmp(mask < 255) = 0;
    imin(:,:,2) = tmp;
    tmp = imin(:,:,3);
    tmp(mask < 255) = 0;
    imin(:,:,3) = tmp;

    figure('name','all')
    imshow(imin)
    
    
    
end

