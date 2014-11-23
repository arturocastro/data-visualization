n = 10;

ratios = zeros(n);

for i = 1 : n
    sphere_vol = spherer(0.5, i)
    cube_vol = cuber(1, i)
    ratios(i) = spherer(5, i) / cuber(10, i);
end

plot(ratios);