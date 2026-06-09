function isr=isreal(F)

isr = true;
for k = 1:numel(F)
    isr = isr && isreal(get(F(k),'vals'));
    isr = isr && isreal(F(k).imps);
    if ~isr
        break;
    end
end