# We register a new assignment operator.
OperatorTable addAssignOperator(":", "atPutAttribute")

# This method will get called every time when interpreter "sees" curly brackets.
curlyBrackets := method(
  result := Map clone
  call message arguments foreach(arg,
    /* This is a tricky one.
    Every element which is present between brackets and separated with comma is in fact an argument of this method.
    In our case we need to evaluate each argument in Map context, so each "key: value" pair will be put in the Map.
    */
    result doMessage(arg)
  )
  result
)

# This method will get called every time when interpreter "sees" our new assignment operator.
Map atPutAttribute := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

Builder := Object clone

Builder forward := method(
  tagName := call message name
  args := call message arguments
  attributesString := ""

  # Check if the first argument contains attributes definition.
  # If so, we need to evaluate it to get the attributes as a Map, using our new assignment operator.
  # Then we can adjust how they will be displayed.
  if (args size > 0 and args at(0) name == "curlyBrackets",
    attributesString = " " .. doMessage(args at(0)) map(key, value, "#{key}=\"#{value}\"" interpolate) join(" ")

    # We remove attributes definition so they won't be processed for a second time.
    args removeFirst
  )

  write("<#{tagName}" interpolate)
  write(attributesString)
  writeln(">")

  args foreach(arg,
    content := self doMessage(arg)
    if (content proto == Sequence, content println)
  )

  writeln("</#{tagName}>" interpolate)
)

/* We aren't able to generate our XML directly in this file.
It seems that there are some issues in the way how operator works in currently interpreted file,
as described here: https://stackoverflow.com/q/10144862

The solution is to evaluate our XML definition as a string.
I've tried to use Futures/Actors, unfortunately with no progress.
*/
source := File with("attributes.txt") openForReading
doString(source contents)
source close