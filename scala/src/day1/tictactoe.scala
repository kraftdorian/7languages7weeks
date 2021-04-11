import scala.io.StdIn.readLine

object FieldStates extends Enumeration {
  type FieldState = Value
  val Empty, O, X = Value
}

object Players extends Enumeration {
  type Player = Value
  val O, X = Value
}

object GameCLI {
  def printBoard(board: Board): Unit = {
    board.fields.grouped(board.size).foreach(row => {
      row.foreach(col => {
        print(col match {
          case FieldStates.Empty => '-'
          case FieldStates.X => 'X'
          case FieldStates.O => 'O'
        })
      })
      println()
    })
  }

  def printPlayerMessage(player: Players.Player, message: String): Unit = {
    println(s"Player $player: $message")
  }

  def readField(player: Players.Player): (Int, Int) = {
    printPlayerMessage(player, "please specify the field in X,Y format")
    val fieldDefinition: String = readLine()
    val fieldCoords: Array[Int] = fieldDefinition.trim().split(",").map(c => c.toInt)
    (fieldCoords(0), fieldCoords(1))
  }
}

object GameState {
  def isHorizontalState(fieldState: FieldStates.FieldState, board: Board, index: Int = 0, accumulator: Boolean = false): Boolean = {
    if (index >= board.realSize || accumulator) {
      return accumulator
    }
    val indices = (index until index + board.size)
    val accumulator1 = indices.map(i => board.fields(i)).count(f => f == fieldState) == board.size
    isHorizontalState(fieldState, board, index + board.size, accumulator1)
  }

  def isVerticalState(fieldState: FieldStates.FieldState, board: Board, index: Int = 0, accumulator: Boolean = false): Boolean = {
    if (index >= board.size || accumulator) {
      return accumulator
    }
    val indices = (index until index + board.realSize by board.size)
    val accumulator1 = indices.map(i => board.fields(i)).count(f => f == fieldState) == board.size
    isVerticalState(fieldState, board, index + 1, accumulator1)
  }

  def isDiagonalState(fieldState: FieldStates.FieldState, board: Board): Boolean = {
    val verticalIndices = 0 until board.realSize by board.size
    val fieldsNWSE: List[FieldStates.FieldState] = verticalIndices.toList.zipWithIndex.map(i => board.fields(i._1 + i._2))
    val fieldsNESW: List[FieldStates.FieldState] = verticalIndices.toList.zipWithIndex.map(i => board.fields(i._1 + ((board.size - 1) - i._2)))
    fieldsNWSE.count(f => f == fieldState) == board.size || fieldsNESW.count(f => f == fieldState) == board.size
  }

  def isAnyWinningState(fieldState: FieldStates.FieldState, board: Board): Boolean = {
    isVerticalState(fieldState, board) || isHorizontalState(fieldState, board) || isDiagonalState(fieldState, board)
  }

  def isNoEmptyState(board: Board): Boolean = {
    board.fields.filter(f => f == FieldStates.Empty).length == 0
  }
}

def getPlayerFieldState(player: Players.Player): FieldStates.FieldState = {
  player match {
    case Players.O => FieldStates.O
    case Players.X => FieldStates.X
  }
}

class Board(private val _size: Int) {
  private val _fields: Array[FieldStates.FieldState] = Array.fill[FieldStates.FieldState](realSize) { FieldStates.Empty }

  private def getFieldBoardRealIndex(x: Int, y: Int): Int = (_size * y) + x

  def size: Int = _size
  def fields: Array[FieldStates.FieldState] = _fields
  def realSize: Int = scala.math.pow(size, 2).toInt

  def getField(x: Int, y: Int): FieldStates.FieldState = {
    _fields(getFieldBoardRealIndex(x, y))
  }

  def setField(x: Int, y: Int, state: FieldStates.FieldState): (FieldStates.FieldState, Int, Int) = {
    val fieldBoardIndex: Int = getFieldBoardRealIndex(x, y)
    if (_fields(fieldBoardIndex) == FieldStates.Empty) {
      _fields(fieldBoardIndex) = state
    }
    (_fields(fieldBoardIndex), x, y)
  }
}

val board: Board = new Board(3)
var isGamePending: Boolean = true
var currentPlayer: Players.Player = Players.O

while (isGamePending) {
  GameCLI.printBoard(board)

  val (fieldX, fieldY): (Int, Int) = GameCLI.readField(currentPlayer)
  val playerFieldState: FieldStates.FieldState = getPlayerFieldState(currentPlayer)
  board.setField(fieldX, fieldY, playerFieldState)

  if (GameState.isAnyWinningState(playerFieldState, board)) {
    GameCLI.printPlayerMessage(currentPlayer, "congratulations, you won!")
    isGamePending = false
  } else if (GameState.isNoEmptyState(board)) {
    GameCLI.printPlayerMessage(currentPlayer, "game resulted in a draw")
    isGamePending = false
  } else {
    currentPlayer = if (currentPlayer == Players.O) Players.X else Players.O
  }

  println()
}