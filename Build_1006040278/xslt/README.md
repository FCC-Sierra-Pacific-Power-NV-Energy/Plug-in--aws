# XSLT Transformation Step Plugin 

This plugin is primarily designed to transform the output of Ant Junit tests in to html suitable for transmission through email

## XSLT Step
* Transforms the supplied input with a XSL stylesheet to the supplied output
* Has 4 inputs
   * Input field for input (can be a file or data piped in via variable)
   * Input field for output (a path to a file on disk or if omitted stored as step output for access by other steps)
   * Input field for stylesheet (a path to a stylesheet on disk or if omitted `junit-noframes.xsl` from Apache Ant is used)
   * Text area for key=value pairs on parameters to pass in to the XSL stylesheet. 
    * Each set of the key=value pairs should be on a new line
* Step output `#{steps[*].output}` is set to the filename if an output file was specified or to the transformed output if a filename was omitted.
* Uses the built-in Xalan XSLT support in the JDK

## Logging
Add the following named loggers to the Log4j configuration file located in *"\Embotics\vCommander\tomcat\common\classes\log4j2.xml"* to update the logging level.
        
+ **General Utilities**
    + Loggers:
      + `<Logger level="DEBUG" name="plugin.xslt"/>`

