# Shows how to deal with newlines when displaying text.

require "termbox"

Termbox.tb_init # Initialize the Termbox library and setup the terminal
Termbox.tb_clear # Clear the buffer

# Get the current terminal dimensions
width = Termbox.tb_width
height = Termbox.tb_height

# Set the buffer by changing some cells
x = width / 2
y = height / 2

# Set the starting x coordinate
start_x = x

# Set the text
text = "Hello World!\nPress any key to exit."

# Enumerate lines
text.lines.each do |line|
  # Subtract half of the line's width from the X coordinate
  x -= line.length / 2

  # Change each cell in relation to the line
  line.chars.each.with_index do |character, x_offset|
    # Change the cell in the buffer using the character's ASCII ordinal
    Termbox.tb_change_cell(x + x_offset, y, character.ord, Termbox::TB_DEFAULT, Termbox::TB_DEFAULT)
  end
  
  # Reset x coordinate to the starting location
  x = start_x
  
  # Advance y coordinate
  y += 1
end

Termbox.tb_present # Sync the buffer with the terminal

# Wait for any user input
event = Termbox::Event.new
Termbox.tb_poll_event(event)

Termbox.tb_shutdown # Shutdown the Termbox library and reset the terminal
