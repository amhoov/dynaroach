#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/dynaroach.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/dynaroach.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/921515994/battery.o ${OBJECTDIR}/_ext/921515994/delay.o ${OBJECTDIR}/_ext/921515994/dfmem.o ${OBJECTDIR}/_ext/921515994/gyro.o ${OBJECTDIR}/_ext/921515994/init_default.o ${OBJECTDIR}/_ext/921515994/ipspi1.o ${OBJECTDIR}/_ext/921515994/larray.o ${OBJECTDIR}/_ext/921515994/ovcam.o ${OBJECTDIR}/_ext/921515994/payload.o ${OBJECTDIR}/_ext/921515994/payload_queue.o ${OBJECTDIR}/_ext/921515994/quat.o ${OBJECTDIR}/_ext/921515994/queue.o ${OBJECTDIR}/_ext/921515994/wii.o ${OBJECTDIR}/_ext/921515994/xl.o ${OBJECTDIR}/_ext/921515994/libqw.o ${OBJECTDIR}/src/cmd.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/motor_ctrl.o ${OBJECTDIR}/src/sma.o ${OBJECTDIR}/src/statetransition.o ${OBJECTDIR}/src/attitude_q.o ${OBJECTDIR}/_ext/921515994/udiv16.o ${OBJECTDIR}/_ext/921515994/div16.o ${OBJECTDIR}/_ext/921515994/sclock.o ${OBJECTDIR}/_ext/921515994/radio.o ${OBJECTDIR}/_ext/921515994/mac_packet.o ${OBJECTDIR}/_ext/921515994/carray.o ${OBJECTDIR}/_ext/921515994/ppool.o ${OBJECTDIR}/_ext/921515994/at86rf231_driver.o ${OBJECTDIR}/_ext/921515994/spi_controller.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/921515994/battery.o.d ${OBJECTDIR}/_ext/921515994/delay.o.d ${OBJECTDIR}/_ext/921515994/dfmem.o.d ${OBJECTDIR}/_ext/921515994/gyro.o.d ${OBJECTDIR}/_ext/921515994/init_default.o.d ${OBJECTDIR}/_ext/921515994/ipspi1.o.d ${OBJECTDIR}/_ext/921515994/larray.o.d ${OBJECTDIR}/_ext/921515994/ovcam.o.d ${OBJECTDIR}/_ext/921515994/payload.o.d ${OBJECTDIR}/_ext/921515994/payload_queue.o.d ${OBJECTDIR}/_ext/921515994/quat.o.d ${OBJECTDIR}/_ext/921515994/queue.o.d ${OBJECTDIR}/_ext/921515994/wii.o.d ${OBJECTDIR}/_ext/921515994/xl.o.d ${OBJECTDIR}/_ext/921515994/libqw.o.d ${OBJECTDIR}/src/cmd.o.d ${OBJECTDIR}/src/main.o.d ${OBJECTDIR}/src/motor_ctrl.o.d ${OBJECTDIR}/src/sma.o.d ${OBJECTDIR}/src/statetransition.o.d ${OBJECTDIR}/src/attitude_q.o.d ${OBJECTDIR}/_ext/921515994/udiv16.o.d ${OBJECTDIR}/_ext/921515994/div16.o.d ${OBJECTDIR}/_ext/921515994/sclock.o.d ${OBJECTDIR}/_ext/921515994/radio.o.d ${OBJECTDIR}/_ext/921515994/mac_packet.o.d ${OBJECTDIR}/_ext/921515994/carray.o.d ${OBJECTDIR}/_ext/921515994/ppool.o.d ${OBJECTDIR}/_ext/921515994/at86rf231_driver.o.d ${OBJECTDIR}/_ext/921515994/spi_controller.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/921515994/battery.o ${OBJECTDIR}/_ext/921515994/delay.o ${OBJECTDIR}/_ext/921515994/dfmem.o ${OBJECTDIR}/_ext/921515994/gyro.o ${OBJECTDIR}/_ext/921515994/init_default.o ${OBJECTDIR}/_ext/921515994/ipspi1.o ${OBJECTDIR}/_ext/921515994/larray.o ${OBJECTDIR}/_ext/921515994/ovcam.o ${OBJECTDIR}/_ext/921515994/payload.o ${OBJECTDIR}/_ext/921515994/payload_queue.o ${OBJECTDIR}/_ext/921515994/quat.o ${OBJECTDIR}/_ext/921515994/queue.o ${OBJECTDIR}/_ext/921515994/wii.o ${OBJECTDIR}/_ext/921515994/xl.o ${OBJECTDIR}/_ext/921515994/libqw.o ${OBJECTDIR}/src/cmd.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/motor_ctrl.o ${OBJECTDIR}/src/sma.o ${OBJECTDIR}/src/statetransition.o ${OBJECTDIR}/src/attitude_q.o ${OBJECTDIR}/_ext/921515994/udiv16.o ${OBJECTDIR}/_ext/921515994/div16.o ${OBJECTDIR}/_ext/921515994/sclock.o ${OBJECTDIR}/_ext/921515994/radio.o ${OBJECTDIR}/_ext/921515994/mac_packet.o ${OBJECTDIR}/_ext/921515994/carray.o ${OBJECTDIR}/_ext/921515994/ppool.o ${OBJECTDIR}/_ext/921515994/at86rf231_driver.o ${OBJECTDIR}/_ext/921515994/spi_controller.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/dynaroach.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ128MC706A
MP_LINKER_FILE_OPTION=,--script="p33FJ128MC706A_Bootload.gld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/921515994/delay.o: ../imageproc-lib/delay.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/delay.o.ok ${OBJECTDIR}/_ext/921515994/delay.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/delay.o.d" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE)  ../imageproc-lib/delay.s -o ${OBJECTDIR}/_ext/921515994/delay.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD "${OBJECTDIR}/_ext/921515994/delay.o.d"$(MP_EXTRA_AS_POST)
	
${OBJECTDIR}/_ext/921515994/udiv16.o: ../imageproc-lib/udiv16.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/udiv16.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/udiv16.o.ok ${OBJECTDIR}/_ext/921515994/udiv16.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/udiv16.o.d" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE)  ../imageproc-lib/udiv16.s -o ${OBJECTDIR}/_ext/921515994/udiv16.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD "${OBJECTDIR}/_ext/921515994/udiv16.o.d"$(MP_EXTRA_AS_POST)
	
${OBJECTDIR}/_ext/921515994/div16.o: ../imageproc-lib/div16.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/div16.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/div16.o.ok ${OBJECTDIR}/_ext/921515994/div16.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/div16.o.d" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE)  ../imageproc-lib/div16.s -o ${OBJECTDIR}/_ext/921515994/div16.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD "${OBJECTDIR}/_ext/921515994/div16.o.d"$(MP_EXTRA_AS_POST)
	
else
${OBJECTDIR}/_ext/921515994/delay.o: ../imageproc-lib/delay.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/delay.o.ok ${OBJECTDIR}/_ext/921515994/delay.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/delay.o.d" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE)  ../imageproc-lib/delay.s -o ${OBJECTDIR}/_ext/921515994/delay.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 -g  -MD "${OBJECTDIR}/_ext/921515994/delay.o.d"$(MP_EXTRA_AS_POST)
	
${OBJECTDIR}/_ext/921515994/udiv16.o: ../imageproc-lib/udiv16.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/udiv16.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/udiv16.o.ok ${OBJECTDIR}/_ext/921515994/udiv16.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/udiv16.o.d" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE)  ../imageproc-lib/udiv16.s -o ${OBJECTDIR}/_ext/921515994/udiv16.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 -g  -MD "${OBJECTDIR}/_ext/921515994/udiv16.o.d"$(MP_EXTRA_AS_POST)
	
${OBJECTDIR}/_ext/921515994/div16.o: ../imageproc-lib/div16.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/div16.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/div16.o.ok ${OBJECTDIR}/_ext/921515994/div16.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/div16.o.d" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE)  ../imageproc-lib/div16.s -o ${OBJECTDIR}/_ext/921515994/div16.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 -g  -MD "${OBJECTDIR}/_ext/921515994/div16.o.d"$(MP_EXTRA_AS_POST)
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/921515994/battery.o: ../imageproc-lib/battery.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/battery.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/battery.o.ok ${OBJECTDIR}/_ext/921515994/battery.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/battery.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/battery.o.d" -o ${OBJECTDIR}/_ext/921515994/battery.o ../imageproc-lib/battery.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/dfmem.o: ../imageproc-lib/dfmem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/dfmem.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/dfmem.o.ok ${OBJECTDIR}/_ext/921515994/dfmem.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/dfmem.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/dfmem.o.d" -o ${OBJECTDIR}/_ext/921515994/dfmem.o ../imageproc-lib/dfmem.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/gyro.o: ../imageproc-lib/gyro.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/gyro.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/gyro.o.ok ${OBJECTDIR}/_ext/921515994/gyro.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/gyro.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/gyro.o.d" -o ${OBJECTDIR}/_ext/921515994/gyro.o ../imageproc-lib/gyro.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/init_default.o: ../imageproc-lib/init_default.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/init_default.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/init_default.o.ok ${OBJECTDIR}/_ext/921515994/init_default.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/init_default.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/init_default.o.d" -o ${OBJECTDIR}/_ext/921515994/init_default.o ../imageproc-lib/init_default.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/ipspi1.o: ../imageproc-lib/ipspi1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/ipspi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/ipspi1.o.ok ${OBJECTDIR}/_ext/921515994/ipspi1.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/ipspi1.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/ipspi1.o.d" -o ${OBJECTDIR}/_ext/921515994/ipspi1.o ../imageproc-lib/ipspi1.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/larray.o: ../imageproc-lib/larray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/larray.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/larray.o.ok ${OBJECTDIR}/_ext/921515994/larray.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/larray.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/larray.o.d" -o ${OBJECTDIR}/_ext/921515994/larray.o ../imageproc-lib/larray.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/ovcam.o: ../imageproc-lib/ovcam.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/ovcam.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/ovcam.o.ok ${OBJECTDIR}/_ext/921515994/ovcam.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/ovcam.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/ovcam.o.d" -o ${OBJECTDIR}/_ext/921515994/ovcam.o ../imageproc-lib/ovcam.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/payload.o: ../imageproc-lib/payload.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/payload.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/payload.o.ok ${OBJECTDIR}/_ext/921515994/payload.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/payload.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/payload.o.d" -o ${OBJECTDIR}/_ext/921515994/payload.o ../imageproc-lib/payload.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/payload_queue.o: ../imageproc-lib/payload_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/payload_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/payload_queue.o.ok ${OBJECTDIR}/_ext/921515994/payload_queue.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/payload_queue.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/payload_queue.o.d" -o ${OBJECTDIR}/_ext/921515994/payload_queue.o ../imageproc-lib/payload_queue.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/quat.o: ../imageproc-lib/quat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/quat.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/quat.o.ok ${OBJECTDIR}/_ext/921515994/quat.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/quat.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/quat.o.d" -o ${OBJECTDIR}/_ext/921515994/quat.o ../imageproc-lib/quat.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/queue.o: ../imageproc-lib/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/queue.o.ok ${OBJECTDIR}/_ext/921515994/queue.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/queue.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/queue.o.d" -o ${OBJECTDIR}/_ext/921515994/queue.o ../imageproc-lib/queue.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/wii.o: ../imageproc-lib/wii.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/wii.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/wii.o.ok ${OBJECTDIR}/_ext/921515994/wii.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/wii.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/wii.o.d" -o ${OBJECTDIR}/_ext/921515994/wii.o ../imageproc-lib/wii.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/xl.o: ../imageproc-lib/xl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/xl.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/xl.o.ok ${OBJECTDIR}/_ext/921515994/xl.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/xl.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/xl.o.d" -o ${OBJECTDIR}/_ext/921515994/xl.o ../imageproc-lib/xl.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/libqw.o: ../imageproc-lib/libqw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/libqw.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/libqw.o.ok ${OBJECTDIR}/_ext/921515994/libqw.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/libqw.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/libqw.o.d" -o ${OBJECTDIR}/_ext/921515994/libqw.o ../imageproc-lib/libqw.c  -fast-math
	
${OBJECTDIR}/src/cmd.o: src/cmd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/cmd.o.d 
	@${RM} ${OBJECTDIR}/src/cmd.o.ok ${OBJECTDIR}/src/cmd.o.err 
	@${FIXDEPS} "${OBJECTDIR}/src/cmd.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/src/cmd.o.d" -o ${OBJECTDIR}/src/cmd.o src/cmd.c  -fast-math
	
${OBJECTDIR}/src/main.o: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o.ok ${OBJECTDIR}/src/main.o.err 
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c  -fast-math
	
${OBJECTDIR}/src/motor_ctrl.o: src/motor_ctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/motor_ctrl.o.d 
	@${RM} ${OBJECTDIR}/src/motor_ctrl.o.ok ${OBJECTDIR}/src/motor_ctrl.o.err 
	@${FIXDEPS} "${OBJECTDIR}/src/motor_ctrl.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/src/motor_ctrl.o.d" -o ${OBJECTDIR}/src/motor_ctrl.o src/motor_ctrl.c  -fast-math
	
${OBJECTDIR}/src/sma.o: src/sma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/sma.o.d 
	@${RM} ${OBJECTDIR}/src/sma.o.ok ${OBJECTDIR}/src/sma.o.err 
	@${FIXDEPS} "${OBJECTDIR}/src/sma.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/src/sma.o.d" -o ${OBJECTDIR}/src/sma.o src/sma.c  -fast-math
	
${OBJECTDIR}/src/statetransition.o: src/statetransition.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/statetransition.o.d 
	@${RM} ${OBJECTDIR}/src/statetransition.o.ok ${OBJECTDIR}/src/statetransition.o.err 
	@${FIXDEPS} "${OBJECTDIR}/src/statetransition.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/src/statetransition.o.d" -o ${OBJECTDIR}/src/statetransition.o src/statetransition.c  -fast-math
	
${OBJECTDIR}/src/attitude_q.o: src/attitude_q.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/attitude_q.o.d 
	@${RM} ${OBJECTDIR}/src/attitude_q.o.ok ${OBJECTDIR}/src/attitude_q.o.err 
	@${FIXDEPS} "${OBJECTDIR}/src/attitude_q.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/src/attitude_q.o.d" -o ${OBJECTDIR}/src/attitude_q.o src/attitude_q.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/sclock.o: ../imageproc-lib/sclock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/sclock.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/sclock.o.ok ${OBJECTDIR}/_ext/921515994/sclock.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/sclock.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/sclock.o.d" -o ${OBJECTDIR}/_ext/921515994/sclock.o ../imageproc-lib/sclock.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/radio.o: ../imageproc-lib/radio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/radio.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/radio.o.ok ${OBJECTDIR}/_ext/921515994/radio.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/radio.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/radio.o.d" -o ${OBJECTDIR}/_ext/921515994/radio.o ../imageproc-lib/radio.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/mac_packet.o: ../imageproc-lib/mac_packet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/mac_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/mac_packet.o.ok ${OBJECTDIR}/_ext/921515994/mac_packet.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/mac_packet.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/mac_packet.o.d" -o ${OBJECTDIR}/_ext/921515994/mac_packet.o ../imageproc-lib/mac_packet.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/carray.o: ../imageproc-lib/carray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/carray.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/carray.o.ok ${OBJECTDIR}/_ext/921515994/carray.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/carray.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/carray.o.d" -o ${OBJECTDIR}/_ext/921515994/carray.o ../imageproc-lib/carray.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/ppool.o: ../imageproc-lib/ppool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/ppool.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/ppool.o.ok ${OBJECTDIR}/_ext/921515994/ppool.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/ppool.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/ppool.o.d" -o ${OBJECTDIR}/_ext/921515994/ppool.o ../imageproc-lib/ppool.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/at86rf231_driver.o: ../imageproc-lib/at86rf231_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/at86rf231_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/at86rf231_driver.o.ok ${OBJECTDIR}/_ext/921515994/at86rf231_driver.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/at86rf231_driver.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/at86rf231_driver.o.d" -o ${OBJECTDIR}/_ext/921515994/at86rf231_driver.o ../imageproc-lib/at86rf231_driver.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/spi_controller.o: ../imageproc-lib/spi_controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/spi_controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/spi_controller.o.ok ${OBJECTDIR}/_ext/921515994/spi_controller.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/spi_controller.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/spi_controller.o.d" -o ${OBJECTDIR}/_ext/921515994/spi_controller.o ../imageproc-lib/spi_controller.c  -fast-math
	
else
${OBJECTDIR}/_ext/921515994/battery.o: ../imageproc-lib/battery.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/battery.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/battery.o.ok ${OBJECTDIR}/_ext/921515994/battery.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/battery.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/battery.o.d" -o ${OBJECTDIR}/_ext/921515994/battery.o ../imageproc-lib/battery.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/dfmem.o: ../imageproc-lib/dfmem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/dfmem.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/dfmem.o.ok ${OBJECTDIR}/_ext/921515994/dfmem.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/dfmem.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/dfmem.o.d" -o ${OBJECTDIR}/_ext/921515994/dfmem.o ../imageproc-lib/dfmem.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/gyro.o: ../imageproc-lib/gyro.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/gyro.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/gyro.o.ok ${OBJECTDIR}/_ext/921515994/gyro.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/gyro.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/gyro.o.d" -o ${OBJECTDIR}/_ext/921515994/gyro.o ../imageproc-lib/gyro.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/init_default.o: ../imageproc-lib/init_default.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/init_default.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/init_default.o.ok ${OBJECTDIR}/_ext/921515994/init_default.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/init_default.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/init_default.o.d" -o ${OBJECTDIR}/_ext/921515994/init_default.o ../imageproc-lib/init_default.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/ipspi1.o: ../imageproc-lib/ipspi1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/ipspi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/ipspi1.o.ok ${OBJECTDIR}/_ext/921515994/ipspi1.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/ipspi1.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/ipspi1.o.d" -o ${OBJECTDIR}/_ext/921515994/ipspi1.o ../imageproc-lib/ipspi1.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/larray.o: ../imageproc-lib/larray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/larray.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/larray.o.ok ${OBJECTDIR}/_ext/921515994/larray.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/larray.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/larray.o.d" -o ${OBJECTDIR}/_ext/921515994/larray.o ../imageproc-lib/larray.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/ovcam.o: ../imageproc-lib/ovcam.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/ovcam.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/ovcam.o.ok ${OBJECTDIR}/_ext/921515994/ovcam.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/ovcam.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/ovcam.o.d" -o ${OBJECTDIR}/_ext/921515994/ovcam.o ../imageproc-lib/ovcam.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/payload.o: ../imageproc-lib/payload.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/payload.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/payload.o.ok ${OBJECTDIR}/_ext/921515994/payload.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/payload.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/payload.o.d" -o ${OBJECTDIR}/_ext/921515994/payload.o ../imageproc-lib/payload.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/payload_queue.o: ../imageproc-lib/payload_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/payload_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/payload_queue.o.ok ${OBJECTDIR}/_ext/921515994/payload_queue.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/payload_queue.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/payload_queue.o.d" -o ${OBJECTDIR}/_ext/921515994/payload_queue.o ../imageproc-lib/payload_queue.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/quat.o: ../imageproc-lib/quat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/quat.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/quat.o.ok ${OBJECTDIR}/_ext/921515994/quat.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/quat.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/quat.o.d" -o ${OBJECTDIR}/_ext/921515994/quat.o ../imageproc-lib/quat.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/queue.o: ../imageproc-lib/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/queue.o.ok ${OBJECTDIR}/_ext/921515994/queue.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/queue.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/queue.o.d" -o ${OBJECTDIR}/_ext/921515994/queue.o ../imageproc-lib/queue.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/wii.o: ../imageproc-lib/wii.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/wii.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/wii.o.ok ${OBJECTDIR}/_ext/921515994/wii.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/wii.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/wii.o.d" -o ${OBJECTDIR}/_ext/921515994/wii.o ../imageproc-lib/wii.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/xl.o: ../imageproc-lib/xl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/xl.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/xl.o.ok ${OBJECTDIR}/_ext/921515994/xl.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/xl.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/xl.o.d" -o ${OBJECTDIR}/_ext/921515994/xl.o ../imageproc-lib/xl.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/libqw.o: ../imageproc-lib/libqw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/libqw.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/libqw.o.ok ${OBJECTDIR}/_ext/921515994/libqw.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/libqw.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/libqw.o.d" -o ${OBJECTDIR}/_ext/921515994/libqw.o ../imageproc-lib/libqw.c  -fast-math
	
${OBJECTDIR}/src/cmd.o: src/cmd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/cmd.o.d 
	@${RM} ${OBJECTDIR}/src/cmd.o.ok ${OBJECTDIR}/src/cmd.o.err 
	@${FIXDEPS} "${OBJECTDIR}/src/cmd.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/src/cmd.o.d" -o ${OBJECTDIR}/src/cmd.o src/cmd.c  -fast-math
	
${OBJECTDIR}/src/main.o: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o.ok ${OBJECTDIR}/src/main.o.err 
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c  -fast-math
	
${OBJECTDIR}/src/motor_ctrl.o: src/motor_ctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/motor_ctrl.o.d 
	@${RM} ${OBJECTDIR}/src/motor_ctrl.o.ok ${OBJECTDIR}/src/motor_ctrl.o.err 
	@${FIXDEPS} "${OBJECTDIR}/src/motor_ctrl.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/src/motor_ctrl.o.d" -o ${OBJECTDIR}/src/motor_ctrl.o src/motor_ctrl.c  -fast-math
	
${OBJECTDIR}/src/sma.o: src/sma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/sma.o.d 
	@${RM} ${OBJECTDIR}/src/sma.o.ok ${OBJECTDIR}/src/sma.o.err 
	@${FIXDEPS} "${OBJECTDIR}/src/sma.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/src/sma.o.d" -o ${OBJECTDIR}/src/sma.o src/sma.c  -fast-math
	
${OBJECTDIR}/src/statetransition.o: src/statetransition.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/statetransition.o.d 
	@${RM} ${OBJECTDIR}/src/statetransition.o.ok ${OBJECTDIR}/src/statetransition.o.err 
	@${FIXDEPS} "${OBJECTDIR}/src/statetransition.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/src/statetransition.o.d" -o ${OBJECTDIR}/src/statetransition.o src/statetransition.c  -fast-math
	
${OBJECTDIR}/src/attitude_q.o: src/attitude_q.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/attitude_q.o.d 
	@${RM} ${OBJECTDIR}/src/attitude_q.o.ok ${OBJECTDIR}/src/attitude_q.o.err 
	@${FIXDEPS} "${OBJECTDIR}/src/attitude_q.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/src/attitude_q.o.d" -o ${OBJECTDIR}/src/attitude_q.o src/attitude_q.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/sclock.o: ../imageproc-lib/sclock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/sclock.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/sclock.o.ok ${OBJECTDIR}/_ext/921515994/sclock.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/sclock.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/sclock.o.d" -o ${OBJECTDIR}/_ext/921515994/sclock.o ../imageproc-lib/sclock.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/radio.o: ../imageproc-lib/radio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/radio.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/radio.o.ok ${OBJECTDIR}/_ext/921515994/radio.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/radio.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/radio.o.d" -o ${OBJECTDIR}/_ext/921515994/radio.o ../imageproc-lib/radio.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/mac_packet.o: ../imageproc-lib/mac_packet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/mac_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/mac_packet.o.ok ${OBJECTDIR}/_ext/921515994/mac_packet.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/mac_packet.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/mac_packet.o.d" -o ${OBJECTDIR}/_ext/921515994/mac_packet.o ../imageproc-lib/mac_packet.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/carray.o: ../imageproc-lib/carray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/carray.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/carray.o.ok ${OBJECTDIR}/_ext/921515994/carray.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/carray.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/carray.o.d" -o ${OBJECTDIR}/_ext/921515994/carray.o ../imageproc-lib/carray.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/ppool.o: ../imageproc-lib/ppool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/ppool.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/ppool.o.ok ${OBJECTDIR}/_ext/921515994/ppool.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/ppool.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/ppool.o.d" -o ${OBJECTDIR}/_ext/921515994/ppool.o ../imageproc-lib/ppool.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/at86rf231_driver.o: ../imageproc-lib/at86rf231_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/at86rf231_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/at86rf231_driver.o.ok ${OBJECTDIR}/_ext/921515994/at86rf231_driver.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/at86rf231_driver.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/at86rf231_driver.o.d" -o ${OBJECTDIR}/_ext/921515994/at86rf231_driver.o ../imageproc-lib/at86rf231_driver.c  -fast-math
	
${OBJECTDIR}/_ext/921515994/spi_controller.o: ../imageproc-lib/spi_controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/921515994 
	@${RM} ${OBJECTDIR}/_ext/921515994/spi_controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/921515994/spi_controller.o.ok ${OBJECTDIR}/_ext/921515994/spi_controller.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/921515994/spi_controller.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -D__IMAGEPROC2 -D__BOOTLOAD -D__DFMEM_8MBIT -I"/Users/ahoover/Research/embedded/imageproc-lib" -I"/Users/ahoover/Research/embedded/dynaroach/src" -mlarge-code -MMD -MF "${OBJECTDIR}/_ext/921515994/spi_controller.o.d" -o ${OBJECTDIR}/_ext/921515994/spi_controller.o ../imageproc-lib/spi_controller.c  -fast-math
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/dynaroach.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=elf -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -o dist/${CND_CONF}/${IMAGE_TYPE}/dynaroach.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}   /Applications/microchip/mplabc30/v3.30c/lib/libq-elf.a /Applications/microchip/mplabc30/v3.30c/lib/libq-dsp-elf.a    -fast-math -Wl,--defsym=__MPLAB_BUILD=1,--heap=8192$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1
else
dist/${CND_CONF}/${IMAGE_TYPE}/dynaroach.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=elf -mcpu=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/dynaroach.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}   /Applications/microchip/mplabc30/v3.30c/lib/libq-elf.a /Applications/microchip/mplabc30/v3.30c/lib/libq-dsp-elf.a    -fast-math -Wl,--defsym=__MPLAB_BUILD=1,--heap=8192$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION)
	${MP_CC_DIR}/pic30-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/dynaroach.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -omf=elf
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
