import java.io.*;


class cat {
    public static void main(String[] args) {
	for (String file : args) {
	    System.out.println(file);
	    try (BufferedReader br = new BufferedReader(new FileReader(file))) {
	    	String line;
	    	while ((line = br.readLine()) != null) {
	    	    System.out.println(line);
	    	}
		
	    } catch (IOException x) {
		System.err.format("IOException: %s%n", x);
	    }
	}
    }
}

