<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:osoby="http://dia.gov.cz/ns/spolecne-casti-elektronickych-dokumentu/osoby" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:místa="http://dia.gov.cz/ns/spolecne-casti-elektronickych-dokumentu/mista" xmlns:ns0="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/" xmlns:ns1="https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/">
  <xsl:import href="../místa/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/osoby:právnická_osoba">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727423142831-acec-f6a9-8b34"/>
        </xsl:sequence>
      </xsl:variable>
      <xsl:for-each select="$result">
        <xsl:copy>
          <xsl:call-template name="remove-top"/>
        </xsl:copy>
      </xsl:for-each>
      <xsl:for-each select="$result//top-level/node()">
        <xsl:copy>
          <xsl:call-template name="remove-top"/>
        </xsl:copy>
      </xsl:for-each>
    </rdf:RDF>
  </xsl:template>
  <xsl:template match="@xml:lang">
    <xsl:copy-of select="."/>
  </xsl:template>
  <xsl:template name="remove-top">
    <xsl:for-each select="@*">
      <xsl:copy/>
    </xsl:for-each>
    <xsl:for-each select="node()[not(. instance of element(top-level))]">
      <xsl:copy>
        <xsl:call-template name="remove-top"/>
      </xsl:copy>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727423142831-acec-f6a9-8b34">
    <xsl:param name="arc" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <rdf:Description>
      <xsl:apply-templates select="@*"/>
      <xsl:variable name="id">
        <id>
          <xsl:choose>
            <xsl:when test="c:iri and not($no_iri)">
              <xsl:attribute name="rdf:about">
                <xsl:value-of select="c:iri"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="rdf:nodeID">
                <xsl:value-of select="generate-id()"/>
              </xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        </id>
      </xsl:variable>
      <xsl:copy-of select="$id//@*"/>
      <rdf:type rdf:resource="https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/právnická-osoba-jako-osoba-ve-vztahu-k-dokumentu"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="osoby:obchodní_firma">
        <ns0:obchodní-firma rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:obchodní-firma>
      </xsl:for-each>
      <xsl:for-each select="osoby:ičo">
        <ns0:identifikační-číslo-osoby rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:identifikační-číslo-osoby>
      </xsl:for-each>
      <ns0:má-datovou-schránku-osoby>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727423226878-fe7c-4365-80b4">
          <xsl:with-param name="no_iri" select="true()"/>
        </xsl:call-template>
      </ns0:má-datovou-schránku-osoby>
      <ns1:má-sídlo-právnické-osoby>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727423323103-617c-40d6-b997">
          <xsl:with-param name="no_iri" select="true()"/>
        </xsl:call-template>
      </ns1:má-sídlo-právnické-osoby>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727423226878-fe7c-4365-80b4">
    <xsl:param name="arc" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <rdf:Description>
      <xsl:apply-templates select="@*"/>
      <xsl:variable name="id">
        <id>
          <xsl:choose>
            <xsl:when test="c:iri and not($no_iri)">
              <xsl:attribute name="rdf:about">
                <xsl:value-of select="c:iri"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="rdf:nodeID">
                <xsl:value-of select="generate-id()"/>
              </xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        </id>
      </xsl:variable>
      <xsl:copy-of select="$id//@*"/>
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/datová-schránka"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="osoby:datová_schránka">
        <ns0:má-identifikátor-datové-schránky rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:má-identifikátor-datové-schránky>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727423323103-617c-40d6-b997">
    <xsl:param name="arc" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <rdf:Description>
      <xsl:apply-templates select="@*"/>
      <xsl:variable name="id">
        <id>
          <xsl:choose>
            <xsl:when test="c:iri and not($no_iri)">
              <xsl:attribute name="rdf:about">
                <xsl:value-of select="c:iri"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="rdf:nodeID">
                <xsl:value-of select="generate-id()"/>
              </xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        </id>
      </xsl:variable>
      <xsl:copy-of select="$id//@*"/>
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/sídlo"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="osoby:sídlo">
        <ns1:má-místo-sídla>
          <xsl:variable name="type" select="resolve-QName(@xsi:type,.)"/>
          <xsl:variable name="types">
            <xsl:sequence>
              <místa:zahraniční_adresa/>
              <místa:adresní_místo/>
              <místa:adresa_neevidovaná_v_rúian/>
            </xsl:sequence>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$type=node-name($types/*[1])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183573744-3fff-319d-9afd"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[2])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183578102-e610-0607-ac82"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[3])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727446931152-3102-efce-91e3"/>
            </xsl:when>
          </xsl:choose>
        </ns1:má-místo-sídla>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
