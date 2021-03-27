attemptsMax := 10
attemptCurrent := 0
numberDrawnMin := 1
numberDrawnMax := 100
numberDrawn := Random value(numberDrawnMin, numberDrawnMax) floor
numberUserInput := nil

while(attemptCurrent < attemptsMax and numberUserInput != numberDrawn,
  numberUserInput = File standardInput readLine asNumber floor
  (attemptCurrent == 0) ifTrue (
    if (numberUserInput < numberDrawn,
      "Number you provided is too small" println,
      "Number you provided is too big" println
    )
  )
  attemptCurrent = attemptCurrent + 1
)

if (numberUserInput == numberDrawn,
  "Congratulations, you have guessed the drawn number! It was #{numberDrawn}" interpolate println,
  "Unfortunately you haven't guessed the number. It was #{numberDrawn}" interpolate println
)