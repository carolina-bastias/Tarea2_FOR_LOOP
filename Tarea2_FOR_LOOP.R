##Tarea-2

#instalando readr y csv
install.packages("readr")
install.packages("csv")

#abriendo paquetes 
library(readr)
library(csv)

#buscar nombre de los archivos para transferirlos a R
file.choose()

##PRIMERA PREGUNTA

#transfiriendo archivos hacia R 
grande.chile<- "/Users/carolinamaldonadobastias/Documents/big data/tarea2/grandes_chile.csv"
grande.colombia<-"/Users/carolinamaldonadobastias/Documents/big data/tarea2/grandes_colombia.csv"
grande.peru<-"/Users/carolinamaldonadobastias/Documents/big data/tarea2/grandes_peru.csv"
mediana.chile<-"/Users/carolinamaldonadobastias/Documents/big data/tarea2/medianas_chile.csv"
mediana.colombia<-"/Users/carolinamaldonadobastias/Documents/big data/tarea2/medianas_colombia.csv"
mediana.peru<-"/Users/carolinamaldonadobastias/Documents/big data/tarea2/medianas_peru.csv"
micro.chile<-"/Users/carolinamaldonadobastias/Documents/big data/tarea2/micro_chile.csv"
micro.colombia<-"/Users/carolinamaldonadobastias/Documents/big data/tarea2/micro_colombia.csv"
micro.peru<-"/Users/carolinamaldonadobastias/Documents/big data/tarea2/micro_peru.csv"
pequena.chile<-"/Users/carolinamaldonadobastias/Documents/big data/tarea2/pequena_chile.csv"
pequena.colombia<-"/Users/carolinamaldonadobastias/Documents/big data/tarea2/pequena_colombia.csv"
pequena.peru<-"/Users/carolinamaldonadobastias/Documents/big data/tarea2/pequena_peru.csv"

#corriendo los archivos importados 
grande_chile<-read_csv2(grande.chile)
grande_colombia<-read_csv2(grande.colombia)
grande_peru<-read_csv2(grande.peru)
mediana_chile<-read_csv2(mediana.chile)
mediana_colombia<-read_csv2(mediana.colombia)
mediana_peru<-read_csv2(mediana.peru)
micro_chile<-read_csv2(micro.chile)
micro_colombia<-read_csv2(micro.colombia)
micro_peru<-read_csv2(micro.peru)
pequena_chile<-read_csv2(pequena.chile)
pequena_colombia<-read_csv2(pequena.colombia)
pequena_peru<-read_csv2(pequena.peru)

#cambiar nombre de micro_chile; porcentaje_muejeres ->porcentaje_mujeres

names(micro_chile)=c('fecha',
                     'pais',
                     'ingresos',
                     'costos',
                     'porcentaje_mujeres',
                     'exportaciones',
                     'importaciones',
                     'endeudamiento',
                     'morosidad',
                     'reservas',
                     'spread',
                     'tasa_interes')
names(grande_colombia)=c('fecha',
                         'pais',
                         'ingresos',
                         'costos',
                         'porcentaje_mujeres',
                         'exportaciones',
                         'importaciones',
                         'endeudamiento',
                         'morosidad',
                         'reservas',
                         'spread',
                         'tasa_interes')
names(grande_peru)=c('fecha',
                     'pais',
                     'ingresos',
                     'costos',
                     'porcentaje_mujeres',
                     'exportaciones',
                     'importaciones',
                     'endeudamiento',
                     'morosidad',
                     'reservas',
                     'spread',
                     'tasa_interes')
names(mediana_chile)=c('fecha',
                       'pais',
                       'ingresos',
                       'costos',
                       'porcentaje_mujeres',
                       'exportaciones',
                       'importaciones',
                       'endeudamiento',
                       'morosidad',
                       'reservas',
                       'spread',
                       'tasa_interes')
names(mediana_peru)=c('fecha',
                      'pais',
                      'ingresos',
                      'costos',
                      'porcentaje_mujeres',
                      'exportaciones',
                      'importaciones',
                      'endeudamiento',
                      'morosidad',
                      'reservas',
                      'spread',
                      'tasa_interes')
names(pequena_peru)=c('fecha',
                      'pais',
                      'ingresos',
                      'costos',
                      'porcentaje_mujeres',
                      'exportaciones',
                      'importaciones',
                      'endeudamiento',
                      'morosidad',
                      'reservas',
                      'spread',
                      'tasa_interes')

names(grande_chile)=c('fecha',
                      'pais',
                      'ingresos',
                      'costos',
                      'porcentaje_mujeres',
                      'exportaciones',
                      'importaciones',
                      'endeudamiento',
                      'morosidad',
                      'reservas',
                      'spread',
                      'tasa_interes')
#variables de tamaño

grande<-sample(c("grande"),size = 65,replace = TRUE)
mediana<-sample(c("mediana"),size = 65,replace = TRUE)
micro<-sample(c("micro"),size = 65,replace = TRUE)
pequena<-sample(c("pequena"),size = 65,replace = TRUE)

#agregando las variables a su prespectivos tamanio

grande_chile<- cbind(grande_chile, tamanio=grande)
grande_colombia<-cbind(grande_colombia,tamanio=grande)
grande_peru<- cbind(grande_peru,tamanio=grande)
mediana_chile<-cbind(mediana_chile,tamanio=mediana)
mediana_colombia<-cbind(mediana_colombia,tamanio=mediana)
mediana_peru<- cbind(mediana_peru,tamanio=mediana)
micro_chile<- cbind(micro_chile,tamanio=micro)
micro_colombia<-cbind(micro_colombia,tamanio=micro)
micro_peru<-cbind(micro_peru,tamanio=micro)
pequena_chile<-cbind(pequena_chile,tamanio=pequena)
pequena_colombia<-cbind(pequena_colombia,tamanio=pequena)
pequena_peru<-cbind(pequena_peru,tamanio=pequena)


##SEGUNDA PREGUNTA

#reuniendo los datos en una sola variable

paises_datos<- rbind (grande_chile,grande_colombia,grande_peru,
                     mediana_chile,mediana_colombia,mediana_peru,
                     micro_chile,micro_colombia,micro_peru,
                     pequena_chile,pequena_colombia,pequena_peru)
#tipologia de datos 
#se hace una funcion 

tipologia_paises<-function(paises_datos){
  for (empresas in 1:length(paises_datos)) {
    quetipoes<-class(paises_datos[empresas])
    print(paste("la base de datos",empresas,"es de tipo",quetipoes))
  }
}

#prueba la muestra 

tipologia_paises(paises_datos)

##TERCERA PREGUNTA

#agrupando los datos que se utilizaran en una variable 
datos_chile_peru<-rbind(grande_chile,mediana_chile,micro_chile,pequena_chile,
                        grande_peru,mediana_peru,micro_peru,pequena_peru)

#se crea vectores
cantidadOBCH<-(0)
cantidadOBP<-(0)

#se crea la funcion 
VSobservaciones<-function(datos_chile_peru){
  for (VS in 1:length(paises_datos)) {
    if(datos_chile_peru[VS,2]=="chile"){
      cantidadOBCH<-cantidadOBCH+1
      
    }else if(datos_chile_peru[VS,2]=="peru"){
      cantidadOBP<-cantidadOBP+1
      
    }
  } 
    print(paste("chile posee",cantidadOBCH,"observaciones","mientras que peru tiene",cantidadOBP,"observaciones"))  

}

#se prueba la funcion
VSobservaciones(datos_chile_peru)

##CUARTA PREGUNTA

#cambiar los decimales a numeros 

paises_datos$ingresos<-sub(",",".",paises_datos$ingresos,fixed = TRUE)
paises_datos$ingresos<-as.numeric(paises_datos$ingresos)

#creacion de la funcion
MYingreso<-function(paises_datos){

  #variables de chile,peru y  colombia creadas 
  ChileI<-(0)
  ColombiaI<-(0)
  PeruI<-(0)
  
  #utilizacion de for
  
  for (IN in 1:(nrow(paises_datos))){
    if(paises_datos[IN,2]=="chile"){
      ChileI<-ChileI+paises_datos[IN,3]
  
    }else if (paises_datos[IN,2]=="colombia"){
      ColombiaI<-  ColombiaI + paises_datos[IN,3]
      
    }else if (paises_datos[IN,2]=="peru"){
      PeruI<-PeruI+paises_datos[IN,3]
      
}
      
  }
  INmaximo<-max(ChileI,ColombiaI,PeruI)
  if( ChileI==INmaximo){
    Mayor<-"chile"
    
    print(paste("los ingresos de chile fueron",Mayor))
    
  }else if(ColombiaI==INmaximo){
  Mayor<-"colombia"
    print(paste("los ingresos de colombia fueron",Mayor))
    
  }else if(PeruI==INmaximo){
    Mayor<-"peru"
    print(paste("los ingresos de peru fueron",Mayor))
    
  }  
  print(paste("el pais con mayor ingresos es",Mayor,"con $",INmaximo))
}
#se prueba la funcion 
MYingreso(paises_datos)

##QUINTA PREGUNTA

#Cambiar decimales a numeros enteros
paises_datos$tasa_interes<-sub(",",".",paises_datos$tasa_interes,fixed = TRUE)
paises_datos$tasa_interes<-as.numeric(paises_datos$tasa_interes)

#se crea variable para almacenar los datos

Nue_tasadeinteres<-sample(c(),replace = TRUE)
#se crea un for 
for (TI in 1:nrow (paises_datos)){
  if(paises_datos[TI,2]=='chile'){
    Nue_tasadeinteres<-c(Nue_tasadeinteres,(paises_datos[TI,12]*0.1))
    
  }else if(paises_datos[TI,2]=='colombia'){
    Nue_tasadeinteres<-c(Nue_tasadeinteres,(paises_datos[TI,12]+0.3))
    
    
  }else if(paises_datos[TI,2]=='peru'){
   Nue_tasadeinteres<-c(Nue_tasadeinteres,(paises_datos[TI,12])/10)
    
}
}
#se preuba el for
paises_datos<-cbind(paises_datos,Nue_tasadeinteres=Nue_tasadeinteres)


##SEXTA PREGUNTA
  
 #Cambiar decimales a numeros enteros
paises_datos$exportaciones<-sub(",",".",paises_datos$exportaciones,fixed= TRUE)
paises_datos$exportaciones<-as.numeric(paises_datos$exportaciones)


#se crea un vector para el for 
Nueva_exportaciones<-sample(c(1,2,3))

#se crea un for 
for (E in 1:(length(paises_datos$exportaciones))) {
  if(paises_datos$exportaciones[E]>2.1){
    paises_datos$exportaciones[E]<-1
  print(paste("si el numero es mayor a",2.1,"se cambia por",1))
}else if(paises_datos$exportaciones[E]<2.1){
  paises_datos$exportaciones[E]<-2
  print(paste("si numero es menor a",2.1,"se cambia por",2))
  
}else if(paises_datos$exportaciones[E] ==2.1){
  paises_datos$exportaciones[E]<-3
  print(paste("si el numero es igual a",2.1,"se cambia por",3))
}
}
#comrobacion del for 
paises_datos<-cbind(paises_datos,exportaciones=Nueva_exportaciones)

##SEPTIMA PREGUNTA

#se instala un paquete para hacer el grafico 

install.packages("ggplot2")

#se añada a la consola

library(ggplot2)

 #se crea vectores para el siguiente for
restanteChile<- (0)
restanteColambia<- (0)
restantePeru<- (0)

#creacion del for

  
for (ER in 1:(nrow(paises_datos))) {
   if(paises_datos[ER,2]=="chile"){
   restanteChile<-paises_datos[ER,3]-paises_datos[ER,8]
   
   }else if(paises_datos[ER,2]=="colombia"){
     restanteColambia<-paises_datos[ER,3]-paises_datos[ER,8]
     
   }else if(paises_datos[ER,2]=="peru"){
     restantePeru<-paises_datos[ER,3]-paises_datos[ER,8]
     
   }
 }

 #se atribuyen la variable x e y 

Endeuda<-c(restanteChile,restanteColambia,restantePeru)
paises<-c("chile","colombia","peru")

#se crea el grafico 
barplot(height = Endeuda,names.arg = paises,main = "Resta entre los ingresos y el
  endeudamiento",ylab="montos en US$ ",xlab="pais",col=c("red","green","white"))

