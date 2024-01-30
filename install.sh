#!/bin/bash
set -e

# 检查是否在本地手动执行
if [ ! -e "./TO" ]; then

    echo "TO: 准备安装"
    tmp="$HOME/.cache/"
    cd $tmp
    echo "TO: 克隆仓库"
    git clone https://github.com/mhduiy/TO-Script
    cd TO-Script
    echo "TO: 准备安装 ${pwd}"
    chmod +x ./install.sh

    ./install.sh

    cd ..
    echo "TO: 清理临时文件"
    rm -rf ./TO-Script
else
    echo "*********安装TO*********"
    sudo cp ./TO /usr/bin/
    sudo chmod 755 /usr/bin/TO

    exit_status=$?
    if [ $exit_status -eq 0 ]; then
        echo "TO: 安装成功 ^o^"
    else
        echo "TO: 安装失败 T^T"
    fi
fi