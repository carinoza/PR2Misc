# MoveIt! 

This folder contains nodes that run using MoveIt! 

1. **topic2moveit.py**

   This node listens to the topic __t2moveit__ for commands (std\_msgs/String) and then sends them to the __MoveGroupCommandInterpreter__ who actually handles the messages. This node is a simil to the MoveIt! program _moveit\_commander\_cmdline.py_ with the difference being that topic2moveit.py opens a topic whilst moveit\_commander\_cmdline.py receives messages directly input in the command line. 

   To use it on a PR2, first run `roslaunch pr2_moveit_config move_group.launch`. The program expects a __pos.cfg__ in the directory where it was launched, this contains the predefined positions.

   More information on how to use it can be found in the [RyCh documentation](https://rych.dcc.uchile.cl/doku.php?id=documentacion:pr2:moveit#usar_interprete_python). It works just as the interpreter but reading from its topic.


2. **pos.cfg**

   This file contains predefined positions to be used with MoveIt! and the topic2moveit node. To use it, there has to be a call to `load pos.cfg`. If using with topic2moveit, this one has to be executed in the same folder where pos.cfg is stored (in order for the load command to found the file).

	More information on how to use it can be found in the [third example](https://rych.dcc.uchile.cl/doku.php?id=documentacion:pr2:moveit#demos) of the RyCh documentation.
