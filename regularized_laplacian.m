function k_hat=regularized_laplacian(matrix, multiplier)
matrix_tenti = matrix';
k = matrix_tenti * matrix;

#各要素を-di(ノードiより伸びている枝の数をマイナス)にする
for I=1:length(k)
   nodes = 0;
   for J=1:length(k)
     if k(I,J) > 0 ;
       nodes += k(I,J);
     endif
   end
   k(I,I) = k(I,I) - nodes;
end

[V,D] = eig(k);
[mev,index] =max(abs(diag(D)));
lambda = 1 / (mev * multiplier)


k = lambda * k;
k_hat = (inv(eye(length(matrix)) - k));
