function triangle
  n=0;
  while n<3
      [x,y,BUTTON] = ginput(1);
      n=n+1;
  end
    v0=[x(3)-x(1),y(3)-y(1)];
  v1=[x(2)-x(1),y(2)-y(1)];
  v2=[-x(1),-y(1)];
  u=(dot(v1,v1)*dot(v2,v0)-dot(v1,v0)*dot(v2,v1))/(dot(v0,v0)*dot(v1,v1)-dot(v0,v1)*dot(v1,v0));
  v=(dot(v0,v0)*dot(v2,v1)-dot(v0,v1)*dot(v2,v0))/(dot(v0,v0)*dot(v1,v1)-dot(v0,v1)*dot(v1,v0));
  if (u>0)&&(v>0)&&(u<1)&&(v<1)
      disp('原點在三角形裡面')
  end
  
  fa(x,y)=((x(2)-x(3))/(y(2)-y(3)))*(x-x(1))-(y-y(1));
  fb(x,y)=((x(1)-x(3))/(y(1)-y(3)))*(x-x(2))-(y-y(2));
  fc(x,y)=((x(2)-x(1))/(y(2)-y(1)))*(x-x(3))-(y-y(3));
  a=fa(0,0)*fa(x1,y1);
  b=fb(0,0)*fb(x2,y2);
  c=fc(0,0)*fc(x3,y3);
  if (a>0)&&(b>0)&&(c>0)
      disp('原點在三角形裡面')
  end

  
  D=[1 1 1;x;y];
  a=abs(det(D));
  A1=abs(x(1)*y(2)-x(2)*y(1));
  A2=abs(x(2)*y(3)-x(3)*y(2));
  A3=abs(x(1)*y(3)-x(3)*y(1));
  a=A1+A2+A3;
  if (A==a)&&(A1>0)&&(A2>0)&&(A3>0)
      disp('原點在三角形裡面')
  end

end
  