function fy = D_matric(y,h,eps)
% y - строчка из начальных данных
% h - шаг по оси x
L = size(y,2);
N = L/2;
C = zeros(L);
C(1,1) = 0;
for n = 2:N
    C(n,n) = -(2 + eps * h^2 * exp(eps * y(n)));
    C(n,n-1) = 1;
    C(n,n+1) = 1;
end
C(N+1,N+1) = 0;
for n = N+2:(2*N)
    C(n,n) = 1;
end
fy = C;