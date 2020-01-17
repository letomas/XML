<xsl:stylesheet version = '1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

    <xsl:template match="/">
        <xsl:result-document href="index.html">
            <html>
                <head>
                    <title>Countries</title>
					<meta charset="utf-8"/>
					<meta name="viewport" content="width=device-width, initial-scale=1"/>
                    <link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
                    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
                </head>
                <body>
                    <header>
                        <nav class="navbar navbar-expand-md navbar-dark bg-dark static-top">
							<ul class="navbar-nav mr-auto">
                                <li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li>
								<xsl:apply-templates mode="menu"/>
							</ul>
						</nav>
                    </header>
                    
                    <h1>Countries</h1>
                    <p>This this website contains 4 countries from the CIA World Factbook.</p>
                    
                    <footer>
                        <p>BI-XML Semestrální práce 2019/2020, Tomáš Le</p>
                    </footer>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="//country" mode="menu">
        <li class="nav-item active">
            <a class="nav-link" href="{@name}.html">
                <xsl:value-of select="@name"/>
            </a>
        </li>
    </xsl:template>

</xsl:stylesheet>
