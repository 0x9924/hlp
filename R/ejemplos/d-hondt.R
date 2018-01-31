## Sistema D'Hont
##
## Una descripcion se encuentra en este link:
## http://blog.pseudolog.com/article/la-ley-d-hont
## La funcion `getTabla1` es para una tabla T de n x m donde:
## n es el numero de bancas,
## m es el numero de partidos,
## Tij es la proporción de votos por banca  que podría dar
## como maximo el partido j.

ej1 <- c(partido1=39.89, partido2=29.07, partido3=19.68, partido4=4.33, partido5=3.8)
## bancas prov:35

ej2 <- c(partido1=47.84, partido2=22.42,  partido3=12.35, partido4=6.71, partido5=4.24,partido6=2.93)
## bancas caba:12


getBancas <- function(x, nbancas, soloBancas=TRUE)
{

    getTabla1 <- function(x, nbancas)
        {
            ret <- NULL
            for (i in 1:nbancas) {
                ret <- round(rbind(ret,x/i), 2)
            }
            as.data.frame(ret)
        }

    getBancasDeTab <- function(tab1, nbancas)
        {
            tab1.sort <- sort(unlist(tab1), decreasing=T)
            puntajeDeCorte <- tab1.sort[nbancas]
            tab1.bool <- ifelse( tab1 >= puntajeDeCorte, T, F)
            if (sum(tab1.bool) == nbancas) return (colSums(tab1.bool))
            else stop("No dan justo ", nbancas, " bancas.") ## arreglar esto!
        }
    out <- list()
    out[[1]] <- getTabla1(x,nbancas)
    out[[2]] <- getBancasDeTab(out[[1]],nbancas)
    if (soloBancas == TRUE) return( out[[2]] )
    else return ( out )
}

cat("\nUso:\ngetBancas(x=ej1, nbancas=35, soloBancas=F)\n\n")
