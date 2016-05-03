# Speech Recognition

The speech\_recognition package is a [ROSJava](http://wiki.ros.org/rosjava) package , which contains the speech\_recognition\_node project (a ROSJava project as well). The speech\_recognition\_node project contains itself a ROS Node "Talker" which uses the [CMU Sphinx speech recognition library](http://cmusphinx.sourceforge.net/) to listen to spoken messages and then sends them through a ROS Topic.


## How to use

In the project directory, there is a executable file with which the node can be run. The command to run it is:

```
cd path/to/speech\_recognition\_node
./build/install/speech\_recognition\_node/bin/speech\_recognition\_node com.github.rosjava.speech\_recognition.speech\_recognition\_node.Talker
```


## How to build

To build the project, ROSJava must be installed.

1. Install ROSJava by following the steps in their [site](http://wiki.ros.org/rosjava/Tutorials/hydro/Installation).
2. Go to catkin_workspace where the package and project are located
3. Run catkin_build as usual
