#!/bin/sh
#
# Copyright 2014-present Facebook. All Rights Reserved.
#
# This program file is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program in a file named COPYING; if not, write to the
# Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor,
# Boston, MA 02110-1301 USA

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin

# setup ADC channels

ADC_PATH="/sys/devices/platform/ast_adc.0"
# channel 0: r1: 2.87K; r2:  2.0K; v2: 0mv
# channel 1: r1: 5.36K; r2:  2.0K; v2: 0mv
# channel 2: r1: 15.8K; r2:  2.0K; v2: 0mv
# channel 3: r1:  1.0K; r2:  0.0K; v2: 0mv
# channel 4: r1:  1.0K; r2:  0.0K; v2: 0mv
# channel 5: r1: 2.87K; r2:  2.0K; v2: 0mv
# channel 6: r1: 5.36K; r2:  2.0K; v2: 0mv
# channel 7: r1: 4.75K; r2:  0.0K; v2: 0mv

config_adc() {
    channel=$1
    r1=$2
    r2=$3
    v2=$4
    echo $r1 > ${ADC_PATH}/adc${channel}_r1
    echo $r2 > ${ADC_PATH}/adc${channel}_r2
    echo $v2 > ${ADC_PATH}/adc${channel}_v2
    echo 1 > ${ADC_PATH}/adc${channel}_en
}
config_adc 0  287 200 0
config_adc 1  536 200 0
config_adc 2 1580 200 0
config_adc 3   10 200 0
config_adc 4   10 200 0
config_adc 5  287 200 0
config_adc 6  536 200 0
config_adc 7  400 200 0
