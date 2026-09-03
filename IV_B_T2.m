% Read data from Excel
T = readmatrix('Fig.4(e).xlsx');  % Replace with your filename

% Define B fields (Tesla)
B_fields = [-1, -0.85, -0.75, -0.6, -0.5, -0.45, -0.4, -0.35, -0.3, -0.25, -0.2, -0.175, -0.15, -0.125, -0.1, -0.075, -0.05, -0.02, 0, 0.02, 0.05, 0.075, 0.1, 0.125, 0.15, 0.175, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.6, 0.75, 0.85, 1];
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

figure;
pcolor(B_grid, I_grid, dVdI_all);
shading interp;
colormap(jet);
c = colorbar;
set(gca, 'FontSize', 24);


% Force scientific notation on colorbar
c.Ruler.Exponent = -3;        % sets exponent (10^-3)
c.TickLabelFormat = '%.1f';   % format for mantissa (0.0, 0.5, 1.0, …)

% Adjust axes
axis tight
ylim([-60 60])   % enforce current axis
