(declare-project
  :name "game"
  :description ```simple game using jaylib ```
  :version "0.0.0"
  :dependencies ["https://github.com/janet-lang/jaylib"
                 "https://github.com/janet-lang/spork"])

(declare-executable
  :name "jgamet"
  :entry "game/main.janet")
