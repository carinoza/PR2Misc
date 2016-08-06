# Speech Recognition

The speech\_recognition package is a [ROSJava](http://wiki.ros.org/rosjava) package , which contains the speech\_recognition\_node project (a ROSJava project as well). The speech\_recognition\_node project contains itself a ROS Node "Talker" which uses the [CMU Sphinx speech recognition library](http://cmusphinx.sourceforge.net/) to listen to spoken messages and then sends them through a ROS Topic.


## How to use

In the project directory, there is a executable file with which the node can be run. The command to run it is:

```
cd speech_recognition/speech\_recognition\_node
./build/install/speech\_recognition\_node/bin/speech\_recognition\_node com.github.rosjava.speech_recognition.speech_recognition_node.Talker
```

The node will start listening to spoken words and then send the most probable word(s) listened (hypothesis) to the topic __sphinx_speech_recon__.  

## How to build

To build the project, ROSJava must be installed.

1. Install ROSJava by following the steps in their [site](http://wiki.ros.org/rosjava/Tutorials/hydro/Installation).
2. Go to catkin_workspace where the package and project are located
3. Run catkin_build as usual


## More information

To see more information and more detail on how to create a node with speech recognition, check the [RyCh documentation](https://rych.dcc.uchile.cl/doku.php?id=documentacion:pr2:speech-recon)
