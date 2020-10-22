;; Auto-generated. Do not edit!


(when (boundp 'robot_open_quadruped::JointAngles)
  (if (not (find-package "ROBOT_OPEN_QUADRUPED"))
    (make-package "ROBOT_OPEN_QUADRUPED"))
  (shadow 'JointAngles (find-package "ROBOT_OPEN_QUADRUPED")))
(unless (find-package "ROBOT_OPEN_QUADRUPED::JOINTANGLES")
  (make-package "ROBOT_OPEN_QUADRUPED::JOINTANGLES"))

(in-package "ROS")
;;//! \htmlinclude JointAngles.msg.html


(defclass robot_open_quadruped::JointAngles
  :super ros::object
  :slots (_lf _rf _lr _rr ))

(defmethod robot_open_quadruped::JointAngles
  (:init
   (&key
    ((:lf __lf) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:rf __rf) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:lr __lr) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:rr __rr) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _lf __lf)
   (setq _rf __rf)
   (setq _lr __lr)
   (setq _rr __rr)
   self)
  (:lf
   (&optional __lf)
   (if __lf (setq _lf __lf)) _lf)
  (:rf
   (&optional __rf)
   (if __rf (setq _rf __rf)) _rf)
  (:lr
   (&optional __lr)
   (if __lr (setq _lr __lr)) _lr)
  (:rr
   (&optional __rr)
   (if __rr (setq _rr __rr)) _rr)
  (:serialization-length
   ()
   (+
    ;; float32[] _lf
    (* 4    (length _lf)) 4
    ;; float32[] _rf
    (* 4    (length _rf)) 4
    ;; float32[] _lr
    (* 4    (length _lr)) 4
    ;; float32[] _rr
    (* 4    (length _rr)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _lf
     (write-long (length _lf) s)
     (dotimes (i (length _lf))
       (sys::poke (elt _lf i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _rf
     (write-long (length _rf) s)
     (dotimes (i (length _rf))
       (sys::poke (elt _rf i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _lr
     (write-long (length _lr) s)
     (dotimes (i (length _lr))
       (sys::poke (elt _lr i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _rr
     (write-long (length _rr) s)
     (dotimes (i (length _rr))
       (sys::poke (elt _rr i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _lf
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lf (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _lf i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _rf
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rf (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _rf i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _lr
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lr (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _lr i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _rr
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rr (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _rr i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get robot_open_quadruped::JointAngles :md5sum-) "c6a98af594d0c3ce471d3f5de59a13a9")
(setf (get robot_open_quadruped::JointAngles :datatype-) "robot_open_quadruped/JointAngles")
(setf (get robot_open_quadruped::JointAngles :definition-)
      "float32[] lf
float32[] rf
float32[] lr
float32[] rr

")



(provide :robot_open_quadruped/JointAngles "c6a98af594d0c3ce471d3f5de59a13a9")


