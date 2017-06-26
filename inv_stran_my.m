function h_tinv = inv_stran_my(ST,dt)

% size(ST) = [half_freq,Time]
N = size(ST,2);
nhaf=fix(N/2);

odvn=1;

if nhaf*2==N;
    odvn=0;
end

f=[0:nhaf -nhaf+1-odvn:-1]'/N/dt;
tau = 0:dt:dt*(N-1);
df = f(2)-f(1);
h_tinv = zeros(1,N);
for i=1:N
    h_tinv(i) = sum(ST(2:nhaf,i).*exp(1i*2*pi*f(2:nhaf)*tau(i))./(f(2:nhaf)))*sqrt(2*pi)*df;
end
h_tinv = real(h_tinv)*2;