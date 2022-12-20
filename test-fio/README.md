# test-fio
#### What it does
It installs `fio` utility and performs 4 test:
 - write_throughput
 - write_iops
 - read_throughput
 - read_iops

Default setting is the following:
 - `TEST_DIR=./fio-test`
 - `FILE_SZ="4G"`
 - `FIO_RUNTIME="10s"`

#### How to run
Copy, paste, hit enter
`sudo apt update && sudo apt install fio && curl https://raw.githubusercontent.com/dennis-tsvetkov/snippets/master/test-fio/test-fio.sh | sh`
