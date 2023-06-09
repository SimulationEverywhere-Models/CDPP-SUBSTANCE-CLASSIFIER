[top]
components : genSustancias@Generator cola embalaje
out : outPrimeraSeleccion outSegundaSeleccion
link : out@genSustancias in@cola
link : out@cola in@embalaje
link : out1@embalaje outPrimeraSeleccion
link : out2@embalaje outSegundaSeleccion

[genSustancias]
distribution : exponential
mean : 3
initial : 1
increment : 0

[cola]
type : cell
width : 6
height : 1
delay : transport
defaultDelayTime  : 1
border : nowrapped
neighbors : cola(0,-1) cola(0,0) cola(0,1)
initialvalue : 0
in : in
out : out
link : in in@cola(0,0)
link : out@cola(0,5) out
localtransition : cola-rule
portInTransition : in@cola(0,0)  establecerSustancia

[cola-rule]
rule : 0            1 { (0,0) != 0 and (0,1) = 0 }
rule : { (0,-1) }   1 { (0,0) = 0 and (0,-1) != 0 and not isUndefined((0,-1)) }
rule : 0         3000 { (0,0) != 0 and isUndefined((0,1)) }
rule : { (0,0) }    1 { t }

[establecerSustancia]
rule : { 30 + normal(0,2) } 1000 { t }






[embalaje]
type : cell
width : 2
height : 2
delay : transport
defaultDelayTime  : 1000
border : nowrapped 
neighbors : n(-1,-1) n(-1,0) n(-1,1) 
neighbors : n(0,-1)  n(0,0)  n(0,1)
neighbors : n(1,-1)  n(1,0)  n(1,1)
in : in
out : out1 out2
initialvalue : 0
initialrowvalue :  0      00
initialrowvalue :  1      00
link : in in@embalaje(0,0)
link : in in@embalaje(1,0)
link : out@embalaje(0,1) out1
link : out@embalaje(1,1) out2
localtransition : embalaje-rule
portInTransition : in@embalaje(0,0) acumular-rule
portInTransition : in@embalaje(1,0) incCant-rule

[embalaje-rule]
rule : 0                    1000 { isUndefined((1,0)) and isUndefined((0,-1)) and (0,0) = 10 }
rule : 0                    1000 { isUndefined((-1,0)) and isUndefined((0,-1)) and (1,0) = 10 }
rule : { (0,-1) / (1,-1) }  1000 { isUndefined((-1,0)) and isUndefined((0,1)) and (1,-1) = 10 and abs( (0,-1) / (1,-1) - 30 ) <= 1 }
rule : { (-1,-1) / (0,-1) } 1000 { isUndefined((1,0)) and isUndefined((0,1)) and (0,-1) = 10 and abs( (-1,-1) / (0,-1) - 30 ) > 1 }
rule : { (0,0) }            1000 { t } 

[acumular-rule]
rule : { portValue(thisPort) + (0,0) } 1000 { portValue(thisPort) != 0 }
rule : { (0,0) }                       1000 { t }

[incCant-rule]
rule : { 1 + (0,0) } 1000 { portValue(thisPort) != 0 }
rule : { (0,0) }     1000 { t }
