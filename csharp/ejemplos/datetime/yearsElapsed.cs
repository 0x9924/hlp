using System;
public class Clase
{
    public static void Main()
    {
        DateTime b = DateTime.Now;
        DateTime a = new DateTime(1960, 1, 2);
        
        Console.Write("Years Elapsed: ");
        int years = yearsElapsed(a, b);
        Console.WriteLine(years);
               
    }
    public static int yearsElapsed (DateTime desde, DateTime hasta)
    {
        return hasta.Year - desde.Year
            + (hasta.Month > desde.Month
               || hasta.Month == desde.Month
               && hasta.Day > desde.Day ? 1 : 0);

    }
    
}
