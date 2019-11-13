function e_mat = mat_e(matrix, upper_limit)
    e_mat = zeros(size(matrix));
    for k=0:1:upper_limit
        e_mat = e_mat + 1/factorial(k)*matrix^k;
    end
end

