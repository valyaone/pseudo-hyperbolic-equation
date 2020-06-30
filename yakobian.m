function fy = yakobian(y,h)
% y - строчка из начальных данных
% h - шаг по оси x
L = size(y,2);
N = L/2;
C = zeros(L);
C(1,1) = -1;
C(1,2) = 4/3;
C(1,3) = -1/3;
C(N+1,N-1) = -1/3;
C(N+1,N) = 4/3;
C(N+1,N+1) = -1;
for n = 2:N
    C(n,n+N) = h^2;
end
for n = N+2:(2*N)
    C(n,n-N) = 2/h^2;
    C(n,n-N-1) = -1/h^2;
    C(n,n+1-N) = -1/h^2;
end
fy = C;