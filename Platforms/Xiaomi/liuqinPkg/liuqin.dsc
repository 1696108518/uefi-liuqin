##
#  Xiaomi Pad 6 Pro (liuqin, SM8475) - UEFI platform description.
#
#  Ported from Platforms/Nothing/pongPkg/pong.dsc. Differences from pong:
#    * FD base/size 0xA7100000/0x300000 (Resources/Configs/liuqin.toml)
#    * panel 1800x2880, SimpleFb GOP instead of the vendor DisplayDxe
#    * liuqin's own [MemoryMap] from uefi_a/uefi.elf (PIL Reserved 0x1DC00000)
#    * no ACPI tables: Apple's XNU consumes the ADT, not ACPI
#
#  Copyright (c) 2011 - 2022, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2020, Intel Corporation. All rights reserved.
#  Copyright (c) 2018, Bingxing Wang. All rights reserved.
#  Copyright (c) Microsoft Corporation.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = liuqin
  PLATFORM_GUID                  = 7F3C2A61-9E4B-4D2A-8B77-6C1E5D0A9F24
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/liuqinPkg
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = RELEASE|DEBUG
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = liuqinPkg/liuqin.fdf
  # liuqinPkg ships SimpleFbDxe: the ABL already lights 0xB8000000, and there is
  # no liuqin panel XML in the vendor binaries yet.
  USE_CUSTOM_DISPLAY_DRIVER      = 0

  #
  # 0 = SM8475
  # 1 = SM8475    (Overclocked)
  # 2 = SM7475-AB
  #
  SOC_TYPE                       = 0

!include PalimaPkg/PalimaPkg.dsc.inc

[PcdsFixedAtBuild]
  #
  # DDR Memory
  #
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000

  #
  # UEFI Stack (inside the uefiplat "UEFI FD Reserved" window)
  #
  gArmPlatformTokenSpaceGuid.PcdCPUCoresStackBase|0xA760D000
  gArmPlatformTokenSpaceGuid.PcdCPUCorePrimaryStackSize|0x40000

  #
  # SMBIOS
  #
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemManufacturer|"Xiaomi"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemModel|"Pad 6 Pro"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemRetailModel|"liuqin"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemRetailSku|"Pad_6_Pro_liuqin"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemBoardModel|"Pad 6 Pro"

  #
  # Simple Frame Buffer (M81_42_02_0b, dual DSI, 1800x2880)
  #
  gSiliciumPkgTokenSpaceGuid.PcdFrameBufferWidth|1800
  gSiliciumPkgTokenSpaceGuid.PcdFrameBufferHeight|2880
  gSiliciumPkgTokenSpaceGuid.PcdFrameBufferColorDepth|32

  #
  # Platform PEI
  #
  gQcomPkgTokenSpaceGuid.PcdPlatformType|"LA"

[LibraryClasses]
  # UniXNU boot manager core; DarwinBoot provides the XNU loader protocol.
  UniXNULib|UniXNUPkg/Library/UniXNULib/UniXNULib.inf

  #
  # Memory Libraries
  #
  MemoryMapLib|liuqinPkg/Library/MemoryMapLib/MemoryMapLib.inf

  #
  # QCOM Libraries
  #
  ConfigurationMapLib|liuqinPkg/Library/ConfigurationMapLib/ConfigurationMapLib.inf

[Components]
  UniXNUPkg/Application/UniXNU/UniXNU.inf
  UniXNUPkg/Driver/UniXNUDxe/UniXNUDxe.inf
  DarwinBootPkg/Driver/DarwinBoot.inf
  liuqinPkg/Drivers/LiuqinBootMemoryDxe/LiuqinBootMemoryDxe.inf
