# Frequently asked questions

## What is required to use z390 to assemble, link, and execute programs on Windows or Linux?

See [Installation](../getting_started/install.md) on how to install z390. Then check out the [Quickstarts](../getting_started/quickstart.md) for some 

## How do I verify that the latest z390 release is installed?
-- remove

Double click on the z390 desktop icon to start the GUI interface
Enter the command "IVP" to run z390 installation verification program which should display version and indicate if optional MVS 3.8 macro library or z390 regression tests are installed.  If return code is greater than 4 or the z390 release is older than the latest release listed on www.z390.org, uninstall old versions and then install latest z390 release.

## How do I run the Hello World demo and view results?

Double click the z390 desktop icon to start z390 GUI interface
Enter the command "ASMLG demo\DEMO" to assemble, link, and execute the demo program demo\DEMO.MLC using batch command ASMLG.BAT
The execution step should display the "HELLO WORLD" on the console
To view the console log file, enter command "edit demo\DEMO.LOG", close editor
To view the assembler listing enter command "edit demo\DEMO.PRN", close editor
To view the linker listing enter command "edit demo\DEMO.LST", close editor

## How do I rerun the demo with instruction execution trace?

Enter the command "EXEC demo\DEMO trace con
The instruction execution trace should appear on console and TRE trace file
To view the trace file enter command "edit demo\DEMO.TRE", close editor

## What are the best references for more information on z390 and mainframe assembler?

z390 User Guide (See appendix for listings of demo "Hello World" source files)
z390 Additional documentation links
IBM z/Architecture and z/OS reference links

## Where can I find more program examples?

The z390\demo directory contains several example programs.

Run the command RTDEMO to assemble, link, and execute them all.

Edit the file RTDEMO.BAT and the files it calls to see how batch command work

For a lot more examples, download and install the RT.zip file into z390 directory.  Then view all the programs in z390\RT\TEST and run the command RT.BAT to assemble, link, and execute them all.

## What macros are supported?

The install directory z390\mac contains all the currently supported MVS compatible macros which generate svc calls supported by the z390 runtime emulator.  See the z390 documentation links above for additional documentation on these macros.  Requests for additional macro support are welcome.

There is an optional download file named MVS.zip which contains the public domain MVS 3.8 macro library in ASCII text format.  These macros can be used with z390 to assemble mainframe programs targeted for execution on MVS or z/OS mainframe systems.  You could even upload the binary OBJ files generated for linking and executing them on a mainframe system.  These macros also provide useful examples of macro assembler code.  However these macros do not generated svc code compatible with the current z390 runtime.  

For those interested in actually running MVS 3.8 code on Windows, I recommend the Hercules emulator.  The Hercules emulator will also run the mainframe assembler that comes with MVS 3.8, but that assembler is quite dated and does not support new z series opcodes for such features as DFP.  Hercules is also limited to 16MB regions.

Note IBM z/OS and other current operating system product macros are only available from IBM under license.  z390 is targeted to be HLASM compatible and any bugs found by users assembling these macros should be submitted for RPI correction.

## How do I run the regression tests?

You can enter command rt\RTDEMO to run all the demos in z390\demo directory.  The output of the regression test is in z390\demo\dif consisting of text files showing the differences between the generated demo files and the saved files from last verified regression test.  The files are listed in descending order by size to quickly any spot files with differences which can be due to different software versions, different options, bugs, etc.

You can also run rt\RTCICS for regression tests of CICS.

You can download and unzip the optional MVS.zip macros into z390 directory and then run rt\RTMVS regression tests using the MVS macros.

You can download and unzip the optional rt\RT.zip tests into z390 directory and then run the RTTEST regression test which takes 5 minutes or more to assembler and run over a 100 different test programs for the macro processor, assembler, linker, and emulator.  You can also run RT.BAT which runs all of the above regression tests.

## How do I quickly identify the macros and copybooks required to assemble a mainframe assembler source program with z390?

When you attempt to assembly any program with the command ASM, ASML, or ASMLG and there are missing macro or copybook references, the assembler will automatically turn on the ERRSUM option (z390 v1.3.07d or later).  This option lists the missing macro and copybook names.  Once all the missing files have been found by adding the necessary directory lists to SYSMAC(...) and SYSCPY(..) parms, then the option ERRSUM can be used again to list any remaining undefined symbol references which often indicate a missing macro or copybook reference or a macro library release level problem.

## How do I search for the errors in a PRN assembly listing file?

Search for the character sequence "390E" which is in both "MZ390E" and "AZ390E" error messages.

## What are the primary uses of the z390 portable mainframe macro assembler and emulator?

Enable developers to assemble, link, and execute mainframe assembler programs on any J2SE platform including PC laptops and home computers.
Simplify the migration of applications which include mainframe assembler.
Provide a useful learning tool for students learning mainframe assembler or Java.

## Why is z390 open source?

z390 is an open source project with free downloads including both the Java source code and the  executable z390.jar file.  Downloads are available in InstallShield format for Windows XP and Vista and in file zip format for Ubuntu and other Linux distributions.  Open source provides access at no cost and promotes a continuing cooperative effort to enhance the tool and correct any bugs found.  Open source also ensures users that they can support the tool and customize the tool to their own needs as required.  See the Automated Software Tools statement of direction for z390.

## How is the Java source code maintained?

The Eclipse open source Integrated Development Environment (IDE) tool is used to edit and unit test the Java source code in z390.  Eclipse includes an excellent source level debugger.
Once changes to individual Java source programs have been unit tested, z390 regression tests are run to verify that nothing has been broken.  The regression tests are continually updated to add new tests.

# What is required to run the z390 portable mainframe macro assembler and emulator?

Windows XP, Windows Vista, and Linux are now supported:
Windows XP requires at least SP2 update.
Recommend at least 1.0 GHZ processor and 3.0 GHZ processor is better  for performance.  See benchmark statistics here.
Recommend at least 512 MB memory.  mz390 macro assembler defaults to 100 MB, and z390 defaults to 1 MB of z390 main memory with options to increase memory to physical limit using 24 or 32 bit addressing mode.  AMODE 64 will be a future enhancement for 64 bit platforms.
Sun Microsystems Java 2 Runtime version J2RE 1.5.0+.  Note only the runtime is required.  The JDK and J2EE include the J2RE runtime.  If you install z390 and receive the java runtime error message saying major/minor conflict 49.0 it usually indicates there is an earlier version of J2RE installed on your PC that may be conflicting with J2SE 1.5 runtime.  Remove the older versions such as 1.4.2 and try it again.

You can submit issues on GitHub for both problems and enhancements.

There is a Regression Test Directory with constantly growing number of regression tests included in the z390 install.  Issue command RT to run all the regression tests..  These programs also serve as useful demo programs for what functions and features are supported by z390.  For example there are source programs to test sequential and random file access, tests for all the instructions, and tests for new support for multiple Windows command tasks under assembler program control.

## What are the limitations of z390?

z390 uses the J2RE Java Virtual Machine emulator to interpret mainframe instructions.  As a result z390 will never execute instructions as fast as a real mainframe.  However, on a 3 GHZ Intel Dual Core chip, z390 can execute several million mainframe instructions per second which is sufficient for most development and production applications which are typically I/O bound versus CPU bound.

Specific limitations of the z390 components are listed [here]().

## Who is using z390?

The z390 user group now has about 300 members and many have contributed to the project by submitting enhancement and bug fix requests.  Several major contributors include Melvyn Maltz who has contributed a z390 benchmark instruction timing tool plus additional documentation. 

Martin Ward has contributed z390 Linux mods to enable running both the z390 GUI and command line interface on Linux.

## What is the target level of z390 support and how can I learn more about z390 assembler and the mainframe

z390 is targeted to be compatible with IBM High Level Assembler  Note some of the less frequently used features may not yet supported yet and pull requests to add missing components are welcome.

z390 is targeted to support problem state instructions as defined in IBM z/Architecture Principles Of Operations Manual.

z390 is targeted to support IBM MVS, OS/390, and z/OS common system macros at the macro interface level.  

A subset of the most commonly used macros are included and support assembly, link, and execution of mainframe assembler application programs.  Requests for required additions are welcome.  

In addition the public domain MVS 3.8J system macros are included in a separate library for use in assembling MVS compatible programs to be executed using the Hercules MVS 3.8J emulator. 

## Where are additional references for learning about mainframe assembler and z390?
                
See [z390 Reference Links](reference.md)

## My program has aborted, how do I start to debug the problem?

The simplest approach is to rerun the program with option TRACE and then view the trace output file type ".TRE" which shows every instruction executed up to the point of failure along with register and storage operand field values.

If additional information is required at the point of failure, rerun the program with option TEST to invoke the interactive debug facility and use the command T or G with opcode name, address, or count to run up to the point of failure.  Then use L command to display additional registers and memory areas. 

## What are some of the most common Java coding errors to check for when modifying z390 source code?

Remember to put break after each case in a switch otherwise it drops through which can cause very strange results.

Remember Java subscripts start at 0 and end at length of array -1 versus macro assembler arrays that start at 1 and end at length of array.

## How can I allocate more than the default 1 MB memory for use by assembler program?

The MEM(mb) option can be specified on ez390 command to allocate more memory.  For example, MEM(32) will allocate 16 MB below the line and 16 MB above the line.  

The lz390 linker supports both AMODE and RMODE options to create 390 load module that loads above or below the line and runs in either 24 bit or 31 bit mode. 

See regression test TESTOBJ2.MLC run with options AMODE31 RMODE31 MEM(49) to link 32 MB single CSECT program which loads and runs above the line.  The default is AMODE31 RMODE24 MEM(1).

The maximum memory that can be allocated is limited by physical memory and the memory required by other Windows applications and other J2RE applications.  If you want to allocate more that the default maximum allowed by J2SE (about 50 MB on 1 GB system), you can add the J2RE option -Xmx option.  For example, -Xmx500000000 will allow up to 500 MB to be allocated to J2RE.  Be careful to leave enough memory for both Windows and other J2RE applications.  Note the mz390.bat command processor allocates 100 MB for large assembly programs.  The largest seen up to v1.2 has 450 macros with 45,000 macro calls.  This assembly used 88 MB and ran 24 seconds.

See useful HP reference for more information on memory management.

## How can I get more information on where my macro assembler code went wrong?

Use the TRACEP option to generate a macro pseudo code trace on file TRM.  This trice will show the value of every macro variable in every AIF, SETA, SETB, and SETC statement as well the source lines for both conditional macro code and generated BAL lines.  Note this trace file can be very large so it is recommended to create a cut down test version of failing code when possible.
Use the TRACEM option to generated TRM trace file with just the conditional macro code lines and generated BAL lines processing during execution of macro assembler.

## What are the differences between Hercules and z390?

Hercules is a software implementation of the System/370, ESA/390 and z/Architecture mainframe architectures. Hercules runs under Windows and Linux.  Hercules requires an operating system to emulate in order to assemble and execute assembler programs. The only public domain OS type operating system available is MVS 3.8.  When emulating MVS 3,8, Hercules emulates physical I/O supervisor instructions such as Start I/O (SIO) to execute channel programs which access files in virtual volumes.  

z390 emulates problem state instructions and maps Supervisor Calls (SVC) into calls to Java routines which perform I/O and other supervisor functions using the J2RE runtime to access any files on the host system.

Hercules using MVS 3.8 has 24 bit limit of 16 MB for each program address space.  

z390 supports AMODE 24 and 31 bits with memory spaces up to the physical limit of the J2RE host processor.

Hercules using MVS 3.8 includes mainframe assembler running in emulation with EBCDIC source files.  

z390 includes a macro assembler which is compatible with the current HLASM V5 and reads ASCII source files. z390 continues to evolve to include the latest z/Architecture instruction support.

## What is the purpose of the -Xrs Java runtime option?

This option turns off J2SE runtime internal error signal handling for CTRL-BRK allowing user to successfully stop a z390 program that is running in a loop or taking too long.  Without the option J2SE runtime attempts to handle CTRL-BRK and does not stop the process requiring user to abort the command line or GUI dialog to restart.  For more information on -Xrs for multiple OS's see this.

## How do I debug a memory leak in Java?

In order to debug a reported memory leak in long running z390 CICS server program I added the Java option -verbose:gc to the exec command.  This option generates trace on console showing the results of periodic garbage collection done by Java runtime.  Initially this trace showed memory usage growing by 18k every few seconds.  After tracing through server code, I found and fixed recursive TN3270 screen update loop. After correcting the problem, the trace showed constant memory usage.

## How do I prevent Windows from poping up "File" menu when the PF10 key is pressed (For example start IE7 and press PF10 to see the "File" menu show up highlighted)?

In the z390.java or gz390.java open source code the following code has been added to the KeyPressed event handler:
    
    if (keyCode == KeyEvent.VK_F10){
        e.consume();
    }

This code consumes the Key pressed event for PF10 preventing Windows default action.

## How do I prevent large macro assembly process from stalling where CPU usage goes to 100% and the process slows down to a crawl due to excessive garbage collection being repeated by Java runtime?

Increase the maximum memory allocated by Java using optional parameter which can be added to the mz390 command.  Add -Xmx100000k parameter after the -Xrs paramter.  This increases the Java heap space from the system default to 100 MB which worked for the largest macro process I've seen so far.  

The system default is the preferred setting in order to prevent overcommitting the system and possibly stalling other tasks if too many are running at once.

## If I need multiple Java versions on my system, how do I get z390 to use a specific runtime?

TODO Add the explicit path to the java executable.exe in the GUI icon start up and in all the batch commands such as z390.bat, asmlg.bat, exe.bat, etc.


