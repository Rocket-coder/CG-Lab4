function PName=poly2str2(A);
% Polynomial y=a_1x^N+a_2x^{N-1}+...+a_{N+1} to string
% A=[a_1,a_2,a_3,...,a_{N+1}],  (Note that a_1~=0 and N<9!)
%-------------------------------------------------------
  function xk=D(k);
    switch k 
    case 1; s=' ';   case 2; s='t';   case 3; s='t^2'; 
    case 4; s='t^3'; case 5; s='t^4'; case 6; s='t^5';
    case 7; s='t^6'; case 8; s='t^7'; case 9; s='t^8';
    end;
    xk=s;
  end
%-------------------------------------------------------    
if min(size(A))~=1; error('wrong format of data'); end;    
N=max(size(A));
if N>9; error('Error poy2str: deg>8'); end; 
S='' ; 
m=7; n=1; % precision
% k=1 -------------------------------------
a=A(1);  as=number2str(a,m,n); 
if a==0; error('first coefficient must be nonzero'); end; 
if     a== 1;  S=[S, D(N)];  
elseif a==-1;  S=[S,'-',D(N)]; 
elseif a~= 0;  S=[S,as,D(N)]; 
end; 
% 1<k<N -----------------------------------   
for k=2:N-1;
    a=A(k); as=number2str(a,m,n);    
    if a==0; continue;
    elseif a== 1;  S=[S,'+',D(N-k+1)];  
    elseif a==-1;  S=[S,'-',D(N-k+1)]; 
    elseif (a>0)&(abs(a)~=1); 
                   S=[S,'+',as,D(N-k+1)];
    else           S=[S,as,D(N-k+1)]; 
    end;    
end;
% k=N -------------------------------------
a=A(N); as=number2str(a,m,n);
if      a== 0; S=[S,''];  
elseif  a== 1; S=[S,'+1'];  
elseif  a==-1; S=[S,'-1']; 
elseif (a>0)&(abs(a)~=1); 
               S=[S,'+',as];
else           S=[S,as]; 
end; 
%------------------------------------------
PName=S; 
end

