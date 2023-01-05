# Initialization of the command
ECHO=`which echo`
MYPROJECT="output"
#SOURCE=`which source`
UNKNOWN_LOGLEVEL="FATAL"
UNKNOWN_LOGLEVEL_ERRORNO="-100"
UNKNOWN_LOGLEVEL_ERRORMSG="Unknown LogLevel Error"
                                                                                                                                            
                                                                                                                                            
#Default Directories
LOG_BASE_DIR=$HOME
#LOG_BASE_DIR="/home/vjsparky"
LOG_DIR="LOGDIR"
DEFAULT_LOG_CONF="Default_Log.conf"
                                                                                                                                            
RUNTIME_LOG_DIR="log"
RUNTIMELOG_BASE_DIR="$LOG_BASE_DIR/$LOG_DIR"
                                                                                                                                            
                                                                                                                                            
# Log framework configuration file
LOG_CONF_FILE="$LOG_BASE_DIR/$LOG_DIR/$DEFAULT_LOG_CONF"
FULLPATH_RUNTIME_LOG_DIR="$RUNTIMELOG_BASE_DIR/$RUNTIME_LOG_DIR"
                                                                                                                                            
$ECHO "Logging Configuration File.........:[$LOG_CONF_FILE]"
$ECHO "Runtime log base dir is ...........:[$RUNTIMELOG_BASE_DIR]"
$ECHO "Running Log Directory File.........:[$FULLPATH_RUNTIME_LOG_DIR]"
                                                                                                                                            
#Default Log Levels
LOG_LEVEL_TRACE=0
LOG_LEVEL_DEBUG=1
LOG_LEVEL_INFO=2
LOG_LEVEL_WARN=3
LOG_LEVEL_ALERT=4
LOG_LEVEL_ERROR=5
LOG_LEVEL_FATAL=6

A_Log_Level=(TRACE DEBUG INFO WARN ALERT ERROR FATAL)
pid=$$
LOG_FILE_TRACE="$MYPROJECT.TRACE.log"
LOG_FILE_DEBUG="$MYPROJECT.DEBUG.log"
LOG_FILE_INFO="$MYPROJECT.INFO.log"
LOG_FILE_WARN="$MYPROJECT.WARN.log"
LOG_FILE_ALERT="$MYPROJECT.ALERT.log"
LOG_FILE_ERROR="$MYPROJECT.ERROR.log"
LOG_FILE_FATAL="$MYPROJECT.FATAL.log"

                                                                                                                                            
LOGGER_FMT="%y-%m-%d %H:%M:%s"
#LOGGER_TIME=`date +$LOGGER_FMT`
LOGGER_TIME=`date +"%y-%m-%d %H:%M:%s"`
LOGGER_LVL_DEFAULT=$LOG_LEVEL_INFO
LOGGER_LVL_MSG_DEFAULT=${A_Log_Level[${LOGGER_LVL_DEFAULT}]}
LOGGER_LVL_MSG_DEFAULT=${A_Log_Level[1]}
                                                                                                                                            
                                                                                                                                            
$ECHO "Logger Time Format .....................:[$LOGGER_FMT]"
$ECHO "Logger Time Value .....................:[$LOGGER_TIME]"
$ECHO "Logger Level Default in Number.....:[$LOGGER_LVL_DEFAULT]"
$ECHO "Logger Level Default in Literal Constant...:[$LOGGER_LVL_MSG_DEFAULT]"
                                                                                                                                            
Log_Level_LowestValue=0
Log_Level_HighestValue=6
                                                                                                                                            
                                                                                                                                            
                                                                                                                                            
Log_Level_Number=$1
Log_Level=${A_Log_Level[${Log_Level_Number}]}
                                                                                                                                            
VALID="^[0-9]+$"
$ECHO "Logger Level......:[$Log_Level_Number]"
$ECHO "Log  Level......:[$Log_Level]"
                                                                                                                                            
                                                                                                                                            
                                                                                                                                            
#if [ $Number_Validation_Path $Log_Level_Number =~ "true"]
if [[ $Log_Level_Number =~ $VALID ]];
 then
   if [[ $Log_Level_Number -ge $Log_Level_LowestValue && $Log_Level_Number -le $Log_Level_HighestValue ]]
   then
     if [[ $Log_Level_Number -ge $LOGGER_LVL_DEFAULT ]]
     then
      case $Log_Level_Number in
                                                                                                                                            
   $LOG_LEVEL_TRACE)
               $ECHO "[$LOGGER_TIME]:[$pid]:[${A_Log_Level[$LOG_LEVEL_TRACE]}]:[$2]">>$FULLPATH_RUNTIME_LOG_DIR/$LOG_FILE_TRACE
               ;;
   $LOG_LEVEL_DEBUG)
               $ECHO "[$LOGGER_TIME]:[$pid]:[${A_Log_Level[$LOG_LEVEL_DEBUG]}]:[$2]">>$FULLPATH_RUNTIME_LOG_DIR/$LOG_FILE_DEBUG
               ;;
   $LOG_LEVEL_INFO)
                                                                                                                                            
               $ECHO "[$LOGGER_TIME]:[$pid]:[${A_Log_Level[$LOG_LEVEL_INFO]}]:[$2]">>$FULLPATH_RUNTIME_LOG_DIR/$LOG_FILE_INFO
               ;;
   $LOG_LEVEL_ALERT)
               $ECHO "[$LOGGER_TIME]:[$pid]:[${A_Log_Level[$LOG_LEVEL_ALERT]}]:[$2]">>$FULLPATH_RUNTIME_LOG_DIR/$LOG_FILE_ALERT
               ;;
   $LOG_LEVEL_WARN)
               $ECHO "[$LOGGER_TIME]:[$pid]:[${A_Log_Level[$LOG_LEVEL_WARN]}]:[$2]">>$FULLPATH_RUNTIME_LOG_DIR/$LOG_FILE_WARN
               ;;
   $LOG_LEVEL_ERROR)
               $ECHO "[$LOGGER_TIME]:[$pid]:[${A_Log_Level[$LOG_LEVEL_ERROR]}]:[$2]">>$FULLPATH_RUNTIME_LOG_DIR/$LOG_FILE_ERROR
               ;;
   $LOG_LEVEL_FATAL)
               $ECHO "[$LOGGER_TIME]:[$pid]:[${A_Log_Level[$LOG_LEVEL_FATAL]}]:[$2]">>$FULLPATH_RUNTIME_LOG_DIR/$LOG_FILE_FATAL
               ;;
                                                                                                                                            
                                                                                                                                            
      esac
    else
     $ECHO  "Entered Number is Less than default Log Level."
      exit
    fi
  else
                                                                                                                                            
$ECHO "[$UNKNOWN_LOGLEVEL]:[$UNKNOWN_LOGLEVEL_ERRORNO]:[$UNKNOWN_LOGLEVEL_ERRORMSG]"
                                                                                                                                            
    $ECHO "Log level number is not in range between 0 to 6"
    exit
    fi
                                                                                                                                            
else
    $ECHO "$Log_Level_Number is not a number"
    exit
fi
                               
echo "Check git upload"