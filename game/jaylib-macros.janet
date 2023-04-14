(use jaylib)

(defmacro with-window [[width height window-title] & body]
  ~(do
    (,init-window ,width ,height ,window-title)
    ,;body
    (,close-window)))

(defmacro do-drawing [& body]
  ~(do
    (,begin-drawing)
    ,;body
    (,end-drawing)))

(defmacro do-texture [texture & body]
  ~(do
    (,begin-texture-mode ,texture)
    ,;body
    (,end-texture-mode)))

(defmacro do-mode-3d [camera & body]
  ~(do
    (,begin-mode-3d ,camera)
    ,;body
    (,end-mode-3d)))
