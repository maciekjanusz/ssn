clc
clear

fun1 = @(A, B) A.*2 + B.*3;
fun2 = @(A, B) A.*(B.*2);

%lr1 = 0.0000018; 
lr = 0.0000008;
delta = 0.1;
test_delta = 0.05;

M = [0 1; ... 
     0 1];

space = 1 : delta : 10;
X = combvec(space, space);
T = fun2(X(1, :), X(2, :));

X_0 = {X};
T_0 = {T};

net = newlin(M, 1, 0, lr);
net.IW{1,1} = rand(1, 2);
net.b{1} = rand(1);

%net = train(net, X, T);
net = adapt(net, X_0, T_0);

IW = net.IW{1,1}
bias = net.b{1}

test = [2.4;3.6];
res = sim(net, test)
analytic = fun2(test(1,:), test(2,:))
