# Save default division operator so we won't end up with an infinite loop later on.
defaultDivisionOperator := Number getSlot("/")

Number / := method(
  # Operator "/" is a message which is being sent to a target, in this case it is a counter.
  counter := call target

  # Denominator is passed as a first argument of the message.
  denominator := call evalArgAt(0)

  if (denominator == 0,
    0,
    counter defaultDivisionOperator(denominator)
  )
)

# Modified operator behavior
(1 / 0) println
(5 / 2) println