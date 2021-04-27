% Initial Guess
initialGuess = 200;

% Find Correct Guess
options = optimset('TolX',1e-6);
optGuess = fzero(@EvaluateGuess,initialGuess,options);
fprintf('The correct guess is cA(0) = %f\n',optGuess);

% Plot Results
[error,r,y] = EvaluateGuess(optGuess);
plot(r,y(:,1),'b',1,100,'ro','LineWidth',1.5);
xlabel('{\itr}','FontSize',16);
ylabel('{\itc_{A}}','FontSize',16);
