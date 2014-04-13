#Intro#

```MKPersistentQueue``` is a persistent, serial priority queue for scheduling opertions representing fx. events occurring in an application. 

##Features##

* All enqueued operations are persisted, so that the stream of events is consistent across application launches.
* Operations are executed in the same order they are scheduled on the queue.
* Operations can be scheduled from any thread.
* Supports any operation that is a subclass of ```NSOperation``` and conforms to ```NSCoding```
