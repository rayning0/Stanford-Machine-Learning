function plotData(x, y)
%PLOTDATA Plots the data points x and y into a new figure 
%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
%   population and profit.

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the training data into a figure using the 
%               "figure" and "plot" commands. Set the axes labels using
%               the "xlabel" and "ylabel" commands. Assume the 
%               population and revenue data have been passed in
%               as the x and y arguments of this function.
%
% Hint: You can use the 'rx' option with plot to have the markers
%       appear as red crosses. Furthermore, you can make the
%       markers larger by using plot(..., 'rx', 'MarkerSize', 10);

figure; % open a new figure window


plot(x, y, 'rx', 'MarkerSize', 10);   % Plot the data
axis([4, 24]);    % set x-axis range from 4 to 24
set(gca, 'xtick', [4 6 8 10 12 14 16 18 20 22 24]);  % increment x-axis tick marks by 2
ylabel('Profit in $10,000s');         % Set y-axis label
xlabel('Population of City in 10,000s'); % Set x-axis label


% ============================================================

end
