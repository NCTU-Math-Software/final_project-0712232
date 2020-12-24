function triangle
  xx=[1];
  while 1
      if ( ~isempty(xx) )
          axis ([-15 15 -15 15])
          line([0 0],[-15 15]);
          line([-15 15],[0 0]);
          axis square
          hold on
          plot(0,0,'k.','MarkerSize',15);
          text(0.5,0,'O');

          x=[0 0 0];
          y=[0 0 0];
         [x(1),y(1),BUTTON] = ginput(1);
          plot(x(1),y(1),'b.','MarkerSize',20);
          text(x(1)+0.5,y(1)+0.5,'A');
          [x(2),y(2),BUTTON] = ginput(1);
          plot(x(2),y(2),'b.','MarkerSize',20);
          text(x(2)+0.5,y(2)+0.5,'B');
           plot([x(1) x(2)],[y(1) y(2)],'b','LineWidth',1.5);
          [x(3),y(3),BUTTON] = ginput(1);
           plot(x(3),y(3),'b.','MarkerSize',20);
          text(x(3)+0.5,y(3)+0.5,'C');
           plot([x(2) x(3)],[y(2) y(3)],'b','LineWidth',1.5);
          plot([x(1) x(3)],[y(1) y(3)],'b','LineWidth',1.5);
          
          %(0,0)
          O=[0,0];
          if Z(O,x,y)==1
              disp('原點不在三角形外')
              text(-13,13,'O : 原點(不在三角形外)','Color','black')
          else
              disp('原點在三角形外')
              text(-13,13,'O : 原點(在三角形外)','Color','black')
          end

          %hA
           hA=h(x,y,1);
           if Za(hA,x,y)==1
               disp('A點的垂足不在三角形外')
               plot(hA(1),hA(2),'gx','LineWidth',1)
               plot([x(1) hA(1)],[y(1) hA(2)],'--g')
               text(hA(1)+0.5,hA(2)+0.5,'hA','Color','green');
               text(-13,11,'hA : A點的垂足(不在三角形外)','Color','green')
           else
               disp('A點的垂足在三角形外')
              plot(hA(1),hA(2),'rx','LineWidth',1)
              plot([x(1) hA(1)],[y(1) hA(2)],'--r');
              plot([x(3) hA(1)],[y(3) hA(2)],'r');
              text(hA(1)+0.5,hA(2)+0.5,'hA','Color','red');
              text(-13,11,'hA : A點的垂足(在三角形外)','Color','red')
           end

          %hB
           hB=h(x,y,2);
           if Zb(hB,x,y)==1
               disp('B點的垂足不在三角形外')
               plot(hB(1),hB(2),'gx','LineWidth',1)
               plot([x(2) hB(1)],[y(2) hB(2)],'--g')
               text(hB(1)+0.5,hB(2)+0.5,'hB','Color','green');
               text(-13,9,'hB : B點的垂足(不在三角形外)','Color','green')

           else
              disp('B點的垂足在三角形外')
              plot(hB(1),hB(2),'rx','LineWidth',1)
              plot([x(2) hB(1)],[y(2) hB(2)],'--r');
              plot([x(1) hB(1)],[y(1) hB(2)],'r');
              text(hB(1)+0.5,hB(2)+0.5,'hB','Color','red');
              text(-13,9,'hB : B點的垂足(在三角形外)','Color','red') 
           end

           %hC
          hC=h(x,y,3); 
          if Zc(hC,x,y)==1
              disp('C點的垂足不在三角形外')
              plot(hC(1),hC(2),'gx','LineWidth',1)
              plot([x(3) hC(1)],[y(3) hC(2)],'--g');
              text(hC(1)+0.5,hC(2)+0.5,'hC','Color','green');
              text(-13,7,'hC : C點的垂足(不在三角形外)','Color','green')

          else
              disp('C點的垂足在三角形外')
              plot(hC(1),hC(2),'rx','LineWidth',1)
              plot([x(3) hC(1)],[y(3) hC(2)],'--r');
              plot([x(2) hC(1)],[y(2) hC(2)],'r');
              text(hC(1)+0.5,hC(2)+0.5,'hC','Color','red');
              text(-13,7,'hC : C點的垂足(在三角形外)','Color','red')
          end
          

      end
      [gx, ~, button] = ginput(1);    % input new interpolation point
      if ( button == 3 )% if right button, stop
          clf
          break
      end  % if right button, stop
      xx = unique([xx; gx]);           % #ok<AGROW>
      clf
  
      end
  
  
%判斷點是不是在三角形的外面  
function z=Z(p,X,Y)
   P=[p 0];
   A=[X(1) Y(1) 0];
   B=[X(2) Y(2) 0];
   C=[X(3) Y(3) 0];
   PA=A-P;
   PB=B-P;
   PC=C-P;
   a=cross(PA,PB);
   b=cross(PB,PC);
   c=cross(PC,PA);
   if (((a(3)>=0)||abs(a(3))<2.2204e-16)&&((b(3)>=0)||abs(b(3))<2.2204e-16)&&((c(3)>=0)||abs(c(3))<2.2204e-16))||(((a(3)<=0)||abs(a(3))<2.2204e-16)&&((b(3)<=0)||abs(b(3))<2.2204e-16)&&((c(3)<=0)||abs(c(3))<2.2204e-16))
       z=1;

   else
       z=0;
   end
end
function z=Za(p,X,Y)
   P=[p 0];
   A=[X(1) Y(1) 0];
   B=[X(2) Y(2) 0];
   C=[X(3) Y(3) 0];
   PA=A-P;
   PB=B-P;
   PC=C-P;
   a=cross(PA,PB);
   c=cross(PC,PA);
   if (((a(3)>=0)||abs(a(3))<2.2204e-16)&&((c(3)>=0)||abs(c(3))<2.2204e-16))||(((a(3)<=0)||abs(a(3))<2.2204e-16)&&((c(3)<=0)||abs(c(3))<2.2204e-16))
       z=1;
   else
       z=0;
   end
end
function z=Zb(p,X,Y)
   P=[p 0];
   A=[X(1) Y(1) 0];
   B=[X(2) Y(2) 0];
   C=[X(3) Y(3) 0];
   PA=A-P;
   PB=B-P;
   PC=C-P;
   a=cross(PA,PB);
   b=cross(PB,PC);
   if (((a(3)>=0)||abs(a(3))<2.2204e-16)&&((b(3)>=0)||abs(b(3))<2.2204e-16))||(((a(3)<=0)||abs(a(3))<2.2204e-16)&&((b(3)<=0)||abs(b(3))<2.2204e-16))
       z=1; 
   else   
       z=0;
   end
end
function z=Zc(p,X,Y)
   P=[p 0];
   A=[X(1) Y(1) 0];
   B=[X(2) Y(2) 0];
   C=[X(3) Y(3) 0];
   PA=A-P;
   PB=B-P;
   PC=C-P;
   b=cross(PB,PC);
   c=cross(PC,PA);
   if (((b(3)>=0)||abs(b(3))<2.2204e-16)&&((c(3)>=0)||abs(c(3))<2.2204e-16))||(((b(3)<=0)||abs(b(3))<2.2204e-16)&&((c(3)<=0)||abs(c(3))<2.2204e-16))
       z=1;
   else
       z=0;
   end
end
%找出三個點的垂足
function H=h(X,Y,i)
   H=[0,0];
   if i==1
       A=Y(2)-Y(3);
       B=-X(2)+X(3);
       C=Y(2)*(X(2)-X(3))-X(2)*(Y(2)-Y(3));
       A1=B*B*X(i)-A*B*Y(i)-A*C;
       A2=-A*B*X(i)+A*A*Y(i)-B*C;
   end
   if i==2
       A=Y(1)-Y(3);
       B=-X(1)+X(3);
       C=Y(1)*(X(1)-X(3))-X(1)*(Y(1)-Y(3));
       A1=B*B*X(i)-A*B*Y(i)-A*C;
       A2=-A*B*X(i)+A*A*Y(i)-B*C;
   end
   if i==3
       A=Y(1)-Y(2);
       B=-X(1)+X(2);
       C=Y(1)*(X(1)-X(2))-X(1)*(Y(1)-Y(2));
       A1=B*B*X(i)-A*B*Y(i)-A*C;
       A2=-A*B*X(i)+A*A*Y(i)-B*C;
   end
   AA=A*A+B*B;
   H(1)=A1/AA;
   H(2)=A2/AA;
end
end
