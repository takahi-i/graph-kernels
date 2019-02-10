function k=laplacian(matrix)
matrix_tenti = matrix';
k = matrix_tenti * matrix;

for I=1:length(k)
   nodes = 0;
   for J=1:length(k)
     if k(I,J) > 0 ;
       nodes += k(I,J);
     endif
   end
   k(I,I) = k(I,I) - nodes;
end

