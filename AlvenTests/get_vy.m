function vy_end=get_vy(p_string)
% Load data for given p value
ufile=append('u',p_string,'.dat');
tfile=append('t',p_string,'.dat');
bfile=append('b',p_string,'.dat');
u=load(ufile);
t=load(tfile);
b=load(bfile);

% Unpack data
nt=length(t);
nx=length(u)/nt;
rho=zeros(nx,nt);
vx=rho;
vy=rho;
vz=rho;
e=rho;
bx=rho;
by=rho;
bz=rho;
for i=1:nt
    rho(:,i)=u((1:nx)+(i-1)*nx,1);
    vx(:,i)=u((1:nx)+(i-1)*nx,2);
    vy(:,i)=u((1:nx)+(i-1)*nx,3);
    vz(:,i)=u((1:nx)+(i-1)*nx,4);
    e(:,i)=u((1:nx)+(i-1)*nx,5);
    bx(:,i)=b((1:nx)+(i-1)*nx,1);
    by(:,i)=b((1:nx)+(i-1)*nx,2);
    bz(:,i)=b((1:nx)+(i-1)*nx,3);
end
vy_end=vy(:,end);
end