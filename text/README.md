# Text Processing Plug-in Workflow Step Package
# vCommander Supported Build Version 1006050089

This package contains a collection of plug-in workflow steps to manipulate text input.

It can be used in vCommander workflow extension scenarios such as *Running a Kubernetes Best Practices Report*, which can be found on the [Embotics Support Knowledge Base](https://support.embotics.com/support/home). It can also be used outside of vCommander scenarios.

## Changelog

**Version 1.0:** Initial version.

## Plug-in steps in this package
+ JsonPath Extract
+ Text Input/Output
+ RegEx Extract
+ XPath Extract
+ XSLT Transform

### JsonPath Extract

**Purpose:** Extracts text from the provided input using json-path, returning the first matched text as the vCommander variable #{steps['Step Name'].output}.

**Details:** See also: http://goessner.net/articles/JsonPath/

**Inputs:**
- Input field for input (data piped in through a variable)
- Input field for Json-Path expression https://github.com/json-path/JsonPath

### Text Input/Output 

**Purpose:** Creates structured text such as JSON, YAML or XML from the vCommander workflow or service request context, using variable substitution from the given input and stores it as the step's output variable.

**Details:** Use this step to create JSON or XML as a workflow module's output, or to store text data as part of a workflow definition.

**Inputs:**

- Text area for input

### RegEx Extract

**Purpose:** Extracts text from the provided input using a regular expression. 

**Details:** Returns the first captured group as the vCommander variable #{steps['Step Name'].output}.

**Inputs:**

- Input field for input (data piped in through a variable)
- RegEx expression https://docs.oracle.com/javase/8/docs/api/java/util/regex/Pattern.html

### XPath Extract

**Purpose:** Extracts text from the provided input using XPath.

**Details:** Outputs the first matched text as #{steps['Step Name'].output}.

**Inputs:**

- Input field for input (data piped in through a variable)
- XPath expression https://www.w3schools.com/xml/xpath_syntax.asp

### XSLT Transform

**Purpose:** Primarily designed to transform the output of Ant Junit tests into HTML, suitable for transmission through email.

**Details:** 

- Transforms the supplied input with a XSL stylesheet to the supplied output
- Step output `#{steps[*].output}` is set to the filename, if an output file was specified, or to the transformed output, if an output filename was not specified.
- Uses the built-in Xalan XSLT support in the JDK.

**Inputs:**

- Input field for step input (can be a file or data piped in through a variable)
- Input field for step output (a path to a file on disk or if omitted stored as step output for access by other steps)
- Input field for stylesheet (a path to a stylesheet on disk; if not specified, `junit-noframes-emb.xsl` from Apache Ant is used) 
- Text area for key=value pairs on parameters to pass in to the XSL stylesheet. Each key=value pair should be on a new line.

## Installation

Plug-in workflow steps are supported with vCommander release 7.0 and higher. 

See [Adding plug-in workflow steps](http://docs.embotics.com/vCommander/Using-Plug-In-WF-Steps.htm#Adding) in the vCommander documentation to learn how to install this package. 

## Return codes

### Generic return codes

- 0 successful match (RegEx, XPath, JSONPath)
- 1 no match (RegEx, XPath, JSONPath)
- 2 error reading input or parsing expression

## Logging
To change the logging level, add the following named loggers to the Log4j configuration file located at: 

<vcommander-install>\tomcat\common\classes\log4j2.xml 

+ **JsonPath Extract** 
    + Loggers:
      + `<Logger level="DEBUG" name="plugin.text.jsonpath"/>`
      
+ **Text Input/Output** 
    + Loggers:
      + `<Logger level="DEBUG" name="plugin.text.output"/>`
      
+ **RegEx Extract** 
    + Loggers:
      + `<Logger level="DEBUG" name="plugin.text.regex"/>`
      
+ **XPath Extract** 
    + Loggers:
      + `<Logger level="DEBUG" name="plugin.text.xpath"/>`
      
+ **XSLT Transform** 
    + Loggers:
      + `<Logger level="DEBUG" name="plugin.text.xslt"/>`
