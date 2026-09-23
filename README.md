# N60 Pro 自动编译固件

磊科 N60 Pro (MT7986A) 专用在线编译模板，产物自动发布到 [Releases](../../releases)。

## 固件特性

- 源码: [chasey-dev/immortalwrt-mt798x-rebase](https://github.com/chasey-dev/immortalwrt-mt798x-rebase) `25.12` 分支（MTK 原厂有线/无线驱动 + HNAT）
- 5G 模组管理: [QModem](https://github.com/FUjr/QModem) + `luci-app-qmodem-next`
- 全协议模组驱动: QMI / MBIM / NCM / ECM / RNDIS / serial-option（移远、中兴、华为等 USB 模组通吃）
- USB3.0 + UAS 存储 + automount（可插 U 盘扩容）
- MTK HNAT 硬件加速（`luci-app-turboacc-mtk`，支持 USB 模组做 WAN）

## 使用

1. 进 Actions 页手动触发 `N60Pro Firmware Build`（或等每周六自动构建）
2. 完成后到 Releases 下载固件

## 刷机步骤（N60 Pro）

> ⚠️ 刷机有风险，变砖可救（recovery 镜像 + TTL/有线恢复），操作前确保电量/电源稳定。

1. **刷第三方 uboot**（如果还没刷）：
   - 下载 Release 里的 `bl31-uboot.fip` 和 `preloader.bin`
   - SSH 到当前固件（原厂需先开 SSH），上传后：
     ```
     mtd write /tmp/preloader.bin Preloader
     mtd write /tmp/bl31-uboot.fip FIP
     ```
   - 断电，按住 reset 上电进入 uboot（192.168.1.1）
2. **刷固件**：uboot 页面上传 `*-sysupgrade.itb` 刷写；已在本模板固件上的用 `sysupgrade -n` 升级
3. **救砖**：下载 `*-recovery.itb`，TTL/uboot 刷入 recovery 分区

## 默认参数

- IP: `192.168.1.1`，用户 `root`，密码空（首次登录即设置）
- QModem 位置：LuCI → 网络 → 蜂窝网络管理
