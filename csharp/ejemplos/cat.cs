// cat.cs
using System;
using System.IO;

public class Cat
{
    public static void Main(string[] args)
    {

	for(int i = 0; i < args.Length; i++)
	{
	    string filename = args[i];
	    if(File.Exists(filename))
	    {
		// Read the file and display it line by line.
		System.IO.StreamReader file = 
		    new System.IO.StreamReader(filename);

		string line;
		while((line = file.ReadLine()) != null)
		{
		    Console.WriteLine (line);
		}

		file.Close();
	    }
	    else
	    {
		Console.WriteLine ("File {0} couldn't be found.", filename);
	    }
	}
    }
}
