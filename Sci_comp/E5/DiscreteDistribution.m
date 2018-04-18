classdef DiscreteDistribution
    
    properties (Access = public)
        P double {mustBeNonnegative, mustBeLessThanOrEqual(P,1),...
            mustBeReal}
    end
    
    properties (Access = private)
        Cumulative double {mustSumTo1}
    end
    
    methods
        
        function obj = DiscreteDistribution(p)
            % Constructs a distribution function with discrete distribution            
            obj.P = p;
            obj.Cumulative = cumsum(obj.P);
        end
        
        function A = random(obj, varargin)
            % Returns a matrix containing random integers with 
            % discrete distribution
            A = zeros(varargin{:});
            for k = 1:numel(A)
                u = rand;
                A(k) = find(obj.Cumulative>=u, 1,'first');
            end
        end
        
    end
    
end

function mustSumTo1(cum)
     cum(end)
%     disp(cum(end))
%     if abs(cum(end)-1) > numel(cum)*eps
%         error('Sum of probabilities must add to 1')
%     end
end