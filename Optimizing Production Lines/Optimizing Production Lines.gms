Sets
i Automobile-Model /1,2,3,4,5,6,7/
j Product-line /1,2,3,4,5/;

Parameters
s(j) Set up cost (million of dollor);
$call gdxxrw Main-problem-Inputs.xlsx par = s Rng =One!A1:B6 rdim=1
$gdxin Main-problem-Inputs.gdx
$load s
$gdxin

Parameters
c(j) Capacity (hour);
$call gdxxrw Main-problem-Inputs.xlsx par = c Rng =One!A9:B14 rdim=1
$gdxin Main-problem-Inputs.gdx
$load c
$gdxin

parameters
t(j,i) Time needed to produce car i with production line j;
$call gdxxrw Main-problem-Inputs.xlsx par = t Rng =Two!A1:H6 rdim=1 cdim=1
$gdxin Main-problem-Inputs.gdx
$load t
$gdxin

parameters
Price(i) Car price model i;
$call gdxxrw Main-problem-Inputs.xlsx par =Price  Rng =two!A16:H17 cdim=1
$gdxin Main-problem-Inputs.gdx
$load Price
$gdxin

parameters
Maxdemand(i) The highest demand for cars i;
$call gdxxrw Main-problem-Inputs.xlsx par =Maxdemand  Rng = Two!A21:H22 cdim=1
$gdxin Main-problem-Inputs.gdx
$load Maxdemand
$gdxin

Variables
x(i,j) The number of model i cars produced by production line j
y(j)   Whether Production line j is launched
p(i)   Whether product i is produced
k7
w total income;

Binary Variables  y, p, k7;
integer variables x;

Equations
Income Total income
One The maximum number of production lines that can be set up
Two The impossibility of starting production lines 4 and 5 at the same time
Three Sales of at least 18000 cars
Four Production of at least 4 types of cars
Five At least 63% of family class production (all cars except pickups and vans) should be allocated to CUV cars
Six The total production volumes of models 1 2 and 3 should not exceed 32000 liters
Seven Production capacity of each production line
Eight Production at least 1500 vans
Nine Production line startup limit
Ten Definition of P(i) variable
Eleven Production at least 1500 of each car
Twelve Maxdemand of each car;

Income..          w =e= sum((i,j),price(i)*X(i,j))- sum(j,s(j)*y(j))- 3500000*(k7) ;
one..             sum(j,y(j))=l=3;
Two..             y("4") + y("5") =l=1;
Three..           sum((i,j),X(i,j))=g=18000;
Four..            sum(i,p(i))=g=4;
Five..            sum(j,x("1",j) + x("2",j))=g= 0.63*sum((j) , x("1",j)+ x("2",j)+ x("3",j)+ x("4",j)+ x("5",j));
Six..             3600*sum(j,x("1",j))+ 2400*sum(j, x("2",j))+ 7200*sum(j,x("3",j))=l=32000000;
Seven(j)..        sum((i),  t(j,i) * x(i,j))=l= c(j)* 60;
Eight..           sum(j,x("7",j))+10000000*k7=g=1500;
Nine(j)..         sum(i,x(i,j))=l=10000000*y(j);
Ten(i)..          sum(j,x(i,j))=l=10000000*p(i);
Eleven(i)..       sum(j,x(i,j))=g=1500*p(i);
Twelve(i)..       sum(j , x(i,j))=l= Maxdemand(i);

x.up(i,j) = 9999999;

Model tolid /all/;
Solve tolid using MIP Maximizing w;
Display  x.l, y.l , w.l ;
execute_unload "Main-problem-Inputs" w.l, X.l ;
execute 'gdxxrw Main-problem-Inputs.gdx var = w.l rng = Output!C2'
execute 'gdxxrw Main-problem-Inputs.gdx var = X.l rng = Output!B4'
