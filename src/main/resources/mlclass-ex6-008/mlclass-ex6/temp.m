function x = temp()

%EMAILFEATURES takes in a word_indices vector and produces a feature vector
%from the word indices
%   x = EMAILFEATURES(word_indices) takes in a word_indices vector and
%   produces a feature vector from the word indices.

% Total number of words in the dictionary
n = 18;

% You need to return the following variables correctly.
    x = zeros(n, 1);

word_indices=[1;23;14;12;3;14;13;15;17;11;2;5;7;8;3;9]
size(word_indices)
for(i=1:size(word_indices))
 x(word_indices(i),1)=1
end

end
