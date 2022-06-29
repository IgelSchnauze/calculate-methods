function L = L_2(x, count, x_i_arr, f_i_arr)

L = 0;
for k = 1:1:count
    l_k = 0;

    for j = 1:1:count
        if j == k
            continue;  % пропуск шага
        end

        numer = 1;
        denomin = 1;
        for i = 1:1:count
            if i == k
                continue;  % пропуск шага, чтобы избежать деления на 0
            end
            denomin = denomin * (x_i_arr(k) - x_i_arr(i));

            if i == j
                continue;  % пропуск шага, чтобы избежать деления на 0
            end
            numer = numer * (x - x_i_arr(i));             
        end
        
        koef = numer / denomin;  % числитель / знаменатель ((X - x_i_arr(k)) * (X - x_i_arr(j)))
        l_k = l_k + koef;
    end
    L = L + (f_i_arr(k) * l_k);        
end 
