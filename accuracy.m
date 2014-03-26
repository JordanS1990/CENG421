function [] = accuracy( results, known, mask)

    %Note that for this function, the values are inverted, so a positive
    %score corresponds to the value 0
    xsize = size(results,2)
    ysize = size(results,1)
    tpcount = 0;
    tncount = 0;
    fpcount = 0;
    fncount = 0;
    for j= 1:ysize
        for i = 1:xsize
            if (mask(j,i) ~= 0)
                if(results(j,i) ~=0 & known(j,i) ~= 0)
                    tncount = tncount + 1;
                end
                if(results(j,i) ==0 & known(j,i) == 0)
                    tpcount = tpcount + 1;
                end
                if(results(j,i) ~=0 & known(j,i) == 0)
                    fncount = fncount + 1;
                end
                if(results(j,i) ==0 & known(j,i) ~= 0)
                    fpcount = fpcount + 1;
                end
            end
        end
    end
    recall = tpcount/(tpcount+fncount)
    precision = tpcount/(tpcount+fpcount)
end