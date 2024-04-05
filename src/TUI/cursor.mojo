struct Cursor:
  
  var x: Int
  var y: Int

  fn __init__(inout self):
    '''Initializes struct and moves cursor to home position.'''
    self.x = 0
    self.y = 0
    self.home()
 
  fn home(inout self):
    pnn(esc + "[H")

alias cursor = Cursor()
