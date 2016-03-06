function[X, T, TEST] = get_sets(d, len) 
cd = 1.0 -d; % 1 - deviation
offset = 2 * d;
X = [(rand([2, len]).*offset)-d ...
     [(rand([1, len]).*offset)-d; (rand([1, len]).*offset)+cd] ...
     [(rand([1, len]).*offset)+cd; (rand([1, len]).*offset)-d] ...
     (rand([2, len]).*offset)+cd];
 
T = [zeros(1, len) ...
     zeros(1, len) ...
     zeros(1, len) ...
     ones(1, len)];
 
test_x = linspace(-0.5, 1.5, len);
test_y = linspace(0, 1, len);
expected = zeros(len);
for i = 1 : len
    x = test_x(i);
    y = test_y(i);
    expected(i) = round(x) & round(y);
end


 