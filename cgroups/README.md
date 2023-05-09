```
# create new group "mygroup"
mkdir /sys/fs/cgroup/mygroup
mkdir /sys/fs/cgroup/mygroup/tasks
# add cpu and memory controllers
echo "+cpu" >> /sys/fs/cgroup/mygroup/cgroup.subtree_control
echo "+cpuset" >> /sys/fs/cgroup/mygroup/cgroup.subtree_control
echo "+memory" >> /sys/fs/cgroup/mygroup/cgroup.subtree_control
# set cpu limit 20%
echo "20000 100000" > /sys/fs/cgroup/mygroup/tasks/cpu.max
# set hard memory limit of 2GiB
echo "2147483648" > /sys/fs/cgroup/mygroup/memory.max
# add process with PID 71880 to mygroup
echo 71880 >> /sys/fs/cgroup/mygroup/tasks/cgroup.procs
```
