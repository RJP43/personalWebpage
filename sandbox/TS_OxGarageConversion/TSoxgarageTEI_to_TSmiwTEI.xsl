<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">
    <xsl:output indent="yes"/>
    <!-- RJP:2018-11-21: The following are conversion steps run on the oxGarage tei.xml file. This XSLT is the second stage of the tranformation pipeline.-->
    <!-- Find: (\*{1,}) Results: 8 Replace surrounding markup by hand: <p style="paraText" rend="division">\1</p>
 -->
    <!-- Find: <p>(-) Results: ~18 Replace: <p style="paraText" rend="division">\1 -->
    <!-- Find: <p rend="Body text (5)"><hi style="font-size:9pt"> - Results: 22 Replace: <p style="paraText" rend="division">- Then went in by hand and corrected the closing tags so there was only the closing p tag-->
    <!-- Find: Then did a search for series of hyphens to make sure got all instances where they were used as text divisions and by hand added the correct markup while removing any unneccessary markup-->
    <!-- TOTALING 55 hyphen/asterisk text divisions changed. -->
    <!-- Attempting to Capture Page Numbers - 
        Find: <hi style="font-size:\d{1,}pt">\s*(\d{1,})\s*</hi> 
        Realized there are instances where page numbers appear twice in a row so want to handle those first 
        Find: <hi style="font-size:\d{1,}pt">\s*(\d{1,})\s*</hi>\s*<hi style="font-size:\d{1,}pt">\s*(\d{1,})\s*</hi> 
        Results: 27 
        Replace: <pb style="page" n="\1"/> 
        Then did //pb in XPath to go thru each one and remove the surrounding p markup for each of these instances 
        Find: <p rend="Header or footer">\s*(<pb style="page" n="\d{1,}"/>)\s*</p> 
        Find: <p>\s*(<pb style="page" n="\d{1,}"/>)\s*</p> 
        Find: <p rend="Body text \(\d\)">\s*(<pb style="page" n="\d{1,}"/>)\s*</p> 
        Each time replaced with: \1 
        Double page numbers also appear within a single p so handled those next
        Find: <p[ rend="Header or footer"]*>(\d{1,})\s\d{1,}</p>
        Resutls: 7
        Replace: <pb style="page" n="\1"/>
        Now to handle bulk of remaining page numbers which seem to be styled directly in p elements or nested first in hi elements -
        Find: <p rend="Header or footer"><hi style="font-size:10pt">(\d{1,})</hi></p> and <p rend="Header or footer"><hi style="font-size:9.5pt">(\d{1,})</hi></p>
        Results: 105
        Replace: <pb style="page" n="\1"/>
        Find: <p rend="Header or footer">(\d{1,})</p>
        Results: 12
        Replace: <pb style="page" n="\1"/>
        I then used XPath to search for all the pagebreaks //pb to see where the first instance of a page number not appearing (page 14) which sits inside of unresolved comment markup.
        Find: <p[ rend="Header or footer"]*>(<anchor type="commentRangeStart" n="\d{1,}"/>)(\d{1,})(<anchor\s*type="commentRangeEnd" n="\d{1,}"/>.+?</hi>)</p>\s*(<p>)
        Results: 2
        Replace: \4\1<pb style="page" n="\2"/>\3
        Went back to the XPath //pb and found there are 17 instances where the pb is repeated (likely from an error in a past step)
        Find: (<pb style="page" n="\d{1,}"/>)\s*<pb style="page" n="\d{1,}"/>
        Replace \1
        Went back to XPath //pb to find the next instnace page number not yet captured was page 23
        Find: <p rend="Header or footer"><hi style="font-size:10pt">(\d{1,}) \d{1,}</hi></p>
        Results: 13
        Replace: <pb style="page" n="\1"/>
        Went back to XPath //pb and next problem was page 33
        Find: <hi rend="color\(333333\)"\s*style="font-size:10pt">\d{1,}\s*\d*</hi>
        These instances have a lot of messy surrounding markup so went case by case and corrected ~13 cases to proper page break markup.
        Went back to XPath //pb and next problem was page 37 which seems to be an oddball case so corrected by hand.
        Went back to XPath //pb with next issue at page 40
        Find: <p rend="Body text \(\d{1,}\)"><hi style="font-size:\d{1,}pt">(\d{1,})\s*\d{1,}</hi></p>
        Results: 15
        Replace: <pb style="page" n="\1"/>
        page 50 for some reason was the only one that converted incorrectly cutting off the 0, so I went in and corrected this by hand also removing the repeat page numbering for this instance which was sitting in a following-sibling p rend="other" element.
         Went back to XPath //pb with next issue at page 44 which seems to be an oddball case so corrected by hand.
         Went back to XPath //pb with next issue at page 52 which is actually same as issue with page 44 sooooo ...
         Find: \s*<hi rend="color\(\d{1,}\)" style="font-family:Courier New;font-size:10pt">\d{1,}</hi></p> <hi rend="color\(\d{1,}\)" style="font-size:10pt"\s*>\d{1,}</hi>
         
    -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template><!-- RJP:2018-11-25:Could this: <xsl:mode on-no-match="shallow-copy"/> : be used in place of the preceeding template match? -->
    
    

</xsl:stylesheet>
