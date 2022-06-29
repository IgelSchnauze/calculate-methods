clc
close all
   
a = 0;
b = 1.5;
start_node = 1;
kolvo_node = 14;
format long
Max_accur_arr = [];

for n = start_node:1:kolvo_node
    h = (b - a) / (n - 1);
%     x_i_arr = a:h:b;  % равноудаленная сетка узлов
    x_i_arr = X_cheb(a, b, n);  % узлы Чебышева 
    
            % рассчет f_i (=C^i(x))
    f_i_arr = Tailor_1(x_i_arr);
          
            % рассчет L'(x)
    L_list = [];
    count = size(f_i_arr, 2); % = n
    for x_i = x_i_arr
        L_list(end+1) = L_2(x_i, count, x_i_arr, f_i_arr);
    end            
            % погрешность;
    diff_list = cos((pi*x_i_arr.^2)/2);
    Accuracy = L_list - diff_list;
    Max_accur_arr(end+1) = max(abs(Accuracy));
%     fprintf('%0.0f, %0.15f\n', n, Max_accur_arr(end));
end

[Min_accur, min_acc_nodes] = min(Max_accur_arr);
min_acc_nodes = min_acc_nodes + start_node - 1; % если начинали не с кол-во узлов = 1
fprintf('Минимальная погрешность (из максимальных) = %0.10f, \nСоответ кол-во узлов = %0.1f\n', Min_accur, min_acc_nodes);
    
        % погрешность - график
plot(start_node:1:kolvo_node, Max_accur_arr)
grid on
xlabel('N')
ylabel('Погрешность')
title('Зависимость максимальной погрешности от кол-ва узлов')