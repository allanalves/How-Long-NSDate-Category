# How-Long-NSDate-Category
Category for NSDate used to describe how long something occurred in past.\n
(Currently only Objective-C is supported)

Given a NSDate instance, it's main method returns a NSString describing in a simple understanding way to the
user how long ago something occurred. For example: "just now", "yesterday" or "2 weeks ago".

To use it:
* Simply import the header file "NSDate+HowLong.h"
* Call it on a NSDate instance and call the method "howLongDescription" to return the description like:
      NSString *timePassed = [date howLongDescription];
      
To translate it, create a Localizable.strings file and put the necessary. For example, in Portuguese-BR:

"right now" = "agora mesmo";
"yesterday" = "ontem"

"year" = "ano"; //for the plural words, it automatically puts a "S" at the end

"month" = "mês";
"months" = "meses"; //in this case plural is necessary 
                      because the translation for Months 
                      in Pt-BR needs more than a "S" at the 
                      end of the word
                      
"week" = "semana";
"day" = "dia";
"hour" = "hora";
"minute" = "minuto";
"second" = "segundo";
  
