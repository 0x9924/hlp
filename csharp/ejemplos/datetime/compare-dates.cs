using System;
public class Clase
{
    public static void Main()
    {
        DateTime b = new DateTime(1960, 1, 2, 1, 2, 31);
        DateTime a = new DateTime(1960, 1, 2, 1, 2, 4);
        
        Console.Write("Comparing dates: ");
        DateTime older = b < a ? b : a;
        
        Console.WriteLine("Older one is:");
        Console.Write(older);
               
    }
    
}
