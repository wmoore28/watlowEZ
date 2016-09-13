TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = watlowEZ
# watlowEZ.dbd will be created and installed
DBD += watlowEZ.dbd

# watlowEZ.dbd will be made up from these files:
watlowEZ_DBD += base.dbd
watlowEZ_DBD += drvAsynIPPort.dbd
watlowEZ_DBD += modbusSupport.dbd
watlowEZ_DBD += asyn.dbd

# Add all the support libraries needed by this IOC
watlowEZ_LIBS += modbus
watlowEZ_LIBS += asyn

# watlowEZ_registerRecordDeviceDriver.cpp derives from watlowEZ.dbd
watlowEZ_SRCS += watlowEZ_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
watlowEZ_SRCS_DEFAULT += watlowEZMain.cpp
watlowEZ_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#watlowEZ_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
watlowEZ_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

