;; Auto-generated. Do not edit!


(when (boundp 'robot_open_quadruped::TransformedAngles)
  (if (not (find-package "ROBOT_OPEN_QUADRUPED"))
    (make-package "ROBOT_OPEN_QUADRUPED"))
  (shadow 'TransformedAngles (find-package "ROBOT_OPEN_QUADRUPED")))
(unless (find-package "ROBOT_OPEN_QUADRUPED::TRANSFORMEDANGLES")
  (make-package "ROBOT_OPEN_QUADRUPED::TRANSFORMEDANGLES"))

(in-package "ROS")
;;//! \htmlinclude TransformedAngles.msg.html


(defclass robot_open_quadruped::TransformedAngles
  :super ros::object
  :slots (_angles ))

(defmethod robot_open_quadruped::TransformedAngles
  (:init
   (&key
    ((:angles __angles) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _angles __angles)
   self)
  (:angles
   (&optional __angles)
   (if __angles (setq _angles __angles)) _angles)
  (:serialization-length
   ()
   (+
    ;; float32[] _angles
    (* 4    (length _angles)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _angles
     (write-long (length _angles) s)
     (dotimes (i (length _angles))
       (sys::poke (elt _angles i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _angles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _angles (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _angles i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get robot_open_quadruped::TransformedAngles :md5sum-) "900e68ab26db7b254c95cc40be37fb5c")
(setf (get robot_open_quadruped::TransformedAngles :datatype-) "robot_open_quadruped/TransformedAngles")
(setf (get robot_open_quadruped::TransformedAngles :definition-)
      "float32[] angles

")



(provide :robot_open_quadruped/TransformedAngles "900e68ab26db7b254c95cc40be37fb5c")


