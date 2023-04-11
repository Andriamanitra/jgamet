run: build
    ./build/jgamet

build:
    jpm --local build

test:
    jpm --local test

clean:
    jpm --local clean

repl:
    jpm --local repl

install-deps:
    jpm --local deps

# in case you have no idea what you're doing
wtf:
    xdg-open https://janet-lang.org/docs/index.html
    xdg-open https://janetdocs.com
    xdg-open https://github.com/janet-lang/jaylib
    xdg-open https://www.raylib.com/cheatsheet/cheatsheet
