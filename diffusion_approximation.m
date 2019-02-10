function k_hat=diffusion_approximation(matrix, multiplier, use_eigs) 
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
[kV,kD] = eig(k);

use_eigs

# 使用する固有値を制限する(大きいものからuse_eigs個だけ使用)
tmp_kD = zeros(length(kD), length(kD));

for I=1:use_eigs
    [mev,index] =max(abs(diag(kD)));
    tmp_kD(index,index) = kD(index,index);
    kD(index,index) = 0.0;
end
kD = tmp_kD;

#計算 
for I=1:length(kD)
   kD(I,I) = e^kD(I,I);
end

k_hat = kV * kD * kV';
