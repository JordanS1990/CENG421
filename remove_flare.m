function [ output ] = remove_flare( input )
%This function attempts to remove the flare present within some images
    ref = imread('reference.jpg');
    
    %need 3 spots on the ground
    in1 = input(1000:1200,30:200,:);
    in2 = input(1000:1200,650:850,:);
    in3 = input(1000:1200,1500:1700,:);
    
    
    ref1 = ref(1000:1200,30:200,:);
    ref2 = ref(1000:1200,650:850,:);
    ref3 = ref(1000:1200,1500:1700,:);
    
    meanin = mean2(in1(:,:,1))
    meanref = mean2(ref1(:,:,1))
    
    meanin = mean2(in1(:,:,2))
    meanref = mean2(ref1(:,:,2))
    
    meanin = mean2(in1(:,:,3))
    meanref = mean2(ref1(:,:,3))
    

    output = 0;
end

