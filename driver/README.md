# Driver

A collection of packages and things to drive a robot around.


1. Drive base package

   It contains a node which is a slight modified version of the [PR2 odometry tutorial node](http://wiki.ros.org/pr2_controllers/Tutorials/Using%20the%20base%20controller%20with%20odometry%20and%20transform%20information) which listens for messages (__std_msgs/Float64__) in the topic __cmd_distance__ which represent distance (in meters) the robot has to move forward. The node starts publishing to the __cmd_vel__ topic and continues to do so until the distance is reached.

   The topic cmd\_vel has to be specified on launch (e.g. `rosrun base_drive drive_base cmd_vel:=base_controller/command`).

   Example of use (command the robot to move forward 1 meter):
     ```       
      rosrun base_drive drive_base cmd_vel:=base_controller/command
    
      rostopic pub /cmd_distance std\_msgs/Float64 "data: 1.0"
     ```

    
