struct Cursor:
  
  var x: Int
  var y: Int

  fn __init__(inout self):
    '''Initializes struct and moves cursor to home position.'''
    self.x = 0
    self.y = 0
    self.home()
 
  fn home(inout self):
    '''Moves cursor to home position (0,0).'''
    pnn(esc + "[H")
    self.x = 0
    self.y = 0

  fn goto(inout self, line: Int, col: Int):
    '''
    Moves cursor to line `line`, column `column` using H-sequence.
    Same as goto_f.
    '''
    pnn(esc + "[" + str(line) + ";" + str(col) + "H")
    self.x = col
    self.y = line

  fn goto_f(inout self, line: Int, col: Int):
    '''
    Moves cursor to line `line`, column `column` using f-sequence.
    Same as goto.
    '''
    pnn(esc + "[" + str(line) + ";" + str(col) + "f")
    self.x = col
    self.y = line

  fn up(inout self, lines: Int):
    '''
    Moves cursor up `lines` lines.

    NOTE: This decreases `self.y` which may seem counterintuitive at first,
    but makes sense when you consider that (0,0) in a terminals coordinate system,
    is in the upper left corner.
    '''
    pnn(esc + "[" + str(lines) + "A")
    self.y -= lines

  fn down(inout self, lines: Int):
    '''
    Moves cursor down `lines` lines.

    NOTE: This increases `self.y` which may seem counterintuitive at first,
    but makes sense when you consider that (0,0) in a terminals coordinate system,
    is in the upper left corner.
    '''
    pnn(esc + "[" + str(lines) + "B")
    self.y += lines

  fn right(inout self, cols: Int):
    '''Moves cursor right `cols` columns.'''
    pnn(esc + "[" + str(cols) + "C")
    self.x += cols

  fn left(inout self, cols: Int):
    '''Moves cursor left `cols` columns.'''
    pnn(esc + "[" + str(cols) + "D")
    self.x -= cols

  fn begin_down(inout self, lines: Int):
    '''
    Moves cursor to beginning of nextline, `lines` lines down.

    NOTE: This increases `self.y` which may seem counterintuitive at first,
    but makes sense when you consider that (0,0) in a terminals coordinate system,
    is in the upper left corner.
    '''
    pnn(esc + "[" + str(lines) + "E")
    self.y += lines

  fn begin_up(inout self, lines: Int):
    '''
    Moves cursor to beginning of nextline, `lines` lines up.

    NOTE: This decreases `self.y` which may seem counterintuitive at first,
    but makes sense when you consider that (0,0) in a terminals coordinate system,
    is in the upper left corner.
    '''
    pnn(esc + "[" + str(lines) + "F")
    self.y -= lines

  fn column(inout self, col: Int):
    '''
    Moves cursor to column `col`.
    '''
    pnn(esc + "[" + str(col) + "G")
    self.x = col

  # FIXME This is not functional
  fn get_cursor_pos(inout self):
    '''
    Gets the cursor position.
    
    NOTE: this is not functional and only prints the corresponding escape sequence.
    '''
    pnn(esc + "[6n")

  fn move_up(inout self):
    '''
    Moves up one line, scrolling if needed.
    '''
    pnn(esc + "M")
    self.y -= 1

  fn save_pos(inout self):
    '''
    Saves cursor position (DEC).

    NOTE: this is the recommended method, 
    but `save_pos_sco` may also work on some terminal emulators.
    '''
    pnn(esc + "7")

  fn restore_pos(inout self):
    '''
    Restores the cursor to the last position saved using `save_pos` (DEC).

    NOTE: this is the recommended method, 
    but `restore_pos_sco` may also work on some terminal emulators.
    '''
    pnn(esc + "8")

  fn save_pos_sco(inout self):
    '''
    Saves cursor position (SCO).

    NOTE: this is not the recommended method,
    see `save_pos` for more information.
    '''
    pnn(esc + "[s")

  fn restore_pos_sco(inout self):
    '''
    Restore the cursor to the last position saved using `save_pos_sco` (SCO).

    NOTE: this is not the recommended method, 
    see `restore_pos` for more information.
    '''
    pnn(esc + "[u")

alias cursor = Cursor()
