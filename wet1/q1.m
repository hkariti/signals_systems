%q1 - Runtime evaluation

clc;

%% Block 1 - Execute this block by selecting it and pressing CNTR + ENTER

N = 200;
% Use ';' to semicolon to supress defaultive PRINT to command line.

% Generate random matrix of size N by N

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

random_matrix = rand(N);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Block 2 - Execute this block by selecting it and pressing CNTR + ENTER

tic; % Begins timer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

random_matrix1 = rand(N);
random_matrix2 = rand(N);
matrix_mul = random_matrix1 * random_matrix2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
toc; % Stops timer and prints lapse time to the COMMAND LINE


%% Block 3 - Execute this block by selecting it and pressing CNTR + ENTER

tic;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

random_matrix1 = rand(N);
random_matrix2 = rand(N);

% Init empty results matrix
matrix_mul = zeros(N);
% Fill results matrix
for mul_row = 1:N
    for mul_col = 1:N
        for c = 1:N
            matrix_mul(mul_row,mul_col) = matrix_mul(mul_row,mul_col) + ...
                random_matrix1(mul_row, src_idx) * ...
                random_matrix2(src_idx,mul_col);
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
toc;

% Evaluate runtime.