###########################################################
# Provided under the MIT license.                         #
# See License.md for license details                      #
# Copyright (c) 2019 Andrew Dysart                        #
###########################################################

.ONESHELL:
all: default

PATH_BASE := $(dir $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))

###########################################################
#                                                         #
# Source Files                                            #
#                                                         #
###########################################################

C_SRC := lexer.c

PL_MAIN := lexer.pl

C_OBJS = $(C_SRC:.c=.o)
# strip the relative path and add the object path
C_OBJS_WP = $(patsubst %.o, $(OBJECT_DIR)/%.o, $(C_OBJS) )

###########################################################
#                                                         #
# makefile includes                                       #
#                                                         #
###########################################################

include ./toolset.mak

###########################################################
#                                                         #
# Targets                                                 #
#                                                         #
###########################################################

default: lexer.exe
	@echo ' |'
	@echo ' | Default: Done.'
	@echo ' +-------------------------------------------------'
	@echo

clean:
	@echo ' |'
	@echo ' | Removing build artifacts.'
	@rm -rf $(PATH_BUILDFILES)/ || true
	# @rm -f *.exe || true
	@echo ' |'
	@echo ' | Making directories.'
	@mkdir $(PATH_BUILDFILES)
	@mkdir $(OBJECT_DIR)
	@mkdir $(IMAGE_DIR)
	@echo ' |'
	@echo ' | Clean: Done.'
	@echo ' +-------------------------------------------------'
	@echo

echo:
	@echo ' $(C_OBJS_WP)'
	@echo ' $(C_OBJS)'

lexer.exe: $(C_OBJS_WP)
	@echo ' |'
	@echo ' | Building target: $@'
	@$(LD) -o $@ $(LINKER_FLAGS) $(LINKER_INCLUDES) $(C_OBJS_WP)
	@echo ' | Built.'
	@echo ' |'
	@echo ' | Concatenating Prolog File: $(PLEXE_NAME)...'
	@$(PL) $(SWI_FLAGS)
	@cat $(PLEXE_NAME) >> $@
	@chmod 777 $@
	@rm $(PLEXE_NAME)
	@echo ' | Concatenated.'
	@echo ' | Moving $@ to $(IMAGE_DIR).'
	@mv $@ $(IMAGE_DIR)/$@

$(OBJECT_DIR)/%.o: %.c
	$(COMPILE_COMMAND)

define COMPILE_COMMAND
@echo ' |'
@echo ' | Building file: $<'
@echo ' |    Invoking: Clang Compiler'
@$(CC) $(CFLAGS) $(COMPILER_INCLUDE_PATH) $(COMPILER_FLAGS) "$<"
@echo ' |    Finished building: $<'
@mv $(*F).o $(OBJECT_DIR)/$(*F).o
@echo ' +----------------------------------------------------'
@echo
endef