# How to display 256 colors.

require "termbox"

def display_text(text, x, y, foreground_color, background_color)
  # Enumerate through the text
  text.chars.each.with_index do |character, x_offset|
    # Change the cell in the buffer using the character's ASCII ordinal
    Termbox.tb_change_cell(x + x_offset, y, character.ord, foreground_color, background_color)
  end
end

def display_spectrum(range, y_offset, columns)
  # Enumerate through a range of colors
  range.each.with_index do |color, index|
    # Set the text to the formatted color code
    text = " %03d " % color
    
    # Set the coordinates
    x = (index % columns) * text.length
    y = (index / columns) + y_offset
    
    # Display the text
    display_text(text, x, y, Termbox::TB_DEFAULT, color)
  end
end

def display_ansi_spectrum
  display_spectrum(1..16, 2, 8)
end

def display_240_spectrum
  display_spectrum(16..255, 5, 6)
end

Termbox.tb_init # Initialize the Termbox library and setup the terminal
Termbox.tb_clear # Clear the buffer

# Set output mode to enable 256 colors
Termbox.tb_select_output_mode(Termbox::TB_OUTPUT_256)

# Get the current terminal dimensions
width = Termbox.tb_width

# Display default color (0)
display_text(" Default: 000 ", 0, 0, Termbox::TB_DEFAULT, Termbox::TB_DEFAULT)

# Display ANSI 1-16 color spectrum
display_ansi_spectrum

# Display 16-255 color spectrum
display_240_spectrum

Termbox.tb_present # Sync the buffer with the terminal

# Wait for any user input
event = Termbox::Event.new
Termbox.tb_poll_event(event)

Termbox.tb_shutdown # Shutdown the Termbox library and reset the terminal
