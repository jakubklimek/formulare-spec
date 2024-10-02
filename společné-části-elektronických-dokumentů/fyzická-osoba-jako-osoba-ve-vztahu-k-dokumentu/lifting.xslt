<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:osoby="https://ofn.gov.cz/společné-části-elektronických-dokumentů/2024-10-04/osoby" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:místa="https://ofn.gov.cz/společné-části-elektronických-dokumentů/2024-10-04/místa" xmlns:ns0="https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/" xmlns:ns1="https://slovník.gov.cz/generický/eu-1501-2015-e-idas-prováděcí/pojem/" xmlns:ns2="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/" xmlns:ns3="https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/">
  <xsl:import href="../místo/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/osoby:fyzická_osoba_ve_vztahu_k_dokumentu">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727862945440-8737-4796-be41"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727862945440-8737-4796-be41">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/fyzická-osoba-jako-osoba-ve-vztahu-k-dokumentu"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="osoby:jméno">
        <ns0:jméno-fyzické-osoby rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:jméno-fyzické-osoby>
      </xsl:for-each>
      <xsl:for-each select="osoby:další_jména">
        <ns0:další-jméno-fyzické-osoby rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:další-jméno-fyzické-osoby>
      </xsl:for-each>
      <xsl:for-each select="osoby:příjmení">
        <ns0:příjmení-fyzické-osoby rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:příjmení-fyzické-osoby>
      </xsl:for-each>
      <xsl:for-each select="osoby:datum_narození">
        <ns1:datum-narození rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:datum-narození>
      </xsl:for-each>
      <ns0:má-bydliště-fyzické-osoby>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727875486092-207a-434a-ba58">
          <xsl:with-param name="no_iri" select="true()"/>
        </xsl:call-template>
      </ns0:má-bydliště-fyzické-osoby>
      <ns2:má-datovou-schránku-fyzické-osoby>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727875486141-ad89-221a-a484">
          <xsl:with-param name="no_iri" select="true()"/>
        </xsl:call-template>
      </ns2:má-datovou-schránku-fyzické-osoby>
      <xsl:for-each select="osoby:doručovací_místo">
        <ns3:doručovací-místo>
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
        </ns3:doručovací-místo>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727875486092-207a-434a-ba58">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/bydliště-fyzické-osoby"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="osoby:trvalé_bydliště">
        <ns0:má-místo-bydliště>
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
        </ns0:má-místo-bydliště>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727875486141-ad89-221a-a484">
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
        <ns2:má-identifikátor-datové-schránky rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:má-identifikátor-datové-schránky>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
