% plausible detection
rng(0)

n = 100;
m = 5*n;
nu = .1;

r = ceil(m/9);

A0 = randn(m,n);
A1 = randn(r,n);
x0 = randn(n,1);
x1 = randn(n,1);

b0 = A0*x0 + sqrt(n)*nu*randn(m,1);
b1 = sum(A1.*randn(r,n),2) + sqrt(n)*nu*randn(r,1);

b = [b0;b1];
A = [A0;A1];

xls = A\b;

% cvx_begin
%     variable xc(n)
%     minimize( norm(A*xc - b,1) )
% cvx_end

cvx_begin
    variable xc(n)
    minimize( sum(huber(A*xc - b, 2*sqrt(n)*nu)) )
cvx_end

norm(x0-xls)/norm(x0-xc)

% errors
k = r;

[~,indx] = sort(abs(A*xls-b),'descend');
%false pos
sum(indx(1:k) <= m)/(m+r)
%false neg
sum(indx(k+1:end) > m)/(m+r)


[~,indx] = sort(abs(A*xc-b),'descend');
%false pos
sum(indx(1:k) <= m)/(m+r)
%false neg
sum(indx(k+1:end) > m)/(m+r)
