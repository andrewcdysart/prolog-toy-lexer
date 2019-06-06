###########################################################
# Provided under the MIT license.                         #
# See License.md for license details                      #
# Copyright (c) 2019 Andrew Dysart                        #
###########################################################

##########################################################################
#                                                                        #
#  Global Folder Paths                                                   #
#                                                                        #
##########################################################################

PATH_BUILD := $(dir $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))

PATH_BUILDFILES := build
IMAGE_DIR       := $(PATH_BUILDFILES)/image
OBJECT_DIR      := $(PATH_BUILDFILES)/obj

##########################################################################
#                                                                        #
#  General Tools                                                         #
#                                                                        #
##########################################################################

CC := "C:/LLVM/bin/clang.exe"
LD := "C:/LLVM/bin/clang++.exe"
PL := "C:/Program Files/swipl/bin/swipl.exe"

CFLAGS := -c
COMPILER_INCLUDE_PATH := -I"C:/program files/swipl/include"
COMPILER_FLAGS += -D_CRT_SECURE_NO_WARNINGS \
						-D_REENTRANT \
						-D__WINDOWS__ \
						-D_WINDOWS \
						-D__SWI_PROLOG__ \
						-D__SWI_EMBEDDED__

LINKER_FLAGS := -L"C:/program files/swipl/lib/x64-win64"
LINKER_INCLUDES := -lswipl

PLEXE_NAME := pltmp.exe
SWI_FLAGS := -f none \
				 -F none \
				 -g true \
				 -t "consult(['$(PL_MAIN)']),qsave_program('$(PLEXE_NAME)',[goal=true,toplevel=prolog,init_file=none])"