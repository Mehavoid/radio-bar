<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="1.0" encoding="iso-8859-1" indent="yes"/>
<xsl:template match = "/icestats" >
<head>
    <meta http-equiv="refresh" content="30" />
    <style>
  * {
    box-sizing: border-box;
    border: 0 solid;
  }

  html {
    tab-size: 4;
    line-height: 1.5;
    -webkit-text-size-adjust: 100%;
  }

  body {
    margin: 0;
    line-height: inherit;
    font-family: system-ui, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';
  }

  div {
    display: flex;
    width: 100%;
    border: 1px solid #111;
    background-color: #3b3b3b;
    justify-content: space-between;
  }

  a {
    display: flex;
    color: #fff;
    font-size: 11px;
    font-weight: normal;
    text-decoration: none;
    align-items: center;
  }

  a:hover {
    outline-width: 0;
    text-decoration: underline;
  }

  span {
    margin-left: 3px;
  }

  .status {
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 280px;
    margin-top: -1px;
    white-space: nowrap
  }

  .status-indicator {
    width: 10px;
    height: 10px;
    background-color: red;
    border-radius: 50%;
    margin-top: -1px;
  }

  .pulse {
    -webkit-animation: 2s pulse_effect ease infinite;
    -moz-animation: 2s pulse_effect ease infinite;
    -ms-animation: 2s pulse_effect ease infinite;
    -o-animation: 2s pulse_effect ease infinite;
    animation: 2s pulse_effect ease infinite;
  }

  @keyframes pulse_effect {
    0%, 100%  {
      opacity: 0;
    }
    15%, 85% {
      opacity: 1;
    }
  }

  @-moz-keyframes pulse_effect {
    0%, 100%  {
      opacity: 0;
    }
    15%, 85% {
      opacity: 1;
    }
  }

  @-webkit-keyframes pulse_effect {
    0%, 100%  {
      opacity: 0;
    }
    15%, 85% {
      opacity: 1;
    }
  }

  @-ms-keyframes pulse_effect {
    0%, 100%  {
      opacity: 0;
    }
    15%, 85% {
      opacity: 1;
    }
  }

  @-o-keyframes pulse_effect {
    0%, 100%  {
      opacity: 0;
    }
    15%, 85% {
      opacity: 1;
    }
  }</style>
</head>
<body>
  <div>
  <a href="https://${HOST}" target="_blank" rel="noopener noreferrer">
    <xsl:for-each select="source">
      <xsl:sort select="not(stream_start_iso8601)" />
      <xsl:if test="position()!=last()">
        <xsl:if test="contains(listenurl, '/broadcast')">
          <span class="status-indicator pulse"></span>
          <span>LIVE</span>
        </xsl:if>
        <span class="status">Radio:
        <xsl:if test="artist">
          <xsl:value-of select="artist" />
        </xsl:if>
        <xsl:if test="title">
          <xsl:value-of select="title" />
        </xsl:if>
        <xsl:if test="not(artist or title)">
          Unknown Artist - Untitled
        </xsl:if>
        </span>
      </xsl:if>
    </xsl:for-each>
  </a>
  <a href="https://${HOST}/playlist.m3u">Download m3u</a>
  </div>
</body>
</xsl:template>
</xsl:stylesheet>
