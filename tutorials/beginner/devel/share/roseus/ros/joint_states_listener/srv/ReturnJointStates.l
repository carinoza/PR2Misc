;; Auto-generated. Do not edit!


(when (boundp 'joint_states_listener::ReturnJointStates)
  (if (not (find-package "JOINT_STATES_LISTENER"))
    (make-package "JOINT_STATES_LISTENER"))
  (shadow 'ReturnJointStates (find-package "JOINT_STATES_LISTENER")))
(unless (find-package "JOINT_STATES_LISTENER::RETURNJOINTSTATES")
  (make-package "JOINT_STATES_LISTENER::RETURNJOINTSTATES"))
(unless (find-package "JOINT_STATES_LISTENER::RETURNJOINTSTATESREQUEST")
  (make-package "JOINT_STATES_LISTENER::RETURNJOINTSTATESREQUEST"))
(unless (find-package "JOINT_STATES_LISTENER::RETURNJOINTSTATESRESPONSE")
  (make-package "JOINT_STATES_LISTENER::RETURNJOINTSTATESRESPONSE"))

(in-package "ROS")

(defclass joint_states_listener::ReturnJointStatesRequest
  :super ros::object
  :slots (_name ))

(defmethod joint_states_listener::ReturnJointStatesRequest
  (:init
   (&key
    ((:name __name) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _name __name)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string[] _name
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _name)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _name
     (write-long (length _name) s)
     (dolist (elem _name)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _name
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _name (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _name i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass joint_states_listener::ReturnJointStatesResponse
  :super ros::object
  :slots (_found _position _velocity _effort ))

(defmethod joint_states_listener::ReturnJointStatesResponse
  (:init
   (&key
    ((:found __found) (make-array 0 :initial-element 0 :element-type :integer))
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:velocity __velocity) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:effort __effort) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _found __found)
   (setq _position __position)
   (setq _velocity __velocity)
   (setq _effort __effort)
   self)
  (:found
   (&optional __found)
   (if __found (setq _found __found)) _found)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:effort
   (&optional __effort)
   (if __effort (setq _effort __effort)) _effort)
  (:serialization-length
   ()
   (+
    ;; uint32[] _found
    (* 4    (length _found)) 4
    ;; float64[] _position
    (* 8    (length _position)) 4
    ;; float64[] _velocity
    (* 8    (length _velocity)) 4
    ;; float64[] _effort
    (* 8    (length _effort)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32[] _found
     (write-long (length _found) s)
     (dotimes (i (length _found))
       (write-long (elt _found i) s)
       )
     ;; float64[] _position
     (write-long (length _position) s)
     (dotimes (i (length _position))
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _velocity
     (write-long (length _velocity) s)
     (dotimes (i (length _velocity))
       (sys::poke (elt _velocity i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _effort
     (write-long (length _effort) s)
     (dotimes (i (length _effort))
       (sys::poke (elt _effort i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32[] _found
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _found (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _found i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float64[] _position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _position i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _velocity
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _velocity (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _velocity i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _effort
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _effort (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _effort i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass joint_states_listener::ReturnJointStates
  :super ros::object
  :slots ())

(setf (get joint_states_listener::ReturnJointStates :md5sum-) "ce9bd2b56c904b190a782a08482fb4e9")
(setf (get joint_states_listener::ReturnJointStates :datatype-) "joint_states_listener/ReturnJointStates")
(setf (get joint_states_listener::ReturnJointStates :request) joint_states_listener::ReturnJointStatesRequest)
(setf (get joint_states_listener::ReturnJointStates :response) joint_states_listener::ReturnJointStatesResponse)

(defmethod joint_states_listener::ReturnJointStatesRequest
  (:response () (instance joint_states_listener::ReturnJointStatesResponse :init)))

(setf (get joint_states_listener::ReturnJointStatesRequest :md5sum-) "ce9bd2b56c904b190a782a08482fb4e9")
(setf (get joint_states_listener::ReturnJointStatesRequest :datatype-) "joint_states_listener/ReturnJointStatesRequest")
(setf (get joint_states_listener::ReturnJointStatesRequest :definition-)
      "string[] name
---
uint32[] found
float64[] position
float64[] velocity
float64[] effort

")

(setf (get joint_states_listener::ReturnJointStatesResponse :md5sum-) "ce9bd2b56c904b190a782a08482fb4e9")
(setf (get joint_states_listener::ReturnJointStatesResponse :datatype-) "joint_states_listener/ReturnJointStatesResponse")
(setf (get joint_states_listener::ReturnJointStatesResponse :definition-)
      "string[] name
---
uint32[] found
float64[] position
float64[] velocity
float64[] effort

")



(provide :joint_states_listener/ReturnJointStates "ce9bd2b56c904b190a782a08482fb4e9")


