
(cl:in-package :asdf)

(defsystem "robot_open_quadruped-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "JointAngles" :depends-on ("_package_JointAngles"))
    (:file "_package_JointAngles" :depends-on ("_package"))
    (:file "TransformedAngles" :depends-on ("_package_TransformedAngles"))
    (:file "_package_TransformedAngles" :depends-on ("_package"))
  ))