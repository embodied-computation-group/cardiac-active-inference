function [a1,a2,a3,a4] = plotPSD2(aH,F,PSD,VLF,LF,HF,limX,limY)
    
    cmap = cbrewer2('seq', 'Blues', 4);
    color.vlf=cmap(1,:);    %vlf color
    color.lf=cmap(2,:);     %lf color
    color.hf=cmap(3,:);      %hf color
    color.vhf = cmap(4,:); 
    
    % find the indexes corresponding to the VLF, LF, and HF bands
    iVLF= find( (F>=VLF(1)) & (F<VLF(2)) );
    iLF = find( (F>=LF(1)) & (F<LF(2)) );
    iHF = find( (F>=HF(1)) & (F<HF(2)) );

    %plot area under PSD curve
        
    a1 = area(aH,F(:),PSD(:),'FaceColor',color.vhf);
    hold(aH);
    a2 = area(aH,F(iVLF(1):iVLF(end)+1),PSD(iVLF(1):iVLF(end)+1), ...
        'FaceColor',color.vlf);
   
    a3 = area(aH,F(iLF(1):iLF(end)+1),PSD(iLF(1):iLF(end)+1), ...
        'FaceColor',color.lf);
    a4 = area(aH,F(iHF(1):iHF(end)+1),PSD(iHF(1):iHF(end)+1), ...
        'FaceColor',color.hf);
     
    
    if ~isempty(limX)
        set(aH,'xlim',limX)
    else
        limX=[min(F) max(F)];
    end
    if ~isempty(limY)
        set(aH,'ylim',limY)
    else
        limY=[min(PSD) max(PSD)];
    end
%     
%     %draw vertical lines around freq bands
%     line1=line([VLF(2) VLF(2)],[limY(1) limY(2)]);
%     set(line1,'color',[1 0 0],'parent',aH);
%     line2=line([LF(2) LF(2)],[limY(1) limY(2)]);
%     set(line2,'color',[1 0 0],'parent',aH);
%     line3=line([HF(2) HF(2)],[limY(1) limY(2)]);
%     set(line3,'color',[1 0 0],'parent',aH);
%    
    hold(aH)
        
end