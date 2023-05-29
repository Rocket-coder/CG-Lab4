function as=number2str(a,m,n)
% Transform number to string
ft=['%',int2str(m),'.',int2str(n),'f'];
if abs(a-round(a))<0.001 
                    as=int2str(round(a));
else                
    as=num2str(a,ft); %num2str(a,'%m.nf');
end
end

