# Io - day 3

## Exercises
1. [Display XML generator result](./structure.io) in a structured way.
2. [Implement square brackets access](./lists.io) to lists.
3. [Handle attributes in XML generator](./attributes.io).\
   For example: ```book({"author": "Tate"})``` should return ```<book author="Tate">```.

## Resources

### Builder class (XML generator)

```io
Builder := Object clone

Builder forward := method(
  writeln("<", call message name, ">")
  call message arguments foreach(arg,
    content := self doMessage(arg)
    if (content type == "Sequence", writeln(content))
  )
  writeln("</", call message name, ">")
)

# Usage
Builder ul(
  li("Io"),
  li("Lua"),
  li("JavaScript")
)
```