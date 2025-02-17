#import "../Glossario/Glossario.typ": glossario-therms 
#import "../functions.typ": inDict 

#show regex( "(?i)\b" + glossario-therms.join("\b|\b")+ "\b"): inDict