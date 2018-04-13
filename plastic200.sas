/* Generated Code (IMPORT) */
/* Source File: plastic.xlsx */
/* Source Path: /folders/myfolders */
/* Code generated on: 1/10/18, 7:33 PM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/folders/myfolders/plastic.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);

proc print data=WORK.IMPORT;
run;
proc means data=WORK.IMPORT;
var Strength Temperature Pressure;
run;
proc reg data=WORK.IMPORT;
model Strength = Temperature Pressure;
run;

proc sgplot data=WORK.IMPORT noautolegend;
title "Regression Line with Slope and Intercept";
reg y=Strength x=Temperature;
inset "Intercept = &Int" "Slope = &Slope" /
border title="Parameter Estimates" position=topleft;
run;
proc sgplot data=WORK.IMPORT noautolegend;
title "Regression Line with Slope and Intercept";
reg y=Strength x=Pressure;
inset "Intercept = &Int" "Slope = &Slope" /
border title="Parameter Estimates" position=topleft;
run;