# An example of a basic usage of the Termbox library.
# 
# Will simply display "Hello World!", centered in the terminal and will wait
# for any user input before shutting down.

require "termbox"

# Initialize the Termbox library and setup the terminal
Termbox.tb_init

# Clear the buffer
Termbox.tb_clear

# Get the current terminal dimensions
width = Termbox.tb_width
height = Termbox.tb_height

# Set the buffer by changing some cells
x = width / 2
y = height / 2

# Set the text
text = "Hello World!"

# Subtract half of the text's width from the X coordinate
x -= text.length / 2

# Change each cell in relation to the text
text.chars.each.with_index do |character, x_offset|
  # Change the cell in the buffer using the character's ASCII ordinal
  Termbox.tb_change_cell(x + x_offset, y, character.ord, Termbox::TB_DEFAULT, Termbox::TB_DEFAULT)
end

# Sync the buffer with the terminal
Termbox.tb_present

# Wait for any user input
event = Termbox::Event.new
Termbox.tb_poll_event(event)

# Shutdown the Termbox library and reset the terminal
Termbox.tb_shutdown
