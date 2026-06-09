function [med,abmp] = stat(x)
%STAT  media si abaterea medie patratica a unei selectii
%      [MED,ABMP] = STAT(X) calculeaza media si abaterea
%      medie patratica a selectiei X

n = length(x);
med = sum(x)/n;
abmp = sqrt(sum((x-med).^2)/n);