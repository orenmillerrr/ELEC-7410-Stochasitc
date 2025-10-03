clear;clc;close all

%% given
lambda = 1;

mu = 1/lambda;
var = 1/lambda^2;

%% 0 <= a <= 6

a = [0 : .001 : 6];

for i = 1 : length(a)
    % true
    true(i) = exp(-a(i));
    
    % markov bound
    mark(i) = mu / a(i);
    
    % chebyshev bound
    cheb(i) = 2/lambda^2 / (a(i))^2;
    
    % chernoff bound
    if a(i) <= mu
        cher(i) = nan;
    else
        cher(i) = a(i)*exp(-a(i)+1);
    end

end

figure
plot(a,true,"LineWidth",2)
hold on
plot(a,mark,"LineWidth",2)
plot(a,cheb,"LineWidth",2)
plot(a,cher,"LineWidth",2)
title("Bounded Probability 0 <= a <= 6")
xlabel("a")
ylabel("Probability")
ylim([0,1])
grid on 
legend(["true" "markov" "chebyshev" "chernoff"], "location", "best")

%% 6 <= a <= 20

a = [6 : .001 : 20];

for i = 1 : length(a)
    % true
    true(i) = exp(-a(i));
    
    % markov bound
    mark(i) = mu / a(i);
    
    % chebyshev bound
    if a(i) <= mu
        cheb(i) = nan;
    else
        cheb(i) = var / (a(i) - mu)^2;
    end
    
    % chernoff bound
    if a(i) <= mu
        cher(i) = nan;
    else
        cher(i) = a(i)*exp(-a(i)+1);
    end

end

figure
semilogy(a,true,"LineWidth",2)
hold on
semilogy(a,mark,"LineWidth",2)
semilogy(a,cheb,"LineWidth",2)
semilogy(a,cher,"LineWidth",2)
title("Bounded Probability 6 <= a <= 20")
xlabel("a")
ylabel("Probability")
grid on 
legend(["true", "markov", "chebyshev", "chernoff"], "location", "best")

