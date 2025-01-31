#import "../Glossario/Glossario.typ": glossario-therms 
#import "../functions.typ": inDict 

#show regex( "r(?i)\b" + glossario-therms.join("\b|")+ "\b"): inDict