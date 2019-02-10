function k_hat=diffusion_approximation(matrix, multiplier, use_eigs) 
matrix_tenti = matrix';
k = matrix_tenti * matrix;

#�����Ǥ�-di(�Ρ���i��꿭�ӤƤ���ޤο���ޥ��ʥ�)�ˤ���
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

# ���Ѥ����ͭ�ͤ����¤���(�礭����Τ���use_eigs�Ĥ�������)
tmp_kD = zeros(length(kD), length(kD));

for I=1:use_eigs
    [mev,index] =max(abs(diag(kD)));
    tmp_kD(index,index) = kD(index,index);
    kD(index,index) = 0.0;
end
kD = tmp_kD;

#�׻� 
for I=1:length(kD)
   kD(I,I) = e^kD(I,I);
end

k_hat = kV * kD * kV';