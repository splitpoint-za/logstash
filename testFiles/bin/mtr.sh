#!/bin/bash
TARGET=www.google.com
mtr --no-dns --order "LSDNBAWVGJMXI" --report-wide -c 4 $TARGET | tr '?' 'X' |grep -v "^Start:"|sed 's/^/'"$TARGET"' /g'|sed -e 's/.|--//g' |grep -v "HOST:" |   awk -v OFS=, '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16}' |    jq -R 'split(",") | {targer: .[0], hopeNumber: .[1], destinationAddress: .[2], packetLossPercentage: .[3], sentPackets: .[4], droppedPackets: .[5], lastPacketLatencyr: .[6], bestPacketLatency: .[7], allPacketsAverageLatency: .[8], worstPacketLatency: .[9], standardDeviationOfPacketLatency: .[10], geometricMeanOfPacketLatency: .[11], packetInterArrivalJitter: .[12], averageJitter: .[13], maximumJitter: .[14], minimumJitter: .[15]}'
exit 0
