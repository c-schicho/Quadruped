; Auto-generated. Do not edit!


(cl:in-package robot_open_quadruped-msg)


;//! \htmlinclude TransformedAngles.msg.html

(cl:defclass <TransformedAngles> (roslisp-msg-protocol:ros-message)
  ((angles
    :reader angles
    :initarg :angles
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass TransformedAngles (<TransformedAngles>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TransformedAngles>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TransformedAngles)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_open_quadruped-msg:<TransformedAngles> is deprecated: use robot_open_quadruped-msg:TransformedAngles instead.")))

(cl:ensure-generic-function 'angles-val :lambda-list '(m))
(cl:defmethod angles-val ((m <TransformedAngles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_open_quadruped-msg:angles-val is deprecated.  Use robot_open_quadruped-msg:angles instead.")
  (angles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TransformedAngles>) ostream)
  "Serializes a message object of type '<TransformedAngles>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'angles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'angles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TransformedAngles>) istream)
  "Deserializes a message object of type '<TransformedAngles>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'angles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'angles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TransformedAngles>)))
  "Returns string type for a message object of type '<TransformedAngles>"
  "robot_open_quadruped/TransformedAngles")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TransformedAngles)))
  "Returns string type for a message object of type 'TransformedAngles"
  "robot_open_quadruped/TransformedAngles")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TransformedAngles>)))
  "Returns md5sum for a message object of type '<TransformedAngles>"
  "900e68ab26db7b254c95cc40be37fb5c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TransformedAngles)))
  "Returns md5sum for a message object of type 'TransformedAngles"
  "900e68ab26db7b254c95cc40be37fb5c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TransformedAngles>)))
  "Returns full string definition for message of type '<TransformedAngles>"
  (cl:format cl:nil "float32[] angles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TransformedAngles)))
  "Returns full string definition for message of type 'TransformedAngles"
  (cl:format cl:nil "float32[] angles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TransformedAngles>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'angles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TransformedAngles>))
  "Converts a ROS message object to a list"
  (cl:list 'TransformedAngles
    (cl:cons ':angles (angles msg))
))
