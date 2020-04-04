// compile with
// kotlinc program.kt -include-runtime -d program.jar
// run
// java -jar program.jar


import java.net.URL

fun main(args: Array<String>) {

    if (args.size != 1) {

        println("use: program url")
        
    } else {

        val x = URL("https://google.com").readText()
        println(x)
        
    }
}
