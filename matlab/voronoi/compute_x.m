% filename: compute_x.m
% Purpose:  given an edge given by vertices v1 and v2 solves the general
% quadratic equation for defining values for x and y that can be used for
% finding the intersection point of line having v1 and v2 as vertices and
% the circle generated by a center point and a Radius
% Input:
% - v1 - array with x and y coordinates of vertice v1
% - v2 - array with x and y coordinates of vertice v2
% - xcenter - x coordinate of the reference center position
% - ycenter - x coordinate of the reference center position
% - Radius - the circle Radius 
% computation
% Output: roots of a quadratic equation 
% - x  - x root 
% - y  - y root
% - Reference :Erik Tjong Kim Sang. Voronoi diagrams without bounding boxes. In ISPRS Annals of the Photogrammetry, 
% Remote Sensing and Spatial Information Sciences, II-2/W2, 2015.


function [x y]=compute_x(v1,v2,xCenter,yCenter,Radius)

a = compute_a(v1,v2); % computes a coefficient value
b = compute_b(v1,v2); % computes b coefficient value

A=-1-a^2;
B=2*xCenter-2*a*(b-yCenter);
C=Radius^2-xCenter^2-(b-yCenter)^2;

% solving the general quadratic equation

x = roots([A B C]);

y=[];

for i=1:size(x,1)
    y=[y;a*x(i,1)+b];
end