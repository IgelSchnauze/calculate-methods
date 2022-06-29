function S_i_sum = Gauss_3(c, d, h)

z_i_arr = c:h:(d-h);
S_i_arr = [];

for z_i = z_i_arr
    z1 = z_i + (h/2) * (1 - (1/sqrt(3)));
    z2 = z_i + (h/2) * (1 + (1/sqrt(3)));
    S_i = (h/2) * (cos((pi*z1^2)/2) +  (cos((pi*z2^2)/2)));
    S_i_arr(end+1) = S_i;
end

S_i_sum = sum(S_i_arr);