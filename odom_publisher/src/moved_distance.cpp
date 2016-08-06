#include <ros/ros.h>
#include <std_msgs/Float64.h>
#include <tf/transform_listener.h>



int main(int argc, char** argv)
{
  //init the ROS node
  ros::init(argc, argv, "odom_distance_publisher");
  ros::NodeHandle nh;

    ros::Publisher odom_pub = nh.advertise<std_msgs::Float64>("odom_moved_distance", 1);
  tf::TransformListener listener_;
  //wait for the listener to get the first message
    listener_.waitForTransform("base_footprint", "odom_combined", 
                               ros::Time(0), ros::Duration(1.0));
    
    //we will record transforms here
    tf::StampedTransform start_transform;
    tf::StampedTransform current_transform;

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
      //see how far we've traveled
      tf::Transform relative_transform = 
        start_transform.inverse() * current_transform;
      double dist_moved = relative_transform.getOrigin().length();

        std_msgs::Float64 dist;
        dist.data = dist_moved;
        odom_pub.publish(dist);
        rate.sleep();
    }
}
