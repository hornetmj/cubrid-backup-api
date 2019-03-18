#!/bin/bash

#set -x
cur_path=`pwd`
db_name=$1

cp cubrid_backup.conf $CUBRID/conf/
rm -rf ./backup_dir/* ${db_name}_bkvinf

mkdir -p ./backup_dir/1
./bk_test01 $db_name 0 ./backup_dir/1/${db_name}_bk0v000 >> conf_test_result 2>&1
if [ `grep "0 \-l 0 \-\-no\-check \-t 8 \-\-sleep\-msecs=1000" .cubrid_backup.log | wc -l` -eq 1 ]; then
        echo "[OK] set cubrid_backup.conf (1)" >> conf_test_result
else
        echo "[NOK] set cubrid_backup.conf (1)" >> conf_test_result
	cat .cubrid_backup.log >> conf_test_result
fi
rm -rf .cubrid_backup.log
sleep 1

cp cubrid_backup.conf $CUBRID/conf/
sed -i "s/remove_archive=false/remove_archive=true/g" $CUBRID/conf/cubrid_backup.conf
mkdir -p ./backup_dir/2
./bk_test01 $db_name 0 ./backup_dir/2/${db_name}_bk0v000 >> conf_test_result 2>&1
if [ `grep "0 \-r \-l 0 \-\-no\-check \-t 8 \-\-sleep\-msecs=1000" .cubrid_backup.log | wc -l` -eq 1 ]; then
        echo "[OK] set cubrid_backup.conf (2)" >> conf_test_result
else
        echo "[NOK] set cubrid_backup.conf (2)" >> conf_test_result
	cat .cubrid_backup.log >> conf_test_result
fi
rm -rf .cubrid_backup.log
sleep 1

cp cubrid_backup.conf $CUBRID/conf/
sed -i "s/no_check=true/no_check=false/g" $CUBRID/conf/cubrid_backup.conf
mkdir -p ./backup_dir/3
./bk_test01 $db_name 0 ./backup_dir/3/${db_name}_bk0v000 >> conf_test_result 2>&1
if [ `grep "0 \-l 0 \-t 8 \-\-sleep\-msecs=1000" .cubrid_backup.log | wc -l` -eq 1 ]; then
        echo "[OK] set cubrid_backup.conf (3)" >> conf_test_result
else
        echo "[NOK] set cubrid_backup.conf (3)" >> conf_test_result
	cat .cubrid_backup.log >> conf_test_result
fi
rm -rf .cubrid_backup.log
sleep 1

cp cubrid_backup.conf $CUBRID/conf/
sed -i "s/thread_count=8/#thread_count=8/g" $CUBRID/conf/cubrid_backup.conf
mkdir -p ./backup_dir/4
./bk_test01 $db_name 0 ./backup_dir/4/${db_name}_bk0v000 >> conf_test_result 2>&1
if [ `grep "0 \-l 0 \-\-no\-check \-\-sleep\-msecs=1000" .cubrid_backup.log | wc -l` -eq 1 ]; then
        echo "[OK] set cubrid_backup.conf (4)" >> conf_test_result
else
        echo "[NOK] set cubrid_backup.conf (4)" >> conf_test_result
	cat .cubrid_backup.log >> conf_test_result
fi
rm -rf .cubrid_backup.log
sleep 1

cp cubrid_backup.conf $CUBRID/conf/
sed -i "s/compress=false/compress=true/g" $CUBRID/conf/cubrid_backup.conf
mkdir -p ./backup_dir/5
./bk_test01 $db_name 0 ./backup_dir/5/${db_name}_bk0v000 >> conf_test_result 2>&1
if [ `grep "0 \-l 0 \-\-no\-check \-t 8 \-z \-\-sleep\-msecs=1000" .cubrid_backup.log | wc -l` -eq 1 ]; then
        echo "[OK] set cubrid_backup.conf (5)" >> conf_test_result
else
        echo "[NOK] set cubrid_backup.conf (5)" >> conf_test_result
	cat .cubrid_backup.log >> conf_test_result
fi
rm -rf .cubrid_backup.log
sleep 1

cp cubrid_backup.conf $CUBRID/conf/
sed -i "s/except_active_log=false/except_active_log=true/g" $CUBRID/conf/cubrid_backup.conf
mkdir -p ./backup_dir/6
./bk_test01 $db_name 0 ./backup_dir/6/${db_name}_bk0v000 >> conf_test_result 2>&1
if [ `grep "0 \-l 0 \-\-no\-check \-t 8 \-e \-\-sleep\-msecs=1000" .cubrid_backup.log | wc -l` -eq 1 ]; then
        echo "[OK] set cubrid_backup.conf (6)" >> conf_test_result
else
        echo "[NOK] set cubrid_backup.conf (6)" >> conf_test_result
	cat .cubrid_backup.log >> conf_test_result
fi
rm -rf .cubrid_backup.log
sleep 1

cp cubrid_backup.conf $CUBRID/conf/
sed -i "s/sleep_msecs=1000/#sleep_msecs=1000/g" $CUBRID/conf/cubrid_backup.conf
mkdir -p ./backup_dir/7
./bk_test01 $db_name 0 ./backup_dir/7/${db_name}_bk0v000 >> conf_test_result 2>&1
if [ `grep "0 \-l 0 \-\-no\-check \-t 8" .cubrid_backup.log | wc -l` -eq 1 ]; then
        echo "[OK] set cubrid_backup.conf (7)" >> conf_test_result
else
        echo "[NOK] set cubrid_backup.conf (7)" >> conf_test_result
	cat .cubrid_backup.log >> conf_test_result
fi
rm -rf .cubrid_backup.log
sleep 1

cp cubrid_backup.conf $CUBRID/conf/
sed -i "s/remove_archive=false/remove_archive=true/g" $CUBRID/conf/cubrid_backup.conf
sed -i "s/compress=false/compress=true/g" $CUBRID/conf/cubrid_backup.conf
sed -i "s/except_active_log=false/except_active_log=true/g" $CUBRID/conf/cubrid_backup.conf
mkdir -p ./backup_dir/8
./bk_test01 $db_name 0 ./backup_dir/8/${db_name}_bk0v000 >> conf_test_result 2>&1
if [ `grep "0 \-r \-l 0 \-\-no\-check \-t 8 \-z \-e \-\-sleep\-msecs=1000" .cubrid_backup.log | wc -l` -eq 1 ]; then
        echo "[OK] set cubrid_backup.conf (8)" >> conf_test_result
else
        echo "[NOK] set cubrid_backup.conf (8)" >> conf_test_result
	cat .cubrid_backup.log >> conf_test_result
fi
rm -rf .cubrid_backup.log
sleep 1

cp cubrid_backup.conf $CUBRID/conf/
sed -i "s/no_check=true/no_check=false/g" $CUBRID/conf/cubrid_backup.conf
sed -i "s/thread_count=8/#thread_count=8/g" $CUBRID/conf/cubrid_backup.conf
mkdir -p ./backup_dir/9
./bk_test01 $db_name 0 ./backup_dir/9/${db_name}_bk0v000 >> conf_test_result 2>&1
if [ `grep "0 \-l 0 \-\-sleep\-msecs=1000" .cubrid_backup.log | wc -l` -eq 1 ]; then
        echo "[OK] set cubrid_backup.conf (9)" >> conf_test_result
else
        echo "[NOK] set cubrid_backup.conf (9)" >> conf_test_result
	cat .cubrid_backup.log >> conf_test_result
fi
rm -rf .cubrid_backup.log
sleep 1

cp cubrid_backup.conf $CUBRID/conf/
sed -i "s/no_check=true/no_check=false/g" $CUBRID/conf/cubrid_backup.conf
sed -i "s/thread_count=8/#thread_count=8/g" $CUBRID/conf/cubrid_backup.conf
sed -i "s/sleep_msecs=1000/#sleep_msecs=1000/g" $CUBRID/conf/cubrid_backup.conf
mkdir -p ./backup_dir/10
./bk_test01 $db_name 0 ./backup_dir/10/${db_name}_bk0v000 >> conf_test_result 2>&1
if [ `grep "0 \-l 0" .cubrid_backup.log | wc -l` -eq 1 ]; then
        echo "[OK] set cubrid_backup.conf (10)" >> conf_test_result
else
        echo "[NOK] set cubrid_backup.conf (10)" >> conf_test_result
	cat .cubrid_backup.log >> conf_test_result
fi
rm -rf .cubrid_backup.log

rm -rf $CUBRID/conf/cubrid_backup.conf