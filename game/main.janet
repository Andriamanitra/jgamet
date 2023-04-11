(use jaylib)

(defmacro with-window [[width height window-title] & body]
  ~(do
    (init-window ,width ,height ,window-title)
    ,;body
    (close-window)))

(defmacro do-drawing [& body]
  ~(do (begin-drawing) ,;body (end-drawing)))

(defn game-loop []
  (while (not (window-should-close))
    (do-drawing
      (clear-background [0.2 0.1 0.2])
      (let [[x y] (get-mouse-position)]
        (draw-poly [x y] 7 50 0 :red)
        (draw-text (string "x=" x ", y=" y) 10 10 20 :gray)))))

(defn main [& args]
  (with-window [800 600 "game"]
    (set-target-fps 60)
    (game-loop)))
