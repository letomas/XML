<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4">
                    <fo:region-body margin="2cm" />
                    <fo:region-before extent="1cm" display-align="after" />
                    <fo:region-after extent="2cm" />
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block font-size="10pt" text-align="center">
                        BI-XML Semestral work
                    </fo:block>
				</fo:static-content>
				<fo:static-content flow-name="xsl-region-after">
                    <fo:block font-size="10pt" font-weight="bold" text-align="center">
                        <fo:page-number/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="18pt" font-weight="bold" text-align="center">
                        World Factbook
                    </fo:block>
                    <fo:block>
                        Content:
                    </fo:block>
                    <xsl:apply-templates mode="content" />
                    <xsl:apply-templates/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="countries">
        <xsl:apply-templates select="country"/>
    </xsl:template>

    <xsl:template match="country" mode="content">
        <fo:block font-size="14pt" font-weight="bold" space-before="0.5cm">
            <fo:basic-link internal-destination="{@name}" color="blue">
                <xsl:value-of select="@name"/>
                <fo:list-block provisional-distance-between-starts="0.3cm" provisional-label-separation="0.15cm" margin-left="15pt">
                    <xsl:for-each select="section">
                        <fo:list-item>
                            <fo:list-item-label end-indent="label-end()">
                                <fo:block>
                                    <fo:inline>&#183;</fo:inline>
                                </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body start-indent="body-start()">
                                <fo:block>
                                    <fo:basic-link internal-destination="{generate-id(.)}" text-transform="capitalize">   
                                        <xsl:value-of select="@name"/>
                                    </fo:basic-link>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </xsl:for-each>
                </fo:list-block>
            </fo:basic-link>
        </fo:block>
    </xsl:template>


    <xsl:template match="//country">
        <fo:block page-break-before="always"/>
        <fo:block font-size="15pt" font-weight="bold" text-align="center" id="{@name}" padding-top="15pt">
                <xsl:value-of select="@name"/>
        </fo:block>

        <fo:block text-align="center" padding-top="5pt">
            <fo:external-graphic height="150px" content-width="scale-to-fit" content-height="scale-to-fit" scaling="uniform">
                <xsl:attribute name="src">
                    url('./data/img/<xsl:value-of select="@name"/>-flag.gif')
                </xsl:attribute>
            </fo:external-graphic>
        </fo:block>

		<fo:block text-align="center" padding-top="5pt" padding-bottom="5pt">
            <fo:external-graphic height="150px" content-width="scale-to-fit" content-height="scale-to-fit" scaling="uniform">
                <xsl:attribute name="src">
                    url('./data/img/<xsl:value-of select="@name"/>-locator-map.gif')
                </xsl:attribute>
            </fo:external-graphic>
        </fo:block>
		
		<fo:block text-align="center" padding-top="5pt" padding-bottom="5pt">
		    <fo:external-graphic height="150px" content-width="scale-to-fit" content-height="scale-to-fit" scaling="uniform">
                <xsl:attribute name="src">
                    url('./data/img/<xsl:value-of select="@name"/>-map.gif')
                </xsl:attribute>
            </fo:external-graphic>
        </fo:block>
		
        <xsl:apply-templates select="section"/>
    </xsl:template>

    <xsl:template match="section">
        <fo:block font-size="15pt" font-weight="bold" text-align="center" margin-top="30pt" id="{generate-id(.)}" text-transform="capitalize">
		    <xsl:value-of select="@name"/>
        </fo:block>
        <xsl:apply-templates select="text"/>
    </xsl:template>

    <xsl:template match="text">
        <fo:block font-size="14pt" space-after="9pt" space-before="5pt" text-transform="capitalize" font-weight="bold">
            <xsl:value-of select="@name" />
        </fo:block>
        <xsl:choose>
            <xsl:when test="data/subdata">
                <fo:block>
                    <xsl:apply-templates select="*/subdata" />
                </fo:block>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="data" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="data">
        <fo:block>
            <xsl:value-of select="." />
        </fo:block>
    </xsl:template>

    <xsl:template match="subdata">
        <fo:block>
            <xsl:value-of select="." />
        </fo:block>
    </xsl:template>

</xsl:stylesheet>
