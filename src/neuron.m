clear
clc
clf

M = [0 1; ... 
     0 1];

[X, T] = get_sets(0.2, 100);

net = newp(M, 1);
IW = net.IW{1,1}
bias = net.b{1}

net = init(net);
net.trainParam.epochs = 15;
net = train(net, X, T);

IW = net.IW{1,1}
bias = net.b{1}

test_data = [0.9, 0.1; ...
             0.9, 0.1];

sim(net, test_data)

x_range = linspace(-0.5, 1.5);
y_values = [];
for x = x_range
    y_values = [y_values (-IW(1) * x -bias)/IW(2)];
end

plot(x_range, y_values);
axis([-0.5 1.5 0 1])