#!/bin/bash
# 注入 QModem feed
sed -i '$a src-git qmodem https://github.com/FUjr/QModem.git;main' feeds.conf.default
cat feeds.conf.default
