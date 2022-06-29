clc
close all
   
a = 0;
b = 1.5;
kolvo_node = 11;
h = (b - a) / (kolvo_node - 1);
format long

x_i_arr = a:h:b;  % равноудаленная сетка узлов
x_i_arr = X_cheb(a, b, kolvo_node);  % узлы Чебышева

        % задание 1
        % рассчет f_i (=C^i(x))
f_i_arr = Tailor_1(x_i_arr);
for i = 1:1:size(x_i_arr, 2)
     fprintf('x_i = %0.4f, f_i = %0.15f\n', x_i_arr(i), f_i_arr(i));
end
plot(x_i_arr, f_i_arr)
grid on
xlabel('x')
ylabel('f(x)')
title('Вычисляемая функция по Тейлору')

        % задание 2
        % рассчет L'(x)
L_list = [];
count = size(f_i_arr, 2); % = n
for x_i = x_i_arr
    L_list(end+1) = L_2(x_i, count, x_i_arr, f_i_arr);
    fprintf('x_i = %0.2f, L_i = %0.15f\n', x_i, L_list(end));
end

        % сравнение с реальной производной - график
diff_l = cos((pi*x_i_arr.^2)/2);
figure
hold on
plot(x_i_arr, diff_l, 'g')
plot(x_i_arr, L_list, 'k--')
grid on
xlabel('x')
ylabel('f`(x)')
legend('Реальная производная', 'Приближенное значение')
title('Сравнение вычисляемой производной с реальной')
hold off

        % погрешность при таких n и h
Accuracy = L_list - diff_l;
figure
plot(x_i_arr, abs(Accuracy))
xlabel('x')
title('Погрешность вычисления производной')
fprintf('Максимальная по модулю погрешность = %0.10f\n', max(abs(Accuracy)));

        % задание 3
        % Рассчет квадратур. ф-лы Гаусса
g_i_arr = [];
for x_i=x_i_arr
    g_i_arr(end+1) = Gauss_3(a, x_i, h);
end
fprintf('%0.9f\n', g_i_arr);

        % Поиск константы для h^4
eps = 10^(-25);
accur_Gauss = [];
const_list = [];
N_arr = 15:1:200; % N варьируем
for N = N_arr
    new_h = (b - a) / (N - 1);
%     new_h = (b - a) / N;
    Tailor_F = Tailor_3(a:new_h:b, eps); 
    Gauss_S = Gauss_3(a, b, new_h);
    accur = abs(Tailor_F - Gauss_S);
    accur_Gauss(end+1) = accur;
    const_list(end+1) = accur / (new_h^4);
end
fprintf('%0.10f\n', const_list);
figure
plot(N_arr, accur_Gauss)
xlabel('N')
% title('|C(x)-S(x)|')
title('Разница приближенных значений по Тейлору и Гауссу')
figure
plot(N_arr, const_list)
xlabel('N')
title('Поведение константы')
