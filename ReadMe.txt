Aqui tenemos un caso que ejemplifica el comportamiento especial que se le puede
dar a una celda cuando proviene un mensaje por un puerto de entrada.
En este caso tenemos una empresa que fabrica cierto tipo de sustancia, la
cual procesa 100 gr de la misma, de los cuales aproximadamente 30 gramos son
de carbono. Contamos con:

GENERADOR ----> COLA ----> EMBALAJE Y SELECCION \----> 1ra Seleccion
                                                /----> 2da Seleccion

Aqui el generador introduce en la cola porciones de 100 gramos de la sustancia
en cuestion. Dentro de estos 100 gramos, aprox. 30 son de carbono, aunque
estos ultimos tienen una distribucion normal (0,2).
Cuando pasa a la seccion de embalaje, se acumulan las porciones de sustancias
hasta formar 1 kg de la misma (10 porciones). Si de este kg, 300 +- 10 gramos
son de carbono, entonces la mercaderia es de primera calidad, sino, si el error
de carbono es mayor a 10 gramos, la mercaderia es de segunda calidad.