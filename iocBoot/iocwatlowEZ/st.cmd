#!../../bin/linux-x86_64/watlowEZ

## You may have to change watlowEZ to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/watlowEZ.dbd"
watlowEZ_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure("ETH1","chiller-bcal-ds:502",0,0,1)
drvAsynIPPortConfigure("ETH2","chiller-bcal-us:502",0,0,1)

# modbusInterposeConfig(portName, linkType, timeoutMsec, writeDelayMsec)
modbusInterposeConfig("ETH1",0,5000,0)
modbusInterposeConfig("ETH2",0,5000,0)

# Debugging...
#asynSetTraceMask("ETH1",0,9)
#asynSetTraceIOMask("ETH1",0,2)

#drvModbusAsynConfigure("portName", "tcpPortName", slaveAddress, modbusFunction,
#                       modbusStartAddress, modbusLength, dataType, pollMsec,
#                       "plcType")

# 32-bit integers (Function code = 3)
drvModbusAsynConfigure("DS_360_IN",  "ETH1", 1, 3, 360,  9, 0, 1000, "WATLOW")
drvModbusAsynConfigure("DS_2490_IN", "ETH1", 1, 3, 2490, 1, 0, 1000, "WATLOW")

drvModbusAsynConfigure("US_360_IN",  "ETH2", 1, 3, 360,  9, 0, 1000, "WATLOW")
drvModbusAsynConfigure("US_2490_IN", "ETH2", 1, 3, 2490, 1, 0, 1000, "WATLOW")


# Load records
dbLoadTemplate("db/watlow.substitutions")

cd ${TOP}/iocBoot/${IOC}

iocInit

