# How to display simple colors.
# Also includes an easier way to display text.

require "termbox"

def display_text_centered(text, x, y, foreground_color, background_color)
  start_x = x # Set the starting x coordinate

  # Enumerate lines
  text.lines.each do |line|
    x -= line.length / 2 # Subtract half of the line's width from the X coordinate

    # Change each cell in relation to the line
    line.chars.each.with_index do |character, x_offset|
      # Change the cell in the buffer using the character's ASCII ordinal
      Termbox.tb_change_cell(x + x_offset, y, character.ord, foreground_color, background_color)
    end
    
    x = start_x # Reset x coordinate to the starting location
    y += 1 # Advance y coordinate
  end
end

def display_spectrum(x, y)
  # Enumerate through a range of colors
  (0..8).each do |color|
    # Set the x offset based on the color
    x_offset = color - 5
    
    # Change the cell in the buffer
    Termbox.tb_change_cell(x + x_offset, y, 0, Termbox::TB_DEFAULT, color)
  end
end

Termbox.tb_init # Initialize the Termbox library and setup the terminal
Termbox.tb_clear # Clear the buffer

# Get the current terminal dimensions
width = Termbox.tb_width
height = Termbox.tb_height

# Get center
center_x = width / 2
center_y = height / 2

# Display text, offset from the center y coordinate by 3 lines
display_text_centered("Hello World!\nPress any key to exit.", center_x, center_y - 3, Termbox::TB_WHITE, Termbox::TB_BLACK)

# Display ANSI spectrum
display_spectrum(center_x, center_y)

Termbox.tb_present # Sync the buffer with the terminal

# Wait for any user input
event = Termbox::Event.new
Termbox.tb_poll_event(event)

Termbox.tb_shutdown # Shutdown the Termbox library and reset the terminal
