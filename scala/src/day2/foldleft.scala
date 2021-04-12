val list: List[String] = List("The", "Slayer", "has", "entered", "the", "facility")
val listTotalSize: Int = list.foldLeft[Int](0)((totalSize, item) => totalSize + item.size)
println(listTotalSize)