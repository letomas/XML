<xsl:stylesheet version = '1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

    <xsl:template match="/">
        <xsl:result-document href="index.html">
            <html>
                <head>
                    <title>Countries</title>
					<meta charset="utf-8"/>
					<meta name="viewport" content="width=device-width, initial-scale=1"/>
                    <link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
                </head>
                <body>
                    <header>
						<nav>
							<ul>
								<xsl:apply-templates mode="menu"/>
							</ul>
						</nav>
                    </header>

					<h1>Countries</h1>

                    <footer>
                        <p>BI-XML Semestrální práce 2019/2020, Tomáš Le</p>
                    </footer>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="//country" mode="menu">
        <li>
            <a href="{@name}.html">
                <xsl:value-of select="@name"/>
            </a>
        </li>
    </xsl:template>

</xsl:stylesheet>
