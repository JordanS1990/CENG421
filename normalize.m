function [ output ] = normalize( input)
%NORMALIZE Summary of this function goes here
%   Detailed explanation goes here
    in = imread(input);
    ref = imread('reference.jpg');

    red1 = in(1050:1400,650:1450,1);
    green1 = in(1050:1400,650:1450,2);
    blue1 = in(1050:1400,650:1450,3);
    
    red2 = ref(1050:1400,650:1450,1);
    green2 = ref(1050:1400,650:1450,2);
    blue2 = ref(1050:1400,650:1450,3);
    
    input_red_mean = mean2(red1);
    reference_red_mean = mean2(red2);
    input_green_mean = mean2(green1);
    reference_green_mean = mean2(green2);
    input_blue_mean = mean2(blue1);
    reference_blue_mean = mean2(blue2);
    
    output = zeros(size(ref,1), size(ref,2), 3);
    
    output(:,:,1) = reference_red_mean/input_red_mean*in(:,:,1);
    output(:,:,2) = reference_green_mean/input_green_mean*in(:,:,2);
    output(:,:,3) = reference_blue_mean/input_blue_mean*in(:,:,3);
    
    output = uint8(output);
    

end

