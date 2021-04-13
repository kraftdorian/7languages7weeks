// Scala 2.13.5 doesn't have XML and Actors so as for now I'm using Regex

object PageLoader {
  private def getPageSourceToString(url: String): String = scala.io.Source.fromURL(url).mkString

  def getPageSize(url: String): Int = getPageSourceToString(url).length

  def getPageLinksQuantity(url: String): Int = {
    val pageSourceString: String = getPageSourceToString(url)
    val regex: scala.util.matching.Regex = "<a".r
    regex.findAllIn(pageSourceString).toList.size
  }
}

val urls = List("https://www.google.com", "https://www.example.org")

def run(urls: List[String]): Unit = {
  for (url <- urls) {
    println(url + " size: " + PageLoader.getPageSize(url))
    println(url + " links quantity: " + PageLoader.getPageLinksQuantity(url))
  }
}

run(urls)