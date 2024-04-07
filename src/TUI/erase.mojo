fn erase_to_scr_end():
  '''
  Erase from cursor until end of screen.
  '''
  pnn(esc + "[J")

fn erase_to_scr_start():
  '''
  Erase from cursor to beginning of screen.
  '''
  pnn(esc + "[1J")

fn clear():
  '''
  Erase entire screen.
  '''
  pnn(esc + "[2J")

fn erase_saved():
  '''
  Erase saved lines.
  '''
  pnn(esc + "[3J")

fn erase_to_ln_end():
  '''
  Erase from cursor to end of line.
  '''
  pnn(esc + "[K")

fn erase_to_ln_start():
  '''
  Erase start of line to the cursor.
  '''
  pnn(esc + "[1K")

fn erase_ln():
  '''
  Erase the entire line.
  '''
  pnn(esc + "[2K" + cr)

