trait Corrector {
  def correct(list: List[String], dictionary: Map[String, String]): List[String] = {
    list.map(item => {
      if (dictionary.exists(entry => entry._1 == item)) dictionary(item) else item
    })
  }
}

object Censor extends Corrector

val list: List[String] = List("oh heck", "hello")
val dictionary: Map[String, String] = scala.io.Source.fromFile("/scala/day2/dictionary.txt")
  .getLines()
  .map(line => {
    val entry = line.split(',').map(entryDef => entryDef.trim())
    entry(0) -> entry(1)
  })
  .toMap

val result: List[String] = Censor.correct(list, dictionary)
println(result)
