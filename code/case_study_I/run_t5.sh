#!/bin/bash

num_digit=10

sim_train=nest
sim_test=spin
num_test=1000
dur=1000
sum_rate=5000
source ~/env/nest_pynn0.7/bin/activate
arr=(1 10 100 1000)
    for j in `seq 0 1 3`;
    do
        num_cluster=${arr[$j]}
        echo '--Start testing with Nest, dur_test:' $dur ',sum_rate:'$sum_rate ', '$num_test 'per test' >> log.txt
        date >> log.txt
        for i in `seq 0 $num_test 9999`;
        do
            python test_mnist.py $num_cluster $sim_train $sim_test $num_test $i $dur $sum_rate
            echo '-Done: test' $i >> log.txt
            date >> log.txt
        done
        echo '--Finish testing with Nest' >> log.txt
        date >> log.txt
        python test_analysis.py $num_cluster $sim_train $sim_test $dur $sum_rate>> log.txt
    done
