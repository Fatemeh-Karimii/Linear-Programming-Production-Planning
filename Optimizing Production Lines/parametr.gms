Sets
i Automobile-Model /1,2,3,4,5,6,7/
j Product-line /1,2,3,4,5/;

Parameters
s(j) Set up cost (dollar);
$call gdxxrw Main-problem-Inputs.xlsx par = s Rng =One!A1:B6 rdim=1
$gdxin Main-problem-Inputs.gdx
$load s
$gdxin
Parameters
c(j) Capacity (min);
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

display s,c,t,price,Maxdemand;
