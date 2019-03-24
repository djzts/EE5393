function p=probility(A)
p=zeros(1,3);
x=0.5*A(1)*(A(1)-1)*A(2);
y=A(1)*A(3)*(A(3)-1);
z=3*A(2)*A(3);

p(1)=(x)/(x+y+z);
p(2)=(y)/(x+y+z)+p(1);
p(3)=(z)/(x+y+z)+p(2);
end
