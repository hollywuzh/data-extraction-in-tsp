%%%%generate the point set which has the intervals of the same size
%%%%
sidelength=50;
d=5;
sqrt_numpoints=ceil(sidelength/d*sqrt(2)/2);
num_half=ceil(sqrt_numpoints/2); %create 1/4 points of all points
x=zeros((sqrt_numpoints-1)^2,2);
for i=1:num_half
    for j=1:num_half
        x(i+(j-1)*num_half,1)=sidelength/2+d/sqrt(2)+2*d/sqrt(2)*(i-1);
        x(i+(j-1)*num_half,2)=sidelength/2+d/sqrt(2)+2*d/sqrt(2)*(j-1);
        x(i+num_half^2+(j-1)*num_half,1)=sidelength/2+d/sqrt(2)+2*d/sqrt(2)*(i-1);
        x(i+num_half^2+(j-1)*num_half,2)=sidelength/2-d/sqrt(2)+2*d/sqrt(2)*(-j+1);
        x(i+2*num_half^2+(j-1)*num_half,1)=sidelength/2-d/sqrt(2)+2*d/sqrt(2)*(-i+1);
        x(i+2*num_half^2+(j-1)*num_half,2)=sidelength/2+d/sqrt(2)+2*d/sqrt(2)*(j-1);
        x(i+3*num_half^2+(j-1)*num_half,1)=sidelength/2-d/sqrt(2)+2*d/sqrt(2)*(-i+1);
        x(i+3*num_half^2+(j-1)*num_half,2)=sidelength/2-d/sqrt(2)+2*d/sqrt(2)*(-j+1);
    end
end
