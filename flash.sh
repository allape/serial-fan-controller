#!/usr/bin/bash

flash_size="4mb"
features="esp32-c3-supermini"
if [ "$1" == "2mb" ]; then
  features="esp-c3-32s"
  flash_size="2mb"
fi

# cargo build --release
cargo espflash flash \
  --release \
  --no-default-features --features $features \
  --baud 921600 \
  --chip esp32c3 \
  --flash-size "$flash_size" \
  --partition-table "partitions_singleapp_large_$flash_size.csv" \
  --monitor
