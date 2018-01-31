using System;
using System.Collections.Generic;


public class RndTest
{
   public static void Main()
   {
       List<long> items = new List<long> {
           1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
           20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36,
           37, 38, 39, 40
       };

       Console.WriteLine();
       items.ForEach(itm => Console.Write("{0} ", itm));
       items.Barajar();
       Console.WriteLine();
       items.ForEach(itm => Console.Write("{0} ", itm));
       
   }
}

public static class Extensions
{
    public static void Barajar(this List<long> lista)
    {
        Random rnd = new Random();
        // las tuplas varian de entre 2 y 4 elementos
       int tuplaSize = rnd.Next(2,5);
       int n = lista.Count;
       int ntupla = 0; int i, index;

       while ( (ntupla + 1) * tuplaSize <= n )
       {
           i = 0;
           while (i < tuplaSize)
           {
               index = ntupla * tuplaSize;
               int k = rnd.Next(tuplaSize); // 0 < k < tuplaSize 
               // swap
               long value = lista[index + k];
               lista[index + k] = lista[index + i];
               lista[index + i] = value;
               i++;
           }
           ntupla++;
       }

       i = 0;
       index = ntupla * tuplaSize;
       while (index + i < n )
       {
           int k = rnd.Next(index, n);
           long value = lista[k];
           lista[k] = lista[index + i];
           lista[index + i] = value;
           i++;
       }

        return;
    }
}
