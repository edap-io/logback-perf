
DATE=$(date  '+%Y-%m-%dT%H%M')

echo "Results will be output into file results-${DATE}-[threadCount].txt"
sleep 1

DATE=$(date  '+%Y-%m-%dT%H%M')

#for TC in 1 2 4 8 16 32 64;
mvn clean
mvn install

TC=1
# default run duration of 10 seconds, single fork, time unit: microseconds, 2 warm up iterations, 4 iterations,
# $TC is the thread count, timeout 3 seconds, output results to "results-${DATE}-$TC.txt"

# -r time Minimum time to spend at each measurement iteration. Benchmarks may generally run longer than iteration duration. (default: 10 s)
WARM_DURATION=3
RUN_DURATION=30
# -bm [Throughput/thrpt, AverageTime/avgt, SampleTime/sample, SingleShotTime/ss, All/all]. (default: Throughput)

# -w Minimum time to spend at each warmup iteration.
# -r  Minimum time to spend at each measurement iteration.
# -to 1 timeout
TO=1

java -jar target/benchmarks.jar "ch.qos.logback.perf.AsyncWithFileAppenderBenchmark.*.*" -r $DURATION -f 1 -tu ms -r $RUN_DURATION -w $WARM_DURATION -wi 2 -i 4 -t $TC -to $TO -o "results-${DATE}-$TC.txt" 
