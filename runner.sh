#!/bin/bash

# cd /home/veins/src/inet/examples/wireless/wiredandwirelesshostswithap
# opp_run -u Cmdenv -n ../../../examples:../:../../:../../../src -l ../../../src/INET omnetpp.ini -c High_Retransmission

set -e

# Go to example directory (like in your manual command)
cd /home/veins/src/inet/examples/wireless/wiredandwirelesshostswithap

INI="omnetpp.ini"
INET_LIB="../../../src/INET"
NEDPATH="../../../examples:../:../../:../../../src"
BASE_DIR=$(pwd)
SLEEPTIME=2  # seconds


########################
# Step-1: Wireless Hosts Variation
########################
steps_step1=(
  "Step-1_Host-02"
  "Step-1_Host-04"
  "Step-1_Host-06"
  "Step-1_Host-08"
  "Step-1_Host-10"
  "Step-1_Host-12"
  "Step-1_Host-14"
  "Step-1_Host-16"
  "Step-1_Host-18"
  "Step-1_Host-20"
)

# for entry in "${steps_step1[@]}"; do
#     config="${entry%%:*}"
#     hosts="${entry##*:}"

#     echo ">>> Running Step-1: $config ($hosts wireless hosts)"
#     opp_run -u Cmdenv -n $NEDPATH -l $INET_LIB $INI -c $config

#     sleep $SLEEPTIME

#     for f in cwUsed.csv DataErrorRate.csv HeaderErrorRate.csv udpPacketTransmissionInfo.csv; do
#         if [[ -f "$BASE_DIR/$f" ]]; then
#             mv "$BASE_DIR/$f" "$BASE_DIR/${config}_${f}"
#         fi
#     done
# done

########################
# Step-2: Traffic Generation Ramp
########################
steps_step2=(
  "Step-2_1"
  "Step-2_2"
  "Step-2_3"
  "Step-2_4"
  "Step-2_5"
  "Step-2_6"
  "Step-2_7"
  "Step-2_8"
  "Step-2_9"
  "Step-2_10"
)

for config in "${steps_step2[@]}"; do
    echo ">>> Running Step-2: $config"
    opp_run -u Cmdenv -n $NEDPATH -l $INET_LIB $INI -c "$config"

    sleep $SLEEPTIME

    for f in cwUsed.csv DataErrorRate.csv HeaderErrorRate.csv udpPacketTransmissionInfo.csv; do
        if [[ -f "$BASE_DIR/$f" ]]; then
            mv "$BASE_DIR/$f" "$BASE_DIR/${config}_${f}"
            echo "Renamed $f -> ${config}_${f}"
        else
            echo "File $f not found for $config"
        fi
    done

done


########################
# Step-4: DCF Collision Variation
########################
steps_step4=(
  "Step-4_DCF-1"
  "Step-4_DCF-2"
  "Step-4_DCF-3"
  "Step-4_DCF-4"
  "Step-4_DCF-5"
  "Step-4_DCF-6"
  "Step-4_DCF-7"
  "Step-4_DCF-8"
  "Step-4_DCF-9"
  "Step-4_DCF-10"
)

# for config in "${steps_step4[@]}"; do
#     echo ">>> Running Step-4: $config (DCF collision experiment)"
#     opp_run -u Cmdenv -n $NEDPATH -l $INET_LIB $INI -c $config

#     sleep $SLEEPTIME

#     # Rename output CSVs for this configuration
#     for f in cwUsed.csv DataErrorRate.csv HeaderErrorRate.csv udpPacketTransmissionInfo.csv; do
#         if [[ -f "$BASE_DIR/$f" ]]; then
#             mv "$BASE_DIR/$f" "$BASE_DIR/${config}_${f}"
#         fi
#     done
# done