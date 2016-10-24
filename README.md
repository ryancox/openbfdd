# openbfdd

Source: https://github.com/dyninc/OpenBFDD

### OpenBFDD Docker Build for BFD Beacon Agent


### Usage

```
$ make start
docker-compose up
Starting openbfdd_a_1
Starting openbfdd_b_1
Attaching to openbfdd_a_1, openbfdd_b_1
a_1  | bfdd-beacon: [1]: Started 1
a_1  | bfdd-beacon: [1]: Listening for commands on 127.0.0.1:957
a_1  | bfdd-beacon: [1]: Listening for commands on 127.0.0.1:958
a_1  | bfdd-beacon: [1]: Listening for BFD connections on 0.0.0.0:3784
a_1  | bfdd-beacon: [1]: Listening for BFD connections on [::]:3784
b_1  | bfdd-beacon: [1]: Started 1
b_1  | bfdd-beacon: [1]: Listening for commands on 127.0.0.1:957
b_1  | bfdd-beacon: [1]: Listening for commands on 127.0.0.1:958
b_1  | bfdd-beacon: [1]: Listening for BFD connections on 0.0.0.0:3784
b_1  | bfdd-beacon: [1]: Listening for BFD connections on [::]:3784
```

In a new terminal create a BFD session:

```
$ make connect
docker exec -it openbfdd_a_1 bfdd-control allow 192.168.100.3
Allowing connections from 192.168.100.3
docker exec -it openbfdd_b_1 bfdd-control connect local 192.168.100.3 remote 192.168.100.2
Opened connection from local 192.168.100.3 to remote 192.168.100.2
docker exec -it openbfdd_b_1 bfdd-control status
There are 1 sessions:
Session 1
 id=1 local=192.168.100.3 (a) remote=192.168.100.2 state=Up
 docker exec -it openbfdd_a_1 bfdd-control status
 There are 1 sessions:
 Session 1
  id=1 local=192.168.100.2 (p) remote=192.168.100.3 state=Up
```

Kill the session:

```
$ make kill
docker exec -it openbfdd_b_1 bfdd-control session all kill
Attempting to kill session(s).
```

