
'''
Mojo library providing apis and functions for writing TUIs.
'''
from .cursor import cursor

alias bel = chr(7)
"""
Triggers a bell sound (this may also be a visual signal depending on terminal settings).
"""

alias bs = chr(8)
"""
Backspace.
"""

alias ht = chr(9)
"""
Horizontal tab (the number of spaces shown depends on terminal settings).
"""

alias lf = chr(10)
"""
Linefeed (newline).
"""

alias vt = chr(11)
"""
Vertical tab.
"""

alias ff = chr(12)
"""
Formfeed (same as New page `np`).
"""

alias np = chr(12)
"""
New page (same as Formfeed `ff`).
"""

alias cr = chr(13)
"""
Carriage return.
"""

alias esc = chr(27)
"""
Escape character.
"""

alias DEL = chr(127)
"""
Delete character.
"""

fn pnn(str: String):
  print(str, end='')

