function str=vec2str(vec)
%Vector of integers into string
n=size(vec,2);
if n==1; 
   %str=['[',int2str(vec(1)),']']; 
   str=int2str(vec(1)); 
else
   str='[';
   for x=1:n-1;
      str=strcat(str,int2str(vec(x)),',');
   end;
   str=strcat(str,int2str(vec(n)),']');
end;
%printvector(str,vec);
end

