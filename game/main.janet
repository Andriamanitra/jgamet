(use jaylib)
(use ./jaylib-macros)

(defn draw-cube [{:pos pos :size size :color color}]
  (draw-cube-wires-v pos size :black)
  (draw-cube-v pos size color))

(defn game-loop []
  (def cam (camera-3d
    :target [0 0 0]
    :up [0 1 0]
    :fovy 60
    :position [7 5 7]))
  (def cubes [
    {:pos [0 0.5 0] :size [1 1 1] :color :red}
    {:pos [-2.5 2 3.5] :size [1 4 1] :color :blue}
    {:pos [0 0.25 -5] :size [4 0.5 4] :color :green}])
  (while (not (window-should-close))
    (let [[mx my] (get-mouse-position)]
      (update-camera cam)
      (do-drawing
        (clear-background [0.2 0.1 0.2])
        (draw-text (string "x=" mx ", y=" my) 10 10 20 :gray)
        (do-mode-3d cam
          (draw-grid 20 1.0)
          (each c cubes (draw-cube c)))
        (draw-poly [mx my] 7 10 200 :white)))))

(defn main [& args]
  (with-window [800 600 "game"]
    # center window on the right monitor
    (set-window-position (+ 2560 (/ (- 2560 800) 2)) (/ (- 1440 600) 2))
    (set-target-fps 144)
    (game-loop)))
