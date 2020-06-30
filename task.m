%псевдогиперболическое уравнение
clc, 
clear all
t0 = 0;
T = 5;
a = 0;
b = pi;
eps = 0.1;

Uinit0 = @ (x) 0;
Uinit1 = @ (x) -(x*(pi-x))^2 * sin(x / 3);

% введём сетку по x
% начальные значения функций при t=t0;
N = 50; % число интервалов по сетки по оси x функция значит на 1 больше
M = 50; % число интервалов по сетки по оси t 
% a11 = 0;
% a11 = 1;
% a11 = 1/2;
a11 = (1+i)/2; % коэффициент
h = (b-a)/N; % шаг по оси x
tau = (T-t0)/M; % шаг по времени
x = zeros(1,N+1);
t = zeros(1,M+1);
U = zeros(2*N,M+1);

% сетка по времени 
for k = 1:M+1
    t(k) = t0 + tau * (k-1);
end

%сетку по оси x
for k = 1:N+1
    x(k) = a + h * (k-1);
end

% заполним начальные значения
for k = 1:N+1
    U(k,1) = Uinit0(x(k));
end
for k = N+2:2*N
     U(k,1) = (Uinit1(x(k+1-N)) - 2 * Uinit1(x(k-N)) + Uinit1(x(k-1-N))) * (1/h^2) - eps * Uinit1(x(k-N)) * exp(eps * Uinit0(x(k-N)));
end

% вспомогательный массив
for k = 1:2*N
    y(k) = U(k,1);
end

for k = 1:M
    ME = D_matric(y,h,eps);% матрица для диффиренциально-алгебраической системы
    f = F_pr_ch(y,h);
    fy = yakobian(y,h);
    W1 = (ME - a11 * tau * fy) \ f;
    for p = 1:2*N
    U(p,k+1) = U(p,k) + tau * real(W1(p));
    y(p) = y(p) + tau * real(W1(p));
    end
end

for i = 1:1:M+1
    
    plot(x(1:1:N+1), U(1:1:N+1,1),'r.' ,'LineWidth' , 4 ) ;
    
    hold on ;
    %grid on;
    plot (x(1:1:N+1), U(1 : 1 :N+1,i) ,'-', 'LineWidth' , 3 ) ;
    hold on ;
    %axis([0 3.2 0.1 -20.1]);
    title('Решение задачи (Псевдогиперболическое уравнение)');
    xlabel ('x' ) ;
    ylabel ('U' ) ;
    txt2 = num2str(i); txt1 = 'Итерация = ';
    txt = [txt1 ' ' txt2] ;
    text(2.0,-1.0,txt);
    hold off ;
    drawnow ; 
    pause ( 0.5 ) ;
end