require 'ffi'

module Termbox
  
  # The tb_event struct as returned by libtermbox
  class Event < FFI::Struct
    layout :type, :uint8,
           :mod,  :uint8,
           :key,  :uint16,
           :ch,   :uint32,
           :w,    :int32,
           :h,    :int32
  end
  
end
