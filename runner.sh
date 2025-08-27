#!/bin/bash

# Basic command
# cd /home/veins/src/inet/examples/wireless/wiredandwirelesshostswithap
# opp_run -u Cmdenv -n ../../../examples:../:../../:../../../src -l ../../../src/INET omnetpp.ini -c High_Retransmission

set -e

# Go to example directory
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

# for config in "${steps_step1[@]}"; do
#     echo ">>> Running Step-1: $config"
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
  "Step-2a_1"
  "Step-2a_2"
  "Step-2a_3"
  "Step-2a_4"
  "Step-2a_5"
  "Step-2a_6"
  "Step-2a_7"
  "Step-2a_8"
  "Step-2a_9"
  "Step-2a_10"
  "Step-2b_1"
  "Step-2b_2"
  "Step-2b_3"
  "Step-2b_4"
  "Step-2b_5"
  "Step-2b_6"
  "Step-2b_7"
  "Step-2b_8"
  "Step-2b_9"
  "Step-2b_10"
  "Step-2c_1"
  "Step-2c_2"
  "Step-2c_3"
  "Step-2c_4"
  "Step-2c_5"
)

# for config in "${steps_step2[@]}"; do
#     echo ">>> Running Step-2: $config"
#     opp_run -u Cmdenv -n $NEDPATH -l $INET_LIB $INI -c "$config"

#     sleep $SLEEPTIME

#     for f in cwUsed.csv DataErrorRate.csv HeaderErrorRate.csv udpPacketTransmissionInfo.csv; do
#         if [[ -f "$BASE_DIR/$f" ]]; then
#             mv "$BASE_DIR/$f" "$BASE_DIR/${config}_${f}"
#             echo "Renamed $f -> ${config}_${f}"
#         else
#             echo "File $f not found for $config"
#         fi
#     done

# done


########################
# Step-4: DCF Collision Variation
########################
steps_step4=(
    "DCF_LOAD_1"
    "DCF_LOAD_2"
    "DCF_LOAD_3"
    "DCF_LOAD_4"
    "DCF_CW_1"
    "DCF_CW_2"
    "DCF_CW_3"
    "DCF_CW_4"
    "DCF_RETRY_1"
    "DCF_RETRY_2"
    "DCF_RETRY_3"
    "DCF_RETRY_4"
    "DCF_RTS_1"
    "DCF_RTS_2"
    "DCF_RTS_3"
    "DCF_RTS_4"
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


########################
# Task-3: Wired/Wireless
########################
task3=(
  "Wired-2" "Wired-4" "Wired-6" "Wired-8" "Wired-10" "Wired-12" "Wired-14"
  "Wireless-2" "Wireless-4" "Wireless-6" "Wireless-8" "Wireless-10" "Wireless-12" "Wireless-14"
)

for config in "${task3[@]}"; do
  echo ">>> Running Step-3: $config"
  opp_run -u Cmdenv -n $NEDPATH -l $INET_LIB $INI -c "$config"

  sleep $SLEEPTIME

  # Rename output CSVs for this configuration
  for f in cwUsed.csv DataErrorRate.csv HeaderErrorRate.csv udpPacketTransmissionInfo.csv; do
    if [[ -f "$BASE_DIR/$f" ]]; then
      mv "$BASE_DIR/$f" "$BASE_DIR/${config}_${f}"
      echo "Renamed $f -> ${config}_${f}"
    else
      echo "File $f not found for $config"
    fi
  done
done