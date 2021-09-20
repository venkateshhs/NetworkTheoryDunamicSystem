 function PageRank = PageRank_Calculator(A)

%% In-degrees and Out-degrees of the matrix
out_degrees = sum(A,2);

in_degrees = sum(A',2);

%% Fixing the out-degree vector for PageRanking Calculation
out_degrees_corrected = [];
for i = 1:max(size(A))
    if out_degrees(i) == 0
        out_degrees_corrected(i) = 1;
    else
        out_degrees_corrected(i) = out_degrees(i);
    end
end

%% Generating the matrix D
D = diag(out_degrees_corrected);

%% Preparation for final computation
one_vector = ones(12,1);                  %Change Here accoridng to number of rows
alpha = 0.6;                              %Alpha Value
beta = 1;                                  %Beta Value
identity = eye(12);                       %Change Here accoridng to number of rows
D_inverse = D^-1;

%% Final Computation of PageRank vector
%PageRank = D*(D - alpha*A')^-1 * one_vector
PageRank = beta * (identity - alpha* transpose(A) * D_inverse) ^ -1 * one_vector;

end
%       a b c d e f g h i j k l
A1 =   [0 1 0 0 1 0 0 0 0 0 0 0; % a
        0 0 0 0 0 0 1 0 0 0 0 0; % b
        0 1 0 1 0 0 1 0 0 0 0 0; % c
        0 1 0 0 0 0 0 1 0 0 0 0; % d
        0 1 0 0 0 0 1 0 1 0 0 0; % e
        0 0 0 0 1 0 0 0 0 0 0 0; % f
        0 0 0 1 0 1 0 0 0 1 1 0; % g
        0 0 0 1 0 0 1 0 0 0 0 1; % h
        0 0 0 0 0 0 0 0 0 1 0 0; % i
        0 0 0 0 1 0 0 0 0 0 1 0; % j
        0 0 0 0 0 0 1 1 1 0 0 0; % k 
        0 0 0 0 0 0 0 0 0 0 0 0]; % l
 
variant1 = PageRank_Calculator(A1)
