function f = F_pr_ch(y,h)
% y - строчка из начальныхданных
% h - шаг по оси x
L = size(y,2);
N = L/2;
C = zeros(L,1);
C(1,1) = 4/3 * y(2) - 1/3 * y(3) - y(1);
for k = 2:N
    C(k,1) = h^2 * y(k+N);
end
C(N+1,1) = 4/3 * y(N)-1/3 * y(N-1) - y(N+1);
for k = N+2:L
    C(k,1) = - (y(k+1-N) - 2 * y(k-N) + y(k-N-1)) / (h^2);
end
f=C;
