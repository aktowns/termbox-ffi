# Termbox::FFI

A [foreign function interface][ffi] to the [termbox][termbox] library.

## Installation

### Bundler: `gem "termbox-ffi"`

### RubyGems: `gem install termbox-ffi`

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/termbox-ffi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

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

[ffi]: https://github.com/ffi/ffi
[termbox]: https://github.com/nsf/termbox