% filename: defineNewCell2Points.m
% Purpose:  according to the vertices of the voronoi diagram replaces the
% Inf points in cells generated by voronoin with the best point, resulting
% in a voronoi cell without Inf points for cases when only two vertices
% exist and one of them is inf, so inf must be replaced by at least two vertices.% Input:
% Input:
% - position: position of generating point (node) 
% - uniqueRef: matrix with unique vertices in the Voronoi Diagram
% - verticesPositions: positions of vertives composing the voronoi cell for the generating point (node)
% - nonInfPosition: non inf position
% - posInf: inf position into the vertices matrix
% - infID: 'middle', 'first' 'last' - label position of posInf
% Output:
% - newVertices = returns the new vertices matrix without inf points

function newVertices=defineNewCell2Points(position,uniqueRef,verticesPosition,nonInfPosition,posInf,infID)   


newVertices=[];
candidate=[];
distP1_P2=[];
evaluatedPoints=[];
distP1_P2_evaluated=[];

posP1=find(ismember(uniqueRef(:,3:4),nonInfPosition,'rows')); %find points related with non inf position
for ii=1:size(posP1,1) %for each point related with non inf position evaluates its combination with other points for
    for jj=1:size(posP1,1)
        if jj==ii
           continue;
        end
        % creates a auxiliary vertices for composing the polygon
        if strcmp(infID,'first')
            aux=[uniqueRef(posP1(ii,:),1:2);uniqueRef(posP1(jj,:),1:2);verticesPosition(2:size(verticesPosition,1),:)];
        else
            if strcmp(infID,'last')
                aux=[verticesPosition(1,:);uniqueRef(posP1(ii,:),1:2);uniqueRef(posP1(jj,:),1:2)];
            end
        end
        % verifies if the generating point (node) is inside of the polygono
        %  generated by the previous procedure. If yes, the sequence is
        %  candidate to replace the original
        if(inpolygon(position(1,1),position(1,2),aux(:,1),aux(:,2))) 
            candidate=[candidate aux ];
            distP1_P2=[distP1_P2;pdist([posP1(ii,:);posP1(jj,:)],'euclidean')];
        else
            evaluatedPoints=[evaluatedPoints aux];
            d=abs(det([uniqueRef(posP1(jj,:),1:2)-uniqueRef(posP1(ii,:),1:2);position-uniqueRef(posP1(ii,:),1:2)]))/norm(uniqueRef(posP1(jj,:),1:2)-uniqueRef(posP1(ii,:),1:2));
            distP1_P2_evaluated=[distP1_P2_evaluated;d];
        end
    end
end
if ~isempty(candidate)  % if there are candidate vertices that creates a polygon by replacing inf points using the closest points
    posMax=find(distP1_P2==min(distP1_P2));
    posMax=(posMax*2)-1;
    newVertices=candidate(:,posMax:posMax+1);
else
    if ~isempty(evaluatedPoints)
        posMax=find(distP1_P2_evaluated==min(distP1_P2_evaluated));
        posMax=(posMax*2)-1;
        newVertices=evaluatedPoints(:,posMax:posMax+1);
    end
end    