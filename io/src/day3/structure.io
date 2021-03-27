Builder := Object clone

Builder indentationString := ""
Builder indentationSize := 2

Builder forward := method(
  # Tag name is obtained from forwarded message name.
  # For example: calling "Builder ul()" will result in "ul" tag name.
  tagName := call message name

  # Write opening tag
  writeln("#{self indentationString}<#{tagName}>" interpolate)

  # Message arguments are simply nested message calls in our case.
  # For example: calling "Builder ul(li())" will send message "ul" with argument "li", which is also a message to handle.
  call message arguments foreach(arg,
    # As we are handling nested messages we add some indentation to show the correct structure.
    self indentationString = indentationString .. (" " repeated(self indentationSize))

    # This line simply handles nested messages.
    content := self doMessage(arg)

    # If result of a message is a string then we simply display it.
    if (content proto == Sequence, (self indentationString .. content) println)

    # We need to slice indentation here so structure will be displayed correctly.
    # In fact, we could also place this assignment on line 22 before code which
    # displays nested text, but string is being also handled as a message here,
    # so nested strings wouldn't receive their own indentation.
    # That variation would display strings as if they were on the same level as their parent.
    self indentationString = indentationString exclusiveSlice(self indentationSize)
  )

  # Write closing tag
  writeln("#{self indentationString}</#{tagName}>" interpolate)
)

Builder ul(
  li("first item"),
  li(
    "second item",
    ul(
      li("second item first sub item"),
      li("second item second sub item"),
      li("second item third sub item")
    )
  )
)