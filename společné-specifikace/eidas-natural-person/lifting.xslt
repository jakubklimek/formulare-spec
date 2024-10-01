<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:eidas-np="http://eidas.europa.eu/attributes/naturalperson" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="https://slovník.gov.cz/generický/eu-1501-2015-e-idas-prováděcí/pojem/">
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/eidas-np:NaturalPersonType">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727776534065-323f-c216-8b3b"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727776534065-323f-c216-8b3b">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/generický/eu-1501-2015-e-idas-prováděcí/pojem/fyzická-osoba"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="eidas-np:FamilyName">
        <ns0:současné-příjmení rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:současné-příjmení>
      </xsl:for-each>
      <xsl:for-each select="eidas-np:FirstName">
        <ns0:současné-jméno-jména rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:současné-jméno-jména>
      </xsl:for-each>
      <xsl:for-each select="eidas-np:DateOfBirth">
        <ns0:datum-narození rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:datum-narození>
      </xsl:for-each>
      <xsl:for-each select="eidas-np:PersonIdentifier">
        <ns0:jedinečný-identifikátor-fyzické-osoby rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:jedinečný-identifikátor-fyzické-osoby>
      </xsl:for-each>
      <xsl:for-each select="eidas-np:BirthName">
        <ns0:jméno-jména-a-příjmení-při-narození rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:jméno-jména-a-příjmení-při-narození>
      </xsl:for-each>
      <xsl:for-each select="eidas-np:PlaceOfBirth">
        <ns0:místo-narození rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:místo-narození>
      </xsl:for-each>
      <xsl:for-each select="eidas-np:CurrentAddress">
        <ns0:současná-adresa-fyzické-osoby rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:současná-adresa-fyzické-osoby>
      </xsl:for-each>
      <xsl:for-each select="eidas-np:Gender">
        <ns0:pohlaví rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:pohlaví>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
