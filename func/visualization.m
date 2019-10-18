function visualization(model, traindata, testdata, rho, X1, X2, para)
%{ 
% DESCRIPTION
Visualize decision boundaries of SVDD (libsvm-3.23)

      visualization(model, traindata, testdata, rho, X1, X2, para)

INPUT
  model               SVDD model
  traindata           Training data
  rho                 Bias term
  X1, X2              Grid range
  para                c, g, and accuracy

Created on 18th October 2019, by Kepeng Qiu.
-------------------------------------------------------------%
%} 

%% Figure setting
figure
set(gcf, 'unit', 'centimeters', 'position', [0 0 25 25])
% Axis settings
t_gca = 10;  % font size
% t_font = 'Helvetica'; % font type
t_font = 'Arial'; % font type
% set(gca,'yscale','log')
set(gca, 'FontSize', t_gca, 'FontName', t_font)
% legend setting
t_legend = t_gca*0.9;
% label setting
t_label = t_gca*1.1;
% size of scatter
sz = 36;
% line width
l_width = 1.2;

%% Contour of rho
subplot(2, 2, 1)

[~, ax1] = contourf(X1, X2, rho, 'ShowText', 'on');
colormap(jet);
ax1.LineWidth = 1;
str_1 = ['Contour of rho: c = ',num2str(para(1,1)),', g = ', num2str(para(1,2))];
title(str_1,...
      'FontSize', t_label,...
      'FontWeight', 'normal',...
      'FontName',t_font)
legend(ax1, 'Rho',...
      'FontSize', t_legend,...
      'FontWeight', 'normal',...
      'FontName', t_font)
set(gca, 'linewidth', l_width, 'fontsize', t_label, 'fontname', t_font )

%% Decision boundary
subplot(2, 2, 2)

[~, ax2] = contourf(X1, X2, rho, [0, 0]);
cmap = [225, 238, 211]/255; 
colormap(gca(), cmap);
ax2.LineWidth = 2;
ax2.LineColor = [242, 64, 99]/255;  
str_2 = ['Decision boundary: c = ',num2str(para(1,1)),', g = ', num2str(para(1,2))];
title(str_2,...
      'FontSize', t_label,...
      'FontWeight', 'normal',...
      'FontName', t_font)
legend(ax2, 'Decision boundary',...
      'FontSize', t_legend,...
      'FontWeight', 'normal',...
      'FontName', t_font)
set(gca, 'linewidth', l_width, 'fontsize', t_label, 'fontname', t_font )
  
%% Training data and decision boundary  
subplot(2, 2, 3)

[~, ax3] = contourf(X1, X2, rho, [0, 0]);
cmap = [1, 1, 1]; 
colormap(gca(), cmap);
ax3.LineWidth = 2;
ax3.LineColor = [236, 127, 130]/255;  
hold on
% Training data
ax4 = scatter(traindata(:,1), traindata(:,2), sz,...
            'MarkerEdgeColor', 'k',...
            'MarkerFaceColor', [186, 40, 53]/255);
% Support vector
SV = traindata(model.sv_indices,:);
ax5 = scatter(SV(:,1), SV(:,2), sz,...
            'MarkerEdgeColor', 'k',...
            'MarkerFaceColor', [29, 191, 151]/255);
legend([ax3, ax4, ax5],...
       {'Decision boundary', 'Training data', 'Support vector'},...
        'FontSize', t_legend, 'FontWeight', 'normal', 'FontName', t_font,...
        'Location', 'northwest', 'NumColumns',2)
    
title('Training data and decision boundary',...
      'FontSize', t_label,...
      'FontWeight', 'normal',...
      'FontName', t_font)
set(gca, 'linewidth', l_width, 'fontsize', t_label, 'fontname', t_font )


%% Prediction accuracy of testing data
subplot(2, 2, 4)

[~, ax6] = contourf(X1, X2, rho, [0, 0]);
colormap(gca(), cmap);
ax6.LineWidth = 2;
ax6.LineColor = [236, 127, 130]/255;  

hold on
% Training data
ax7 = scatter(traindata(:,1), traindata(:,2), sz,...
            'MarkerEdgeColor', 'k',...
            'MarkerFaceColor', [186, 40, 53]/255);

% Support vector
SV = traindata(model.sv_indices,:);
ax8 = scatter(SV(:,1), SV(:,2), sz,...
            'MarkerEdgeColor', 'k',...
            'MarkerFaceColor', [29, 191, 151]/255);
% Testing data
ax9 = scatter(testdata(:,1), testdata(:,2), sz,...
        'MarkerEdgeColor', 'k',...
        'MarkerFaceColor', [117, 51, 96]/255);
% legend settings
legend([ax6, ax7, ax8, ax9],...
        {'Decision boundary', 'Training data', 'Support vector', 'Testing data'},...
        'FontSize', t_legend, 'FontWeight', 'normal', 'FontName', t_font,...
        'Location', 'northwest', 'NumColumns', 2)
str_4 = ['Prediction accuracy of testing data (',num2str(para(1,3)),'%)'];
title(str_4,...
      'FontSize', t_label,...
      'FontWeight', 'normal',...
      'FontName', t_font)
set(gca, 'linewidth', l_width, 'fontsize', t_label, 'fontname', t_font )  

end
