GEM5_BINARY="./build/ARM/gem5.debug"
TEST_PROG="tests/test-progs/hello/bin/arm/linux/hello"
#INJECT_TIME=25567500
INJECT_TIME=3000000
INJECT_LOC=5
INJECT_ARCH="PipeReg"

GEM5_OPTIONS="--debug-flags=FI,MinorExecute -r"

DEBUG_SCOREBOARD=false #set false to disable debug flag

if [ $DEBUG_SCOREBOARD = true ]; then
    GEM5_OPTIONS="--debug-flags=MinorScoreboard -r"
fi

$GEM5_BINARY $GEM5_OPTIONS configs/example/se.py -c $TEST_PROG --cpu-type "minor" --caches --injectTime $INJECT_TIME --injectLoc $INJECT_LOC --injectArch $INJECT_ARCH
