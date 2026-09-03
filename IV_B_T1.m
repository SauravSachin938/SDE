% Read data from Excel
T = readmatrix('Fig.3(e).xlsx');  % Replace with your filename

% Define B fields (Tesla)
B_fields = [-1, -0.8, -0.75, -0.6, -0.5, -0.45, -0.4, -0.35, -0.3, -0.25, -0.2, -0.175, -0.15, -0.125, -0.1, -0.075, -0.05, -0.02, -0.01, -0.005, 0, 0.005, 0.01, 0.02, 0.05, 0.075, 0.1, 0.125, 0.15, 0.175, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.6, 0.75, 0.8, 1];
numB = length(B_fields);

% Preallocate arrays
I_all = [];
dVdI_all = [];

% Loop over each B
for idx = 1:numB
    colI = (idx-1)*2 + 1;   % Current column index
    colV = colI + 1;        % dV/dI column index

    I_all(:,idx) = T(:,colI);
    dVdI_all(:,idx) = T(:,colV);
end

% Create meshgrid for plotting
[B_grid, I_grid] = meshgrid(B_fields, I_all(:,1));

% Plot using pcolor
figure;
pcolor(B_grid, I_grid, dVdI_all);
shading interp;   % smooth shading
colormap(jet);
colorbar;
set(gca, 'FontSize', 24);
