require 'ffi'

module Termbox
  
  # The tb_cell struct as returned by libtermbox
  class Cell < FFI::Struct
    layout :ch, :int,
           :fg, :uint16,
           :bg, :uint16
  end
  
end
