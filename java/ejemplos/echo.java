/*
 * compilar:
 *
 * javac hw.java
 * java HWApp
 *
 */

class echo {
    public static void main(String[] args) {
	for (String s : args) {
	    System.out.println(s);
	}
    }
}
