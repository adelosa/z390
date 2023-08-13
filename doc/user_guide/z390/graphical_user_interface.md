# Graphical User Interface

As well as using a command shell, the z390 tools can be accessed as a standalone graphical interactive application named z390.

The z390 main graphical user interface (GUI) interface provides easy to use menu 
commands to assemble, link, and execute macro assembler programs plus command files.

All of the z390 graphical user interfaces attempt to conform to industry standards
including:

* Popup menus – file, edit, options, view, and help
* Scrollable view of entire output log showing results of each command
* Command entry field with keyboard scrolling of prior commands
* Command entry field right click pop-up help menu
* Optional status line to show batch I/O and status information
* Option to change window location, size, and font for accessibility
* Option to submit, monitor, and cancel batch commands from GUI

The menus and basic commands all have mnemonic keystroke equivalents. All
fields including the entire log view have edit cut, copy, and paste support to allow
easy transfer of selected text to and from the clipboard and other Windows
applications.

## Graphical User Interface (GUI) application mode

Double click on the z390 jar or script to startup in the
standalone graphical user interface.

* From a command line, the graphical user interface can be started
using the command script Z390 located in the bat and bash directory.
* Once the GUI interface is started, you can issue commands by
pointing and clicking the menu options or by typing commands on the
command line entry field. 
* The command line field support forward and backward scrolling of 
previous commands entered either way so you can repeat and or modify 
prior commands. 
* The option menu allows you to click on desired default options
* The file menu commands enable you to select files via point and click dialog. 

### Commands

The following commands are supported by the GUI interface:

* ABOUT display summary information about z390 tool
* AMODE31 ON/OFF set amode 24/31 for link cmd
* ASCII toggle between ASCII and EBCDIC mode. The default is EBCDIC. This affects test commands to
display memory and character values used in test commands.
* ASM MLC file assemble MLC source to OBJ object code file
* ASML MLC file assemble and link MLC source to 390 load module file
* ASMLG MLC file assemble, link, and execute 390 load module file
* CD change current directory
* CMD command submit batch command or start/stop batch command mode
    * When in CMD mode, all commands are sent to batch processor
    * To cancel CMD processor, enter CTRL-BREAK once or toggle the CMD mode indicator on view menu on/off.
* Copy - copy selected text to clipboard (GUI right click)
* COMMANDS alphabetical list of all commands
* CON ON/OFF set console output for file cmds
* COPYLOG copy the entire log text to clipboard (GUI only)
* Cut - cut selected text (GUI right click)
* Edit - any file edit source file in separate window
* ERR nn change error limit to nn from 100 default
* EXIT exit z390 after closing all files (also CTRL-BREAK)
* EXEC 390 file execute 390 load module
* FONT size change font size for accessibility
* GUAM ON/OFF set option for GUAM GUI interface dialog
* GUIDE view local optional documentation installed in z390\webdoc otherwise view online docs at www.z390.org TODO
* HELP display help information summary
* JOB command file execute batch job
* LINK obj file link obj file into 390 load module
* LIST ON/OFF set PRN, LST, and/or LOG output for file cmds
* LISTCALL ON/OFF set trace macro calls in BAL file
* LOC x y pixels change location of upper left corner of window
* MAC mlc file expand mlc macro file to bal source file with option NOASM to suppress assembly. This command can be used for text processing applications using AREAD and PUNCH such as LINKLIB\RTGENDIR, LINKLIB\RTGENCMP, and TODO BMK\BMKTIME without theoverhead of running the assembler.
* NOTEPAD start Notepad for use with clipboard data (GUI only) TODO
* PASTE paste clipboard text (GUI right click)
* PERM display current Java security manager permissions TODO
* REL display current release level for OS, Java, and z390
* RMODE31 ON/OFF set rmode 24/31 for link cmd
* SIZE x y pixels change width and height of window
* STATS ON/OFF set statistics for BAL, PRN, LST, and/or LOG file cmds
* STATUS ON/OFF/sec set status line on or off or set log interval sec
* SUPPORT open browser to online support web site
* TEST ON/OFF set prompt for interactive test cmds for EXEC cmd
* TITLE 'text' set GUI title
* TIMEOUT seconds set command timeout seconds or 0 for no limit (default)
* TRACE ON/OFF set trace for ez390 TRE file

Any command not on the above list is assumed to be a batch
command and is passed on to the shell command processor.

### Shell commands

Additional shell commands available in the default install directory
include the following:

* DEMO – run demo.bat command to assemble, link and execute the demo.mlc program which displays “HELLO WORLD”.
* MZ390 – run macro processor to expand MLC to BAL file (called by MAC, ASM, ASML, and ASMLG)
* AZ390 – assemble to read BAL and generate OBJ file (called by ASM, ASML, and ASMLG)
* LZ390 – link OBJ file and create 390 file
* EZ390 – run z390 emulator (called by ASMLG and EXEC) supporting mainframe problem state
  instructions plus svcs for MVS compatible macro functions including QSAM and VSAM file I/O. 
  Note linklib is default last SYS390 directory searched in order to support utilities without 
  requiring path.
* RT – run the following batch regression tests from GUI or command line interface:
    * RTDEMO – run regression test on demo programs
    * RTLINK - run assembly and regression test on linklib utility programs and subroutines.
* RTMVS – run MVS maclib test and demo programs in the optional download directory MVS 
  (unzip z390_MVS.ZIP to z390 install directory from www.z390.org) TODO
* RTTEST – run regression tests on test programs in the optional download directory RT 
  (unzip z390_RT.ZIP to z390 install directory from www.z390.org) TODO
* RTVSAM – run regression test and demos for ESDS, RRDS, and KSDS VSAM files including use of
  REPRO utility to load and unload VSAM files. See online z390 support page for more documentation and list of demos and regression tests including REPRO loads and unloads.
* RTVSE – run regression tests for VSE support using macros which map VSE macro calls into MVS
  compatible z390 runtime macro or svc calls.

### Regression tests

Run the following interactive regression tests from GUI or command line interface:

* RTCICS – start CICS server with 2 local clients and then start remote client 
  (you must edit command to change the IP address of server processor. Use
  command IPCONFIG to find out IP address). Enter
  transaction id GUI6 to run demo CICS application with
  name and address fields plus PF1 help screen.
* RTSOA – run demo of SOA application generator and then run client and server.
* RTGUAM – run interactive GUAM TN3270 demos and
  tests.


## Startup parameters

You can start the z390 GUI interface and specify a startup
command by specifying parameter /sc followed by command. 

For example the command “z390 /sc maximize.ini” will startup the z390
gui interface and execute the commands in file maximize.ini such as:

    LOC 0 0
    SIZE 800 600

The following additional parameters can be passed to z390 on any of
the above startup commands:

* /NP – suppress all permissions to test web version
* /NT – suppress the unique time stamp included in the default
  log file name (By default the unique time stamp insures a log of
  all z390 commands executed are retained for each instance of 
  z390 GUI window, command line, and batch file executions. 
  The log files can be deleted periodically.)
* /RT – regression test suppression of date and time stamps to
  simplify file comparisons
* /SC <file> - startup bat command file to start Windows
  command after switching to interactive Windows command
  mode when running in GUI. This allows front ending any 
  existing Windows interactive command line application with 
  GUI front end supporting scrollable output window etc.

## Environment variables

The following environment variables can be set prior to
startup of z390 to change defaults for editor or other functions:

* Z390ACROBAT=cmd.exe /c Start - default started task
  for processing Acrobat PDF commands
* Z390BROWSER=cmd.exe /c Start - default started task 
  for web browser started by z390 to access www.z390.org 
  online documentation. For Windows Start invokes IE.

For Linux the default is firefox.

* Z390COMMAND=cmd.exe - default batch command 
  processor used by z390 GUI for unknown commands.
  On Windows this is the standard Windows BAT file 
  command processor. For Linux this is a Perl script 
  named cmd.pl which processes Windows compatible 
  BAT command files and performs the same functions.
* Z390EDIT=notepad.exe - default GUI editor started by
  z390 GUI using the EDIT command. For Linux the default is gedit.
* INSTALL= - default z390 install location