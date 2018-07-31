<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
        xmlns:lxslt="http://xml.apache.org/xslt"
        xmlns:string="xalan://java.lang.String">
<xsl:output method="html" indent="yes" encoding="UTF-8"
  doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" />
<xsl:decimal-format decimal-separator="." grouping-separator="," />
<!--
   Licensed to the Apache Software Foundation (ASF) under one or more
   contributor license agreements.  See the NOTICE file distributed with
   this work for additional information regarding copyright ownership.
   The ASF licenses this file to You under the Apache License, Version 2.0
   (the "License"); you may not use this file except in compliance with
   the License.  You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 -->

<xsl:param name="TITLE">Test Results.</xsl:param>
<xsl:param name="TESTCASE">TestCase</xsl:param>
<xsl:param name="PACKAGE">Package</xsl:param>
<xsl:param name="SHOWDETAILS">true</xsl:param>

<!--

 Sample stylesheet to be used with Ant JUnitReport output.

 It creates a non-framed report that can be useful to send via
 e-mail or such.

-->
<xsl:template match="testsuites">
    <html>
        <head>
            <title><xsl:value-of select="$TITLE"/></title>
    <style type="text/css">
      body {
        font:normal 68% verdana,arial,helvetica;
        color:#000000;
      }
      table tr td, table tr th {
          font-size: 68%;
      }
      table.details tr th{
        font-weight: bold;
        text-align:left;
        background:#a6caf0;
      }
      table.details tr td{
        background:#eeeee0;
      }

      p {
        line-height:1.5em;
        margin-top:0.5em; margin-bottom:1.0em;
      }
      h1 {
        margin: 0px 0px 5px; font: 200% verdana,arial,helvetica
      }
      h2 {
        margin-top: 1em; margin-bottom: 0.5em; font: bold 125% verdana,arial,helvetica
      }
      h3 {
        margin-bottom: 0.5em; font: bold 115% verdana,arial,helvetica
      }
      h4 {
        margin-bottom: 0.5em; font: bold 100% verdana,arial,helvetica
      }
      h5 {
        margin-bottom: 0.5em; font: bold 100% verdana,arial,helvetica
      }
      h6 {
        margin-bottom: 0.5em; font: bold 100% verdana,arial,helvetica
      }
      .Error {
        font-weight:bold; color:red;
      }
      .Failure {
        font-weight:bold; color:purple;
      }
      .Properties {
        text-align:right;
      }
      div#report_logo {
	    float: right;
	    height: 82px;
	    width: 200px;
	  }
      </style>
      <script type="text/javascript" language="JavaScript">
        var TestCases = new Array();
        var cur;
        <xsl:for-each select="./testsuite">
            <xsl:apply-templates select="properties"/>
        </xsl:for-each>

       </script>
       <script type="text/javascript" language="JavaScript"><![CDATA[
        function displayProperties (name) {
          var win = window.open('','JUnitSystemProperties','scrollbars=1,resizable=1');
          var doc = win.document;
          doc.open();
          doc.write("<html><head><title>Properties of " + name + "</title>");
          doc.write("<style>")
          doc.write("body {font:normal 68% verdana,arial,helvetica; color:#000000; }");
          doc.write("table tr td, table tr th { font-size: 68%; }");
          doc.write("table.properties { border-collapse:collapse; border-left:solid 1 #cccccc; border-top:solid 1 #cccccc; padding:5px; }");
          doc.write("table.properties th { text-align:left; border-right:solid 1 #cccccc; border-bottom:solid 1 #cccccc; background-color:#eeeeee; }");
          doc.write("table.properties td { font:normal; text-align:left; border-right:solid 1 #cccccc; border-bottom:solid 1 #cccccc; background-color:#fffffff; }");
          doc.write("h3 { margin-bottom: 0.5em; font: bold 115% verdana,arial,helvetica }");
          doc.write("</style>");
          doc.write("</head><body>");
          doc.write("<h3>Properties of " + name + "</h3>");
          doc.write("<div align=\"right\"><a href=\"javascript:window.close();\">Close</a></div>");
          doc.write("<table class='properties'>");
          doc.write("<tr><th>Name</th><th>Value</th></tr>");
          for (prop in TestCases[name]) {
            doc.write("<tr><th>" + prop + "</th><td>" + TestCases[name][prop] + "</td></tr>");
          }
          doc.write("</table>");
          doc.write("</body></html>");
          doc.close();
          win.focus();
        }
      ]]>
      </script>
        </head>
        <body>
        	<div id="report_logo"><img src="data:image/gif;base64,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" alt="Empowered by vCommander"></img></div>
            <a name="top"></a>
            <xsl:call-template name="pageHeader"/>

            <!-- Summary part -->
            <xsl:call-template name="summary"/>
            <hr size="1" width="95%" align="left"/>

            <!-- Package List part -->
            <xsl:call-template name="packagelist"/>
            <hr size="1" width="95%" align="left"/>

            <!-- For each package create its part -->
            <xsl:call-template name="packages"/>
            <hr size="1" width="95%" align="left"/>

            <!-- For each class create the  part -->
            <xsl:call-template name="classes"/>

        </body>
    </html>
</xsl:template>



    <!-- ================================================================== -->
    <!-- Write a list of all packages with an hyperlink to the anchor of    -->
    <!-- of the package name.                                               -->
    <!-- ================================================================== -->
    <xsl:template name="packagelist">
        <h2><xsl:value-of select="$PACKAGE"/>s</h2>
        Note: package statistics are not computed recursively, they only sum up the numbers from the children.
        <table class="details" border="0" cellpadding="5" cellspacing="2" width="95%">
            <xsl:call-template name="testsuite.test.header"/>
            <!-- list all packages recursively -->
            <xsl:for-each select="./testsuite[not(./@package = preceding-sibling::testsuite/@package)]">
                <xsl:sort select="@package"/>
                <xsl:variable name="testsuites-in-package" select="/testsuites/testsuite[./@package = current()/@package]"/>
                <xsl:variable name="testCount" select="sum($testsuites-in-package/@tests)"/>
                <xsl:variable name="errorCount" select="sum($testsuites-in-package/@errors)"/>
                <xsl:variable name="failureCount" select="sum($testsuites-in-package/@failures)"/>
                <xsl:variable name="skippedCount" select="sum($testsuites-in-package/@skipped)" />
                <xsl:variable name="timeCount" select="sum($testsuites-in-package/@time)"/>

                <!-- write a summary for the package -->
                <tr valign="top">
                    <!-- set a nice color depending if there is an error/failure -->
                    <xsl:attribute name="class">
                        <xsl:choose>
                            <xsl:when test="$failureCount &gt; 0">Failure</xsl:when>
                            <xsl:when test="$errorCount &gt; 0">Error</xsl:when>
                        </xsl:choose>
                    </xsl:attribute>
                    <td><a href="#{@package}"><xsl:value-of select="@package"/></a></td>
                    <td><xsl:value-of select="$testCount"/></td>
                    <td><xsl:value-of select="$errorCount"/></td>
                    <td><xsl:value-of select="$failureCount"/></td>
                    <td><xsl:value-of select="$skippedCount" /></td>
                    <xsl:if test="$SHOWDETAILS = true">
	                    <td>
	                    <xsl:call-template name="display-time">
	                        <xsl:with-param name="value" select="$timeCount"/>
	                    </xsl:call-template>
	                    </td>
	                    <td><xsl:value-of select="$testsuites-in-package/@timestamp"/></td>
	                    <td><xsl:value-of select="$testsuites-in-package/@hostname"/></td>
                    </xsl:if>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>


    <!-- ================================================================== -->
    <!-- Write a package level report                                       -->
    <!-- It creates a table with values from the document:                  -->
    <!-- Name | Tests | Errors | Failures | Time                            -->
    <!-- ================================================================== -->
    <xsl:template name="packages">
        <!-- create an anchor to this package name -->
        <xsl:for-each select="/testsuites/testsuite[not(./@package = preceding-sibling::testsuite/@package)]">
            <xsl:sort select="@package"/>
                <a name="{@package}"></a>
                <h3><xsl:value-of select="$PACKAGE"/><xsl:text> </xsl:text><xsl:value-of select="@package"/></h3>

                <table class="details" border="0" cellpadding="5" cellspacing="2" width="95%">
                    <xsl:call-template name="testsuite.test.header"/>

                    <!-- match the testsuites of this package -->
                    <xsl:apply-templates select="/testsuites/testsuite[./@package = current()/@package]" mode="print.test"/>
                </table>
                <a href="#top">Back to top</a>
                <p/>
                <p/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="classes">
        <xsl:for-each select="testsuite">
            <xsl:sort select="@name"/>
            <!-- create an anchor to this class name -->
            <a name="{@name}"></a>
            <h3><xsl:value-of select="$TESTCASE"/><xsl:text> </xsl:text><xsl:value-of select="@name"/></h3>

            <table class="details" border="0" cellpadding="5" cellspacing="2" width="95%">
              <xsl:call-template name="testcase.test.header"/>
              <!--
              test can even not be started at all (failure to load the class)
              so report the error directly
              -->
                <xsl:if test="./error">
                    <tr class="Error">
                        <td colspan="4"><xsl:apply-templates select="./error"/></td>
                    </tr>
                </xsl:if>
                <xsl:apply-templates select="./testcase" mode="print.test"/>
            </table>
            <xsl:if test="$SHOWDETAILS = true">
	            <div class="Properties">
	                <a>
	                    <xsl:attribute name="href">javascript:displayProperties('<xsl:value-of select="@package"/>.<xsl:value-of select="@name"/>');</xsl:attribute>
	                    Properties &#187;
	                </a>
	            </div>
            </xsl:if>
            <p/>

            <a href="#top">Back to top</a>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="summary">
        <h2>Summary</h2>
        <xsl:variable name="testCount" select="sum(testsuite/@tests)"/>
        <xsl:variable name="errorCount" select="sum(testsuite/@errors)"/>
        <xsl:variable name="failureCount" select="sum(testsuite/@failures)"/>
        <xsl:variable name="skippedCount" select="sum(testsuite/@skipped)" />
        <xsl:variable name="timeCount" select="sum(testsuite/@time)"/>
        <xsl:variable name="successRate" select="($testCount - $failureCount - $errorCount) div $testCount"/>
        <table class="details" border="0" cellpadding="5" cellspacing="2" width="95%">
        <tr valign="top">
            <th>Tests</th>
            <th>Failures</th>
            <th>Errors</th>
            <th>Skipped</th>
            <th>Success rate</th>
            <xsl:if test="$SHOWDETAILS = true">
            		<th>Time</th>
            	</xsl:if>
        </tr>
        <tr valign="top">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="$failureCount &gt; 0">Failure</xsl:when>
                    <xsl:when test="$errorCount &gt; 0">Error</xsl:when>
                </xsl:choose>
            </xsl:attribute>
            <td><xsl:value-of select="$testCount"/></td>
            <td><xsl:value-of select="$failureCount"/></td>
            <td><xsl:value-of select="$errorCount"/></td>
            <td><xsl:value-of select="$skippedCount" /></td>
            <td>
                <xsl:call-template name="display-percent">
                    <xsl:with-param name="value" select="$successRate"/>
                </xsl:call-template>
            </td>
            <xsl:if test="$SHOWDETAILS = true">
	            <td>
	                <xsl:call-template name="display-time">
	                    <xsl:with-param name="value" select="$timeCount"/>
	                </xsl:call-template>
	            </td>
			</xsl:if>
        </tr>
        </table>
        <table border="0" width="95%">
        <tr>
        <td style="text-align: justify;">
        Note: <i>failures</i> are anticipated and checked for with assertions while <i>errors</i> are unanticipated.
        </td>
        </tr>
        </table>
    </xsl:template>

  <!--
   Write properties into a JavaScript data structure.
   This is based on the original idea by Erik Hatcher (ehatcher@apache.org)
   -->
  <xsl:template match="properties">
    cur = TestCases['<xsl:value-of select="../@package"/>.<xsl:value-of select="../@name"/>'] = new Array();
    <xsl:for-each select="property">
    <xsl:sort select="@name"/>
        cur['<xsl:value-of select="@name"/>'] = '<xsl:call-template name="JS-escape"><xsl:with-param name="string" select="@value"/></xsl:call-template>';
    </xsl:for-each>
  </xsl:template>

<!-- Page HEADER -->
<xsl:template name="pageHeader">
    <h1><xsl:value-of select="$TITLE"/></h1>
    <table width="100%">
    <tr>
        <td align="left"></td>
        <td align="right"></td>
    </tr>
    </table>
    <hr size="1"/>
</xsl:template>

<xsl:template match="testsuite" mode="header">
    <tr valign="top">
        <th width="80%">Name</th>
        <th>Tests</th>
        <th>Errors</th>
        <th>Failures</th>
        <th>Skipped</th>
        <xsl:if test="$SHOWDETAILS = true">
        		<th nowrap="nowrap">Time(s)</th>
        </xsl:if>
    </tr>
</xsl:template>

<!-- class header -->
<xsl:template name="testsuite.test.header">
    <tr valign="top">
        <th width="80%">Name</th>
        <th>Tests</th>
        <th>Errors</th>
        <th>Failures</th>
        <th>Skipped</th>
        <xsl:if test="$SHOWDETAILS = true">
	        <th nowrap="nowrap">Time(s)</th>
	        <th nowrap="nowrap">Time Stamp</th>
	        <th>Host</th>
        </xsl:if>
    </tr>
</xsl:template>

<!-- method header -->
<xsl:template name="testcase.test.header">
    <tr valign="top">
        <th>Name</th>
        <th>Status</th>
        <th width="80%">Message</th>
        <xsl:if test="$SHOWDETAILS = true">
        		<th nowrap="nowrap">Time(s)</th>
        	</xsl:if>
    </tr>
</xsl:template>


<!-- class information -->
<xsl:template match="testsuite" mode="print.test">
    <tr valign="top">
        <!-- set a nice color depending if there is an error/failure -->
        <xsl:attribute name="class">
            <xsl:choose>
                <xsl:when test="@failures[.&gt; 0]">Failure</xsl:when>
                <xsl:when test="@errors[.&gt; 0]">Error</xsl:when>
            </xsl:choose>
        </xsl:attribute>

        <!-- print testsuite information -->
        <td><a href="#{@name}"><xsl:value-of select="@name"/></a></td>
        <td><xsl:value-of select="@tests"/></td>
        <td><xsl:value-of select="@errors"/></td>
        <td><xsl:value-of select="@failures"/></td>
        <td><xsl:value-of select="@skipped" /></td>
        <xsl:if test="$SHOWDETAILS = true">
	        <td>
	            <xsl:call-template name="display-time">
	                <xsl:with-param name="value" select="@time"/>
	            </xsl:call-template>
	        </td>
	        <td><xsl:apply-templates select="@timestamp"/></td>
	        <td><xsl:apply-templates select="@hostname"/></td>
	    </xsl:if>
    </tr>
</xsl:template>

<xsl:template match="testcase" mode="print.test">
    <tr valign="top">
        <xsl:attribute name="class">
            <xsl:choose>
                <xsl:when test="failure | error">Error</xsl:when>
            </xsl:choose>
        </xsl:attribute>
        <td><xsl:value-of select="@name"/></td>
        <xsl:choose>
            <xsl:when test="failure">
                <td>Failure</td>
                <td><xsl:apply-templates select="failure"/></td>
            </xsl:when>
            <xsl:when test="error">
                <td>Error</td>
                <td><xsl:apply-templates select="error"/></td>
            </xsl:when>
            <xsl:when test="skipped">
            		<td>Skipped</td>
            		<td><xsl:apply-templates select="skipped"/></td>
            </xsl:when>
            <xsl:otherwise>
                <td>Success</td>
                <td></td>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$SHOWDETAILS = true">
	        <td>
	            <xsl:call-template name="display-time">
	                <xsl:with-param name="value" select="@time"/>
	            </xsl:call-template>
	        </td>
		</xsl:if>	    
    </tr>
</xsl:template>


<xsl:template match="failure">
    <xsl:call-template name="display-failures"/>
</xsl:template>

<xsl:template match="error">
    <xsl:call-template name="display-failures"/>
</xsl:template>

<xsl:template match="skipped">
    <xsl:call-template name="display-failures"/>
</xsl:template>

<!-- Style for the error, failure and skipped in the testcase template -->
<xsl:template name="display-failures">
    <xsl:choose>
        <xsl:when test="not(@message)">N/A</xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="@message"/>
        </xsl:otherwise>
    </xsl:choose>
    <!-- display the stacktrace -->
    <code>
        <br/><br/>
        <xsl:call-template name="br-replace">
            <xsl:with-param name="word" select="."/>
        </xsl:call-template>
    </code>
    <!-- the later is better but might be problematic for non-21" monitors... -->
    <!--pre><xsl:value-of select="."/></pre-->
</xsl:template>

<xsl:template name="JS-escape">
    <xsl:param name="string"/>
    <xsl:param name="tmp1" select="string:replaceAll(string:new(string($string)),'\\','\\\\')"/>
    <xsl:param name="tmp2" select="string:replaceAll(string:new(string($tmp1)),&quot;'&quot;,&quot;\\&apos;&quot;)"/>
    <xsl:param name="tmp3" select="string:replaceAll(string:new(string($tmp2)),&quot;&#10;&quot;,'\\n')"/>
    <xsl:param name="tmp4" select="string:replaceAll(string:new(string($tmp3)),&quot;&#13;&quot;,'\\r')"/>
    <xsl:value-of select="$tmp4"/>
</xsl:template>


<!--
    template that will convert a carriage return into a br tag
    @param word the text from which to convert CR to BR tag
-->
<xsl:template name="br-replace">
    <xsl:param name="word"/>
    <xsl:param name="splitlimit">32</xsl:param>
    <xsl:variable name="secondhalfstartindex" select="(string-length($word)+(string-length($word) mod 2)) div 2"/>
    <xsl:variable name="secondhalfword" select="substring($word, $secondhalfstartindex)"/>
    <!-- When word is very big, a recursive replace is very heap/stack expensive, so subdivide on line break after middle of string -->
    <xsl:choose>
      <xsl:when test="(string-length($word) > $splitlimit) and (contains($secondhalfword, '&#xa;'))">
        <xsl:variable name="secondhalfend" select="substring-after($secondhalfword, '&#xa;')"/>
        <xsl:variable name="firsthalflen" select="string-length($word) - string-length($secondhalfword)"/>
        <xsl:variable name="firsthalfword" select="substring($word, 1, $firsthalflen)"/>
        <xsl:variable name="firsthalfend" select="substring-before($secondhalfword, '&#xa;')"/>
        <xsl:call-template name="br-replace">
          <xsl:with-param name="word" select="concat($firsthalfword,$firsthalfend)"/>
        </xsl:call-template>
        <br/>
        <xsl:call-template name="br-replace">
          <xsl:with-param name="word" select="$secondhalfend"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains($word, '&#xa;')">
        <xsl:value-of select="substring-before($word, '&#xa;')"/>
        <br/>
        <xsl:call-template name="br-replace">
          <xsl:with-param name="word" select="substring-after($word, '&#xa;')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$word"/>
      </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="display-time">
    <xsl:param name="value"/>
    <xsl:value-of select="format-number($value,'0.000')"/>
</xsl:template>

<xsl:template name="display-percent">
    <xsl:param name="value"/>
    <xsl:value-of select="format-number($value,'0.00%')"/>
</xsl:template>

</xsl:stylesheet>
