#!/bin/bash

#================================================================
#   
#   
#   文件名称：copy.sh
#   创 建 者：肖飞
#   创建日期：2021年08月02日 星期一 15时31分26秒
#   修改日期：2022年03月14日 星期一 11时27分34秒
#   描    述：
#
#================================================================
function main() {
	cat cscope/cscope.files | while read line; do
		echo rsync -aR $line ./src | grep "/chain_dau_power_control/\|/stm32_apps/\|/sal/\|/cJSON/" | sed 's:"::g' | sed 's:/chain_dau_power_control/:/chain_dau_power_control/./:g' | sed 's:/stm32_apps/:/stm32_apps/./:g' | sed 's:/sal/:/./sal/:g' | sed 's:/cJSON/:/./cJSON/:g'
	done
	echo rsync -aR "$(pwd)/./STM32F407VGTx_FLASH.ld" ./src
	echo rsync -aR "$(pwd)/./Makefile" ./src
	echo rsync -aR "$(pwd)/./config.mk" ./src
	echo rsync -aR "$(pwd)/./override.mk" ./src
	echo rsync -aR "$(pwd)/./user.mk" ./src
	echo rsync -aR "$(pwd)/./sal/sal.mk" ./src
}

main $@
