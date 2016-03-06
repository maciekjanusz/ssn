function[set_0, set_1] = expected(from_x, to_x, from_y, to_y, samples)
%test_x = linspace(-0.5, 1.5, samples);
%test_y = linspace(0, 1, samples);
test_x = linspace(from_x, to_x, samples);
test_y = linspace(from_y, to_y, samples);
set_0 = [];
set_1 = [];
for i = 1 : samples
    x = test_x(i);
    for j = 1 : samples
        y = test_y(j);
        value = round(x) & round(y);
        if value == 1
            set_1 = [set_1 [x; y]];
        else
            set_0 = [set_0 [x; y]];
        end
    end
end