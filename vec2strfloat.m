function str=vec2strfloat(vec,m,n)
%Vector of numbers into string
ft=['% ',int2str(m),'.',int2str(n),'f']; %10.2f'
n=size(vec,2);
if n==1; 
   %str=['[',int2str(vec(1)),']']; 
   str=num2str(vec(1),ft); 
else
   str='[';
   for x=1:n-1;
      str=strcat(str,num2str(vec(x),ft),',');
   end;
   str=strcat(str,num2str(vec(n),ft),']');
end;
%printvector(str,vec);
end

