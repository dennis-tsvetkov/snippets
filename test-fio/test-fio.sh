#!/bin/bash

TEST_DIR=./fio-test
FILE_SZ="4G"
FIO_RUNTIME="10s"

sudo mkdir -p $TEST_DIR

echo "write_throughput:"
sudo fio --name=write_throughput --directory=$TEST_DIR --numjobs=8 \
	--size=$FILE_SZ --time_based --runtime=$FIO_RUNTIME --ramp_time=2s --ioengine=libaio \
	--direct=1 --verify=0 --bs=1M --iodepth=64 --rw=write --group_reporting=1 | grep IOPS

sudo rm -rf $TEST_DIR/*

echo "write_iops:"
sudo fio --name=write_iops --directory=$TEST_DIR --size=$FILE_SZ \
	--time_based --runtime=$FIO_RUNTIME --ramp_time=2s --ioengine=libaio --direct=1 \
	--verify=0 --bs=4K --iodepth=256 --rw=randwrite --group_reporting=1 | grep IOPS

sudo rm -rf $TEST_DIR/*

echo "read_throughput:"
sudo fio --name=read_throughput --directory=$TEST_DIR --numjobs=8 \
	--size=$FILE_SZ --time_based --runtime=$FIO_RUNTIME --ramp_time=2s --ioengine=libaio \
	--direct=1 --verify=0 --bs=1M --iodepth=64 --rw=read --group_reporting=1 | grep IOPS

sudo rm -rf $TEST_DIR/*

echo "read_iops:"
sudo fio --name=read_iops --directory=$TEST_DIR --size=$FILE_SZ \
	--time_based --runtime=$FIO_RUNTIME --ramp_time=2s --ioengine=libaio --direct=1 \
	--verify=0 --bs=4K --iodepth=256 --rw=randread --group_reporting=1 | grep IOPS

sudo rm -rf $TEST_DIR

