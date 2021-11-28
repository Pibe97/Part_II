function [ v1,w1,v2,w2 ] = Extract_Q4( x1,y1,x2,y2 )

i=1;
while i<=1001
    v1(i)=x1(1+(i-1)*1000);
    v2(i)=x2(1+(i-1)*1000);
    w1(i)=y1(1+(i-1)*1000);
    w2(i)=y2(1+(i-1)*1000);
    i=i+1;
end

end

