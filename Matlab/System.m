clc;clear;close all;

syms x(t) theta(t) u m M l g
m = 0.085; M = 1.24; l = 0.565; g = 9.806; r = 0.03378; d = 0.417;

T = 1/2*M*diff(x(t),t)^2  +  1/2*m*diff(x(t),t)^2 + 1/6*m*l^2*diff(theta(t),t)^2 + m*l/2*diff(x(t),t)*diff(theta(t),t)*cos(theta(t));
V = m*g*l/2*cos(theta(t)); 

L = T-V;

eqn1 = functionalDerivative(L,x(t))-u;
eqn2 = functionalDerivative(L,theta(t));

M = [1.325 -0.0240125*cos(theta(t));
     0.0240125*cos(theta(t)) 0.009044708];

F1 = subs(eqn1,diff(theta(t),t,t),0);
F1 = subs(F1,diff(x(t),t,t),0);
F2 = subs(eqn2,diff(theta(t),t,t),0);
F2 = subs(F2,diff(x(t),t,t),0);

FF = [F1;F2];
f = [diff(x(t),t);
     diff(theta(t),t);
     M^-1*FF];

% Linearize
A = jacobian(f,[x(t), theta(t), diff(x(t),t), diff(theta(t),t)]);
B = jacobian(f,u);

A = subs(A,{theta(t),x(t)},{0,0});
B = subs(B,{theta(t),x(t)},{0,0});

% Controller
A = [0, 0, 1, 0;
     0, 0, 0, 1;
     0, 0.450140429869330, 0, 0;
     0, 24.838566145834964, 0, 0];

B = [0; 0; -0.720072005982527; 1.911695661557612];

C = [0 1 0 0;];