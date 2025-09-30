clc
clear
close all
pop_size=400;
maxgen=100;
c_r=0.85;
m_r=0.02;
N=1;
while N<51
    lambda=rand(1);
    r_x1=par(0,4,[pop_size,1]);
    r_x2=par(-1,3,[pop_size,1]);
    R=[r_x1,r_x2];
    n=1;
    while n<maxgen+1
        eval=evalu(R(:,1),R(:,2))+pan(R(:,1),R(:,2));
        [M,I]=min(eval);
        Max(n,:)=[M,I,R(I,1),R(I,2)];
        eval=1./eval;
        F=sum(eval);
        pp=eval./F;
        [j,k]=size(pp);
        for ii=1:j
            q(ii,:)=sum(pp(1:ii,:));
        end
        r1=rand([j,1]);
        for ii1=1:j
            for ii2=1:j-1
                if r1(ii1)>q(ii2) &&r1(ii1)<q(ii2+1)
                    v_new(ii1,:)=R(ii2+1,:);
                elseif r1(ii1)<q(1)   
                    v_new(ii1,:)=R(1,:);
                end
            end
        end
        A=crossover(v_new,c_r,lambda);
        B=mutate(A,m_r,n,maxgen,4,0,3,-1);
        R=B;
        n=n+1;
    end
    Max2(:,N)=Max(:,1);
    N=N+1;
end
MEAN=mean(Max2(n-1,1:N-1))
STD=std(Max2(n-1,1:N-1))
figure()
Mean= mean(Max2,2);
plot(Mean)
function y=par(down,up,size)
    y=down+(up-down)*rand(size);
end
function y=evalu(x1,x2)
    y=(x1-2).^2+(x2-1).^2;
end
function y=pan(x1,x2)
    a=0.01;
    b=0.01;
    g1=x1-2*x2+1;
    g2=x1.^2/4-x2.^2+1;
    y=a*g1+b*g2;
end

function y=crossover(parent,crossover_rate,lambda)
    [m,~]=size(parent);
    n=0;
    while n<100
        n=n+1;
        i2=1;
        r=rand([m,1]);
        cross=[];
        index=[];
        for i=1:m
            if r(i)<crossover_rate
                cross(i2,:)=parent(i,:);
                index(i2,:)=i;
                i2=i2+1;
                       
            end           
        end   
         [m1,~]=size(index);
        c=mod(m1,2);
        if c==0
            break
        end
       
    end
    
    for  i3=1:2:m1-1
        p_new(i3,:)=cross(i3,:)*lambda+(1-lambda)*cross(i3+1,:);
        p_new(i3+1,:)=cross(i3+1,:)*lambda+(1-lambda)*cross(i3,:);
        parent(index(i3,:),:)=p_new(i3,:);
        parent(index(i3+1,:),:)=p_new(i3+1,:);
    end
    y=parent;
end
function y=mutate(parent,mutate_rate,generation,max_generation,x1_max,x1_min,x2_max,x2_min)
    [m,n]=size(parent);
    r=rand(m,n);
    r1=randi([0,1]);
    b=2;
    C=parent;
    for i1=1:m
        for i2=1:n        
            if r(i1,i2)<mutate_rate           
                if i2==1&&r1==1               
                    delta1=(x1_max-parent(i1,i2))*r(i1,i2)*(1-generation/max_generation)^b;
                    x1_m=parent(i1,i2)+delta1;
                    C(i1,i2)=x1_m;
                elseif i2==1&&r1==0 
                    delta2=(parent(i1,i2)-x1_min)*r(i1,i2)*(1-generation/max_generation)^b;
                    x1_m=parent(i1,i2)-delta2;
                    C(i1,i2)=x1_m;
                elseif i2==2&&r1==1               
                    delta3=(x2_max-parent(i1,i2))*r(i1,i2)*(1-generation/max_generation)^b;
                    x2_m=parent(i1,i2)+delta3;
                    C(i1,i2)=x2_m;
                else 
                    delta4=(parent(i1,i2)-x2_min)*r(i1,i2)*(1-generation/max_generation)^b;
                    x2_m=parent(i1,i2)-delta4;
                    C(i1,i2)=x2_m;
                 end
            end
        end
    end
    y=C;
end    