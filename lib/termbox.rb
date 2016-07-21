require 'termbox/version'
require 'termbox/event'
require 'termbox/cell'
require 'ffi'

module Termbox
  
  extend FFI::Library

  # TODO: This is a hack..
  ffi_lib Dir[File.join(File.dirname(__FILE__), "/../ext/termbox/build/src/*.{so,dylib}")].first
  
  TB_KEY_F1               = (0xFFFF - 0)
  TB_KEY_F2               = (0xFFFF - 1)
  TB_KEY_F3               = (0xFFFF - 2)
  TB_KEY_F4               = (0xFFFF - 3)
  TB_KEY_F5               = (0xFFFF - 4)
  TB_KEY_F6               = (0xFFFF - 5)
  TB_KEY_F7               = (0xFFFF - 6)
  TB_KEY_F8               = (0xFFFF - 7)
  TB_KEY_F9               = (0xFFFF - 8)
  TB_KEY_F10              = (0xFFFF - 9)
  TB_KEY_F11              = (0xFFFF - 10)
  TB_KEY_F12              = (0xFFFF - 11)
  TB_KEY_INSERT           = (0xFFFF - 12)
  TB_KEY_DELETE           = (0xFFFF - 13)
  TB_KEY_HOME             = (0xFFFF - 14)
  TB_KEY_END              = (0xFFFF - 15)
  TB_KEY_PGUP             = (0xFFFF - 16)
  TB_KEY_PGDN             = (0xFFFF - 17)
  TB_KEY_ARROW_UP         = (0xFFFF - 18)
  TB_KEY_ARROW_DOWN       = (0xFFFF - 19)
  TB_KEY_ARROW_LEFT       = (0xFFFF - 20)
  TB_KEY_ARROW_RIGHT      = (0xFFFF - 21)
  TB_KEY_MOUSE_LEFT       = (0xFFFF - 22)
  TB_KEY_MOUSE_RIGHT      = (0xFFFF - 23)
  TB_KEY_MOUSE_MIDDLE     = (0xFFFF - 24)
  TB_KEY_MOUSE_RELEASE    = (0xFFFF - 25)
  TB_KEY_MOUSE_WHEEL_UP   = (0xFFFF - 26)
  TB_KEY_MOUSE_WHEEL_DOWN = (0xFFFF - 27)
  
  TB_KEY_CTRL_TILDE       = 0x00
  TB_KEY_CTRL_2           = 0x00
  TB_KEY_CTRL_A           = 0x01
  TB_KEY_CTRL_B           = 0x02
  TB_KEY_CTRL_C           = 0x03
  TB_KEY_CTRL_D           = 0x04
  TB_KEY_CTRL_E           = 0x05
  TB_KEY_CTRL_F           = 0x06
  TB_KEY_CTRL_G           = 0x07
  TB_KEY_BACKSPACE        = 0x08
  TB_KEY_CTRL_H           = 0x08
  TB_KEY_TAB              = 0x09
  TB_KEY_CTRL_I           = 0x09
  TB_KEY_CTRL_J           = 0x0A
  TB_KEY_CTRL_K           = 0x0B
  TB_KEY_CTRL_L           = 0x0C
  TB_KEY_ENTER            = 0x0D
  TB_KEY_CTRL_M           = 0x0D
  TB_KEY_CTRL_N           = 0x0E
  TB_KEY_CTRL_O           = 0x0F
  TB_KEY_CTRL_P           = 0x10
  TB_KEY_CTRL_Q           = 0x11
  TB_KEY_CTRL_R           = 0x12
  TB_KEY_CTRL_S           = 0x13
  TB_KEY_CTRL_T           = 0x14
  TB_KEY_CTRL_U           = 0x15
  TB_KEY_CTRL_V           = 0x16
  TB_KEY_CTRL_W           = 0x17
  TB_KEY_CTRL_X           = 0x18
  TB_KEY_CTRL_Y           = 0x19
  TB_KEY_CTRL_Z           = 0x1A
  TB_KEY_ESC              = 0x1B
  TB_KEY_CTRL_LSQ_BRACKET = 0x1B
  TB_KEY_CTRL_3           = 0x1B
  TB_KEY_CTRL_4           = 0x1C
  TB_KEY_CTRL_BACKSLASH   = 0x1C
  TB_KEY_CTRL_5           = 0x1D
  TB_KEY_CTRL_RSQ_BRACKET = 0x1D
  TB_KEY_CTRL_6           = 0x1E
  TB_KEY_CTRL_7           = 0x1F
  TB_KEY_CTRL_SLASH       = 0x1F
  TB_KEY_CTRL_UNDERSCORE  = 0x1F
  TB_KEY_SPACE            = 0x20
  TB_KEY_BACKSPACE2       = 0x7F
  TB_KEY_CTRL_8           = 0x7F
  
  TB_MOD_ALT = 0x01
  
  TB_DEFAULT = 0x00
  TB_BLACK   = 0x01
  TB_RED     = 0x02
  TB_GREEN   = 0x03
  TB_YELLOW  = 0x04
  TB_BLUE    = 0x05
  TB_MAGENTA = 0x06
  TB_CYAN    = 0x07
  TB_WHITE   = 0x08
  
  TB_BOLD      = 0x0100
  TB_UNDERLINE = 0x0200
  TB_REVERSE   = 0x0400
  
  TB_EVENT_KEY    = 1
  TB_EVENT_RESIZE = 2
  TB_EVENT_MOUSE  = 3
  
  TB_EUNSUPPORTED_TERMINAL = -1
  TB_EFAILED_TO_OPEN_TTY   = -2
  TB_EPIPE_TRAP_ERROR      = -3
  
  TB_HIDE_CURSOR = -1
  
  TB_INPUT_CURRENT = 0
  TB_INPUT_ESC     = 1
  TB_INPUT_ALT     = 2
  TB_INPUT_MOUSE   = 4
  
  TB_OUTPUT_CURRENT   = 0
  TB_OUTPUT_NORMAL    = 1
  TB_OUTPUT_256       = 2
  TB_OUTPUT_216       = 3
  TB_OUTPUT_GRAYSCALE = 4
  
  TB_EOF = -1
  
  attach_function :tb_init,                 [],                                      :int
  attach_function :tb_shutdown,             [],                                      :void
  attach_function :tb_width,                [],                                      :int
  attach_function :tb_height,               [],                                      :int
  attach_function :tb_clear,                [],                                      :void
  attach_function :tb_set_clear_attributes, [:uint16, :uint16],                      :void
  attach_function :tb_present,              [],                                      :void
  attach_function :tb_set_cursor,           [:int, :int],                            :void
  attach_function :tb_put_cell,             [:int, :int, Cell],                      :void
  attach_function :tb_change_cell,          [:int, :int, :uint32, :uint16, :uint16], :void
  attach_function :tb_cell_buffer,          [],                                      Cell
  attach_function :tb_select_input_mode,    [:int],                                  :int
  attach_function :tb_select_output_mode,   [:int],                                  :int
  attach_function :tb_peek_event,           [Event, :int],                           :int
  attach_function :tb_poll_event,           [Event],                                 :int
  attach_function :tb_utf8_char_length,     [:char],                                 :int
  attach_function :tb_utf8_char_to_unicode, [:pointer, :string],                     :int
  attach_function :tb_utf8_unicode_to_char, [:string, :uint32],                      :int
  
end
