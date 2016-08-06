
## Errors when launching

When trying to run either node, it sometimes throws an error and doesn't start the node. The possible error messages are:

```
terminate called after throwing an instance of 'tf2::LookupException'
  what():  "base_footprint" passed to lookupTransform argument target_frame does not exist. 
Aborted (core dumped)
```

OR

```
terminate called after throwing an instance of 'tf2::LookupException'
  what():  "odom_combined" passed to lookupTransform argument source_frame does not exist. 
Aborted (core dumped)
``` 

One way to avoid this is to just keep trying to launch until it recognizes that the source frames do exist.
