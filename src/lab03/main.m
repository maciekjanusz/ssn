clear
clc

% podzial na dane uczace i testowe (d, 1-d), where d in 0..1
% podzial losowy w kazdej klasie (nie wiadomo jak dane sa ulozone, czy jest korelacja itp)
% -> warstwa neuronow, skokowa funkcja aktywacji (nonlinear)
% jeden neuron odpowiada jednej klasie
% uczenie neuronow
% test
% interesuje nas stosunek bledow do licznosci proby
%
% tabela 
%        k1 k2 k3 ...
%     k1
%     k2
%     k3
%
%  sprawdzamy odpowiedzi dla roznego d
%
%  do wt. 5 kwietnia sprawozdaniez lab 1, 2, 3
%  mail, temat: SSN_Sprawozdanie1_nazwisko
%  plik: nazwa taka sama, zip
%  w pliku: katalogi l1, l2, l3: kody z zajec
%           sprawozdanie_nazwisko.pdf
%           co zostalo zrobione, jakie wyniki, omowic,
%           dlaczego takie wyniki (bez kodu)
%
%  nastepne zajecia 6 kwietnia: kolokwium
%  pytania typu: co mozna, czego nie mozna zrobic za pomoca danej struktury
%  neuronowej
%
% load wine_dataset
% load ionosphere

load iris_dataset

[vars, samples] = size(irisInputs);
d = 0.4;
testElems = floor(samples * d);

% min and max per input
min1 = min(irisInputs(1,:));
min2 = min(irisInputs(2,:));
min3 = min(irisInputs(3,:));
min4 = min(irisInputs(4,:));
max1 = max(irisInputs(1,:));
max2 = max(irisInputs(2,:));
max3 = max(irisInputs(3,:));
max4 = max(irisInputs(4,:));

% random permutate inputs and targets alike
rp = randperm(samples);
irisInputs = [irisInputs; rp];
irisTargets = [irisTargets; rp];
irisInputs = (sortrows(irisInputs.', 5)).';
irisTargets = (sortrows(irisTargets.', 4)).';
irisInputs(5,:) = [];
irisTargets(4,:) = [];

% create learning and testing sets
% inputs
learnInputs = irisInputs(:, 1 : testElems);
testInputs = irisInputs(:, testElems+1 : samples);
% targets
learnTargets = irisTargets(:, 1 : testElems);
testTargets = irisTargets(:, testElems+1 : samples);

% net definition
M = [min1 max1; ...
     min2 max2; ...
     min3 max3; ...
     min4 max4];

P = 3;

net = newp(M, P);
net = init(net);
net.trainParam.epochs = 50;
net = train(net, learnInputs, learnTargets);
simTargets = sim(net, testInputs);

% summary table
summary = zeros(3,4);
for i = 1 : (samples - testElems)
    correct = testTargets(:,i);
    sim = simTargets(:,i);
    if sum(sim) ~= 1
        summary(:,4) = summary(:,4) + correct;
    else
        if sim(1) == 1
            summary(:,1) = summary(:,1) + correct;
        elseif sim(2) == 1
            summary(:,2) = summary(:,2) + correct;
        else
            summary(:,3) = summary(:,3) + correct;
        end
    end
end

summary
