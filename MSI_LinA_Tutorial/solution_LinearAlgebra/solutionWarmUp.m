A = [1 3;4 2];
B = [5 7;8 6];
C = [0 1;1 0];
v = [1;2];

m1 = (A + B) * v

m2 = A*v + B*v

m3 = (A + B)*C

m4 = A*C + B*C

m5 = C*A + C*B

m6 = A*inv(A)
deltam6 = m6 - eye(2)

m7 = v.' * v

m8 = v * v.'

m9 = A*(B*C)

m10 = (A*B)*C

m11 = C*B*A

m12 = A.'

m13 = (A*v).'

m14 = v.'*A.'

m15 = v.' * A.' * A * v

m16 = sum(v)

m17 = ones(size(v)).'*v