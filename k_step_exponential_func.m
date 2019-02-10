function k_hat=k_step_exponential_func(matrix, multiplier, step) 

matrix_tenti = matrix';
k = matrix_tenti * matrix;


[V,D] = eig(k);
[mev,index] =max(abs(diag(D)));
lambda = 1 / (mev * multiplier)

k_hat = eye(size(k));
tmp_k = eye(size(k));

for I=1:step
  tmp_k  = (tmp_k * (lambda * k)); 
  k_hat += tmp_k / prod(1:I);
end
