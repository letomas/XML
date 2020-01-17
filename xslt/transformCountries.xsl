<xsl:stylesheet version = '1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

    <xsl:template match="/">
        <html>
            <head>
                <xsl:apply-templates mode="title"></xsl:apply-templates>
				<meta charset="utf-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>	
                <link rel="stylesheet" href="styles.css"/>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
            </head>
            <body>
                <header>
                    <nav class="navbar navbar-expand-md navbar-dark bg-dark static-top">
                        <ul class="navbar-nav mr-auto">
                        <li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li>
                        <li class="nav-item active"><a class="nav-link" href="canada.html">Canada</a></li>
                        <li class="nav-item active"><a class="nav-link" href="armenia.html">Armenia</a></li>
                        <li class="nav-item active"><a class="nav-link" href="iceland.html">Iceland</a></li>
                        <li class="nav-item active"><a class="nav-link" href="madagascar.html">Madagascar</a></li>
                        </ul>
                    </nav>
                </header>

                <main>
                    <div class="container">
                        <xsl:apply-templates mode="content"></xsl:apply-templates>
                    </div>
                </main>

            </body>
        </html>

    </xsl:template>

    <xsl:template match="//country" mode="title">
        <title>
            <xsl:value-of select="@name"></xsl:value-of>
        </title>
    </xsl:template>


    <xsl:template match="//country" mode="content">
        <h1 class="card-header">
            <xsl:value-of select="@name" />
        </h1>
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="concat('../data/img/', @name, '-flag.gif')" />
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="concat('Flag of ', @name)" />
            </xsl:attribute>
        </img>
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="concat('../data/img/', @name, '-map.gif')" />
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="concat('Map of ', @name)" />
            </xsl:attribute>
        </img>
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="concat('../data/img/', @name, '-locator-map.gif')" />
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="concat('Locator map of ', @name)" />
            </xsl:attribute>
        </img>
        <h2 class="navigation-title">Navigation</h2>
        <ul class="list-unstyled">
            <xsl:for-each select="section">
                <li>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat('#', @name)" />
                        </xsl:attribute>
                        <xsl:value-of select="@name" />
                    </a>
                </li>
            </xsl:for-each>
        </ul>
        <xsl:apply-templates select="section" />
    </xsl:template>

    <xsl:template match="section">
        <article>
            <h2 class="card-header">
                <xsl:attribute name="id">
                    <xsl:value-of select="@name" />
                </xsl:attribute>
                <xsl:value-of select="@name" />
            </h2>
            <section>
                <xsl:apply-templates select="text" />
            </section>
        </article>
    </xsl:template>

    <xsl:template match="text">
        <h3 class="subsection-title">
            <xsl:value-of select="@name" />
        </h3>
        <xsl:choose>
            <xsl:when test="data/subdata">
                <ul>
                    <xsl:apply-templates select="*/subdata" />
                </ul>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="data" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="data">
        <p>
            <xsl:value-of select="." />
        </p>
    </xsl:template>
    <xsl:template match="subdata">
        <li>
            <xsl:value-of select="." />
        </li>
    </xsl:template>

</xsl:stylesheet>
