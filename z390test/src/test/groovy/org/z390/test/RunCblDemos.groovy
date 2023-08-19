package org.z390.test

import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions

import java.util.regex.Pattern

class RunCblDemos extends z390Test {

    RunCblDemos() {
        printOutput = true
    } 

    @Test
    void test_COBOL_HELLO() {
        int rc = this.cblclg(basePath("zcobol", "demo", "HELLO"))
        this.printOutput()
        assert rc == 0
    }

    @Test
    void test_COBOL_DATETIME() {
        int rc = this.cblclg(basePath("zcobol", "demo", "DATETIME"))
        this.printOutput()
        assert rc == 0
    }

    @Test
    void test_COBOL_POWERS() {
        int rc = this.cblclg(basePath("zcobol", "demo", "POWERS"))
        this.printOutput()
        assert rc == 0
    }

    @Test()
    void test_COBOL_COPYFILE() {
        // TODO - Remove filenames from source - use vars
        // load the original source file
        loadFile(basePath('zcobol', 'demo', 'COPYFILE.CBL'), 'source')
        String source = fileData['source'].toString()

        // update the bat/bash file locations in source
        String fileOld = Pattern.quote("ASSIGN TO 'zcobol\\demo\\COPYFILE")
        var fileNew = "ASSIGN TO '${basePathRelative('zcobol','demo', 'COPYFILE')}".replaceAll("[\\W|_]", /\\$0/)
        source = source.replaceAll(fileOld, fileNew)

        // Create temp source file containing updated file locations
        String sourceFilename = createTempFile('COPYFILE.CBL', source, false)
        this.fileData["modified_source"] = source

        // Now run the program
        int rc = this.cblclg(sourceFilename)
        this.printOutput()
        var thrown = Assertions.assertThrows(AssertionError.class, () -> {
            assert rc == 0
        })
        println(thrown.getMessage())

    }

    @Test
    void test_COBOL_COMPSUM() {
        int rc = this.cblc(basePath("zcobol", "demo", "COMPSUM"))
        this.printOutput()
        assert rc == 0
        var runOptions = [
                "SYS390(${basePath('zcobol', 'lib')})",
                "SYSMAC(${basePath("mac")})"
        ]
        rc = asmlg(basePath("zcobol", "demo", "CALLCOMP"), *runOptions)
        this.printOutput()
        assert rc == 0
    }
}
