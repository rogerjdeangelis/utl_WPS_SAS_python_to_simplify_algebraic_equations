Using WPS proc python to simplify an algebraic equations

github
https://tinyurl.com/y9ekaugw
https://github.com/rogerjdeangelis/utl_WPS_SAS_python_to_simplify_algebraic_equations

https://goo.gl/Ca1cvh
https://github.com/rogerjdeangelis/utl_find_the_parameters_of_probability_density_function_that_yeild_a_given_probability

see
https://communities.sas.com/t5/Base-SAS-Programming/Simplify-Equation/m-p/460077


INPUT
=====

   %let expr=x+2+5+2*x+3;

    WANT  (SAS macro variable with the simplified expression)

    FROMPY=3*x + 10


PROCESS
=======

* WPS Python grabs the SAS/WPS macro variable contents and
  returns a macro variable with the simplified expression ;

%utl_submit_wps64("
  options set=PYTHONHOME 'C:\Users\backup\AppData\Local\Programs\Python\Python35\';
  options set=PYTHONPATH 'C:\Users\backup\AppData\Local\Programs\Python\Python35\lib\';
  proc python;
  submit;
  from sympy import *;
  import pandas as pd;
  x = symbols('x');
  z=sympify('&expr.');
  outputs = [];
  outputs.append(z);
  df=pd.DataFrame(outputs);
  df.to_clipboard(index=False,header=False);
  endsubmit;
  run;quit;
",returnVarName=fromPy);


OUTPUT
======

 47    %put &=fromPy;
 FROMPY=3*x + 10

*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;
  %let expr=x+2+5+2*x+3;

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;
   see process





