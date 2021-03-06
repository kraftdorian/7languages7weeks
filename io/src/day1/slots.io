Grid := Object clone

Algorithm := Grid clone
Algorithm description := "Sequence of computer implementable instructions"

UserAlgorithm := Algorithm clone
UserAlgorithm description := "Algorithm written by a User"

IsomorphicAlgorithm := Algorithm clone
IsomorphicAlgorithm description := "Algorithm which evolved on the Grid"

quorra := IsomorphicAlgorithm clone
quorra description = "The last ISO"
quorra driveLightRunner := method("Vroom!" println)

quorra driveLightRunner