function f_i_arr = Tailor_1(x_i_arr)

f_i_arr = [];
for x_i = x_i_arr  
    f_i = 0; % = C_i(x)
    n = 0;
    
    eps = 10^(-6);
    koef = (((-1)^n) * (pi/2)^(2*n)) / (factorial(2*n) * (4*n + 1));
    
    while (abs(koef) > eps) 
        f_i = f_i + (koef * x_i^(4*n + 1));
        q = ((-1) * ((pi/2)^2) * (4*n + 1)) / ((2*n + 1) * (2*n + 2) * (4*n + 5));
        koef = koef * q; % считаю заранее след
        n = n + 1;
    end
    f_i_arr(end+1) = f_i;
end