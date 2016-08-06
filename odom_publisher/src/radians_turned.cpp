#include <ros/ros.h>
#include <std_msgs/Float64.h>
#include <tf/transform_listener.h>



int main(int argc, char** argv)
{
  //init the ROS node
  ros::init(argc, argv, "odom_radians_publisher");
  ros::NodeHandle nh;

    ros::Publisher angle_turned_pub = nh.advertise<std_msgs::Float64>("odom_radians_turned", 1);
  tf::TransformListener listener_;
  //wait for the listener to get the first message
    listener_.waitForTransform("base_footprint", "odom_combined", 
                               ros::Time(0), ros::Duration(1.0));
    
    //we will record transforms here
    tf::StampedTransform start_transform;
    tf::StampedTransform current_transform;
    tf::Vector3 desired_turn_axis(0,0,1);

    //record the starting transform from the odometry to the base frame
    listener_.lookupTransform("base_footprint", "odom_combined", 
                              ros::Time(0), start_transform);

    ros::Rate rate(10.0);

    while (nh.ok()){
         try
         {
            listener_.lookupTransform("base_footprint", "odom_combined", 
                                  ros::Time(0), current_transform);
         }
         catch (tf::TransformException ex)
         {
            ROS_ERROR("%s",ex.what());
            break;
         }

      tf::Transform relative_transform = 
        start_transform.inverse() * current_transform;
      tf::Vector3 actual_turn_axis = 
        relative_transform.getRotation().getAxis();
      double angle_turned = relative_transform.getRotation().getAngle();

      if ( fabs(angle_turned) < 1.0e-2) continue;

      if ( actual_turn_axis.dot( desired_turn_axis ) < 0 ) 
        angle_turned = 2 * M_PI - angle_turned;

        std_msgs::Float64 angle;
        angle.data = angle_turned;
        angle_turned_pub.publish(angle);

        rate.sleep();
    }
}
