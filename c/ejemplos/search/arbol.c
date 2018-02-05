#include <search.h>
#include <stdio.h>
#include <stdlib.h>

#define LEN(ARR) sizeof(ARR)/sizeof(*(ARR))

struct par {
        int clave;
        char significado;
};
        
int par_cmp (const void * x, const  void * y);

int main (int argc, char ** argv)
{
        void * arbol = NULL;
        struct par pares[] =
        {
                { 1, 'u' },
                { 2, 'd' },
                { 4, 'c' },
                { 6, 's' },
                { 10, 'z' },
                { 12, 'c' }
        };
        struct par * e, **e2;
        
        /* guardo */
        for (int i = 0; i < LEN(pares); i++) {
                e = malloc (sizeof(struct par));
                e -> clave = pares[i] . clave;
                e -> significado = pares[i] . significado;
                printf ("guardo %4d = %c  en %p \n",
                        e -> clave, e -> significado, e);
                /* 
                 * 
                 * aca se guarda en el arbol */
                e = tsearch (e, &arbol, par_cmp);
                /*
                 *
                 */
                if (!e) { puts ("error"); exit(1); }
        }

        /* busco */

        struct par buscar_par;
        struct par ** encontrado;
        
        for (int i = 0; i < 20; i++) {
                buscar_par.clave = i;
                encontrado = tfind (&buscar_par, &arbol, par_cmp);
                if (encontrado) {
                        printf("busco %d\t", buscar_par.clave);
                        struct par * ptr;
                        ptr = *encontrado;
                        printf ( "clave: %d \tsdo: %c\n", ptr->clave, ptr->significado);
                }
                else
                        printf("No encontre' %d\n", i);
        }
}

int par_cmp (const void * x, const  void * y)
{
        const struct par * p = x;
        const struct par * q = y;
        /* printf("comparo %d con %d, da %d\n", */
        /*        p -> clave,  q -> clave, */
        /*        p -> clave -  q -> clave); */
        
        return p -> clave - q -> clave;
}

int par_cmp2 (const void * x, const  void * y)
{
        const struct par * p = x;
        const struct par * q = y;
        return p -> clave - q -> clave;
}


