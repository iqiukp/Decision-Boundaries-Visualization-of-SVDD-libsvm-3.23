function x_range = grid_range(x, varargin)
%{ 
% DESCRIPTION
Compute the range of grid 

      x_range = grid_range(x)
      x_range = grid_range(x, 'r', 0.5)
      x_range = grid_range(x, 'n', 200)
      x_range = grid_range(x, 'r', 0.5, 'n', 200)

INPUT
  x            Training inputs (N*1)
               N: number of samples
  r            Radio of expansion (0<r<1)
  n            Number of grids

OUTPUT
  x_range      range of grid

Created on 18th October 2019, by Kepeng Qiu.
-------------------------------------------------------------%
%} 

% Default Parameters setting
r = 0.5;           % radio of expansion (0<r<1)
n = 2*size(x, 1);  % number of grids

% Parameters setting
if ~rem(nargin, 2)
    error('Parameters to rvm_train should be pairs')
end
numParameters = (nargin-1)/2;
if numParameters ~= 0
    for i =1:numParameters
        Parameters = varargin{(i-1)*2+1};
        value	= varargin{(i-1)*2+2};
        switch Parameters
            %
            case 'r'
                r = value;
                %
            case 'n'
                n = value;
        end
    end
end

%
xlim_1 = min(x);
xlim_2 = max(x);

%  min
if xlim_1<0
    xlim_1 = xlim_1*(1+r);
else
    xlim_1 = xlim_1*(1-r);
end

% max
if xlim_2<0
    xlim_2 = xlim_2*(1-r);
else
    xlim_2 = xlim_2*(1+r);
end

% range of grid
x_range = linspace(xlim_1, xlim_2, n);
end
