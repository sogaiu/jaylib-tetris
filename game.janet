# a port of:
#
# https://github.com/raysan5/raylib-games/blob/master/classics/src/tetris.c

###########################################################################

(import jaylib :as j)
(import ./params :as p)
(import ./state :as s)
(import ./draw :as d)
(import ./update :as u)

(defn update-draw-frame!
  [state]
  (-> state
      u/update-game!
      d/draw-game))

(defn main
  [& args]
  #
  (def state @{})
  #
  (s/init! state)
  #
  (j/set-config-flags :msaa-4x-hint)
  (j/init-window p/screen-width p/screen-height "Tetris")
  (j/set-target-fps 60)
  #
  (j/set-exit-key 0)
  #
  (while (not (j/window-should-close))
    (update-draw-frame! state))
  #
  (j/close-window))

