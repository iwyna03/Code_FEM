% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
% Copyright (c) 2014 Code_FEM developers


% To find the solver
addpath('../../../../Code_FEM/Core');
MANAGE_PATH

% Define some global properties of the problem
global omega
omega = 20;

% Mesh & domain properties (if external mesher)
Mesh.MeshLength = 0.05;
Mesh.L = 2;
Mesh.H = 1;
Mesh.File = 'rectangle_T3.geo' ; 

% Initialise the geometry description
INIT_GEOMETRY

% Option 1: Load an existing mesh and add it to the geometry
% load('mesh_example');
% ADD_DOMAIN(node,edge,element);
% Option 2: use gmsh as an external mesher (http://geuz.org/gmsh/#Download)
RunGmsh(Mesh.File,Mesh,2,'Mesh');
load('Mesh');

% Construct the list of elements and nodes
BUILD_MODEL

% Create a table of degrees of freedom
BUILD_DOF

% Assembly of the global linear system of equations
BUILD_SYSTEM

% Solve the linear system
SOLVE_SYSTEM

% Start the GUI to plot the solution
POST_PROCESS
