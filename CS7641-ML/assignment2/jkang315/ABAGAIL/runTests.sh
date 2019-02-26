#!/bin/bash

CORES=3
OUTPUT=${OUTPUT:-results}

array=(
    FlipFlopTestjk
    NQueensTestjk
    FourPeaksTestjk
    MaxKColoringTestjk
    TravelingSalesmanTestjk
)

mkdir -p ${OUTPUT}

count=0

function set_header {
    if [[ $1 = "CarTest" ]]; then
        echo "algorithm,iterations,training error,testing error,training time,testing time" > ${OUTPUT}/${1}.csv
    else
        echo "algorithm,iterations,time,optim" > ${OUTPUT}/${1}.csv
    fi
}

for j in "${array[@]}";do
    for i in $(seq 1 500 10001);do
        count=$((count+1))

        if [[ $count -eq 0 ]]; then
            set_header ${j}
        fi

        java -cp ABAGAIL.jar opt.test.${j} ${i} >| /tmp/${j}${i}.csv &

        if [[ $(expr $count % ${CORES}) -eq 0 ]]; then
            # wait for cores to free up
            wait
        fi
    done
    # catch overflow
    wait
    cat /tmp/${j}*.csv >> ${OUTPUT}/${j}.csv
    rm -f /tmp/${j}*.csv
done