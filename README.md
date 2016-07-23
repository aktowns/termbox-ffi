# Termbox::FFI

A [foreign function interface][ffi] to the [termbox][termbox] library.

## Installation

### Bundler: `gem "termbox-ffi"`

### RubyGems: `gem install termbox-ffi`

## Usage

All constants and functions from the Termbox header file are mapped to the `Termbox` Ruby module.  
Additionally, the `tb_cell` and `tb_event` structures are mapped to the `Termbox::Cell` and `Termbox::Event` classes, 
respectively.

See the `examples` directory for usage.

## Contributing

1. Fork it ( https://github.com/aktowns/termbox-ffi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

### Cloning

The Termbox C library is included in this project as a submodule.  
In order to properly build the gem, the `ext/termbox` must be pulled.

To clone both this project and the submodule, use the following:

```sh
$ git clone --recursive git@github.com:aktowns/termbox-ffi.git
```

To pull the module if already cloned without the `--recursive` option, use:

```sh
git submodule update --init --recursive
```

### Building

Once the project is properly cloned, the Termbox library must be built with `bundle exec rake compile`.

To run examples, use `bundle exec ruby ./examples/FILENAME`

[ffi]: https://github.com/ffi/ffi
[termbox]: https://github.com/nsf/termbox
