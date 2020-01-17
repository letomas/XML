<xsl:stylesheet version = '1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

    <xsl:template match="/">
        <html>
            <head>
                <xsl:apply-templates mode="title"></xsl:apply-templates>
				<meta charset="utf-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>	
                <link rel="stylesheet" href="styles.css"/>
            </head>
            <body>
                <header>
                    <nav>
                        <ul>
                            <li>
                                <a href="index.html">Home</a>
                            </li>
                            <li>
                                <a href="armenia.html">Armenia</a>
                            </li>
                            <li>
                                <a href="canada.html">Canada</a>
                            </li>
                            <li>
                                <a href="iceland.html">Iceland</a>
                            </li>
                            <li>
                                <a href="madagascar.html">Madagascar</a>
                            </li>
                        </ul>
                    </nav>
                </header>

                <main>
                    <xsl:apply-templates mode="content"></xsl:apply-templates>
                </main>

                <footer>
                    <p>BI-XML Semestrální práce 2019/2020, Tomáš Le</p>
                </footer>
            </body>
        </html>

    </xsl:template>

    <xsl:template match="//country" mode="title">
        <title>
            <xsl:value-of select="@name"></xsl:value-of>
        </title>
    </xsl:template>


    <xsl:template match="//country" mode="content">
        <h1>
            <xsl:value-of select="@name" />
        </h1>
        <img class="flag">
            <xsl:attribute name="src">
                <xsl:value-of select="concat('../data/img/', @name, '-flag.gif')" />
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="concat('Flag of ', @name)" />
            </xsl:attribute>
        </img>
        <img class="map">
            <xsl:attribute name="src">
                <xsl:value-of select="concat('../data/img/', @name, '-map.gif')" />
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="concat('Map of ', @name)" />
            </xsl:attribute>
        </img>
        <img class="locator">
            <xsl:attribute name="src">
                <xsl:value-of select="concat('../data/img/', @name, '-locator-map.gif')" />
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="concat('Locator map of ', @name)" />
            </xsl:attribute>
        </img>
        <p class="navigation-title">Navigation</p>
        <ul class="navigation">
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
            <h2 class="section-title">
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
