function cheb_i_arr = X_cheb(a, b, n)

cheb_i_arr = [];
for i = 1:1:n
    x_i = (a+b)/2 + ((b-a)/2) * cos(((2*i + 1)*pi)/(2*(n + 1)));
    cheb_i_arr(end+1) = x_i;
end
