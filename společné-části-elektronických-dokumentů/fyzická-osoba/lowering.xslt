<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sp="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:osoby="http://dia.gov.cz/ns/spolecne-casti-elektronickych-dokumentu/osoby" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:místa="http://dia.gov.cz/ns/spolecne-casti-elektronickych-dokumentu/mista">
  <xsl:import href="../místa/lowering.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
  <xsl:param name="subj" select="'s'"/>
  <xsl:param name="pred" select="'p'"/>
  <xsl:param name="obj" select="'o'"/>
  <xsl:variable name="type" select="'http://www.w3.org/1999/02/22-rdf-syntax-ns#type'"/>
  <xsl:function name="c:id-key">
    <xsl:param name="node"/>
    <xsl:value-of select="concat(namespace-uri($node),'|',local-name($node),'|',string($node))"/>
  </xsl:function>
  <xsl:template match="/sp:sparql">
    <xsl:apply-templates select="sp:results/sp:result"/>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/fyzická-osoba-jako-osoba-ve-vztahu-k-dokumentu&#34;]">
    <osoby:fyzická_osoba>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727280250648-5253-44c4-a1e6">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </osoby:fyzická_osoba>
  </xsl:template>
  <xsl:template match="@xml:lang">
    <xsl:copy-of select="."/>
  </xsl:template>
  <xsl:template match="sp:literal">
    <xsl:apply-templates select="@*"/>
    <xsl:value-of select="."/>
  </xsl:template>
  <xsl:template match="sp:uri">
    <xsl:value-of select="."/>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727280250648-5253-44c4-a1e6">
    <xsl:param name="id"/>
    <xsl:param name="type_name" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <xsl:if test="not(empty($type_name))">
      <xsl:attribute name="xsi:type">
        <xsl:value-of select="$type_name"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="not($no_iri)">
      <xsl:for-each select="$id/sp:uri">
        <c:iri>
          <xsl:value-of select="."/>
        </c:iri>
      </xsl:for-each>
    </xsl:if>
    <xsl:variable name="id_test">
      <xsl:value-of select="c:id-key($id/*)"/>
    </xsl:variable>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/jméno-fyzické-osoby&#34;]">
      <osoby:jméno>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </osoby:jméno>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/další-jméno-fyzické-osoby&#34;]">
      <osoby:další_jména>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </osoby:další_jména>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/příjmení-fyzické-osoby&#34;]">
      <osoby:příjmení>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </osoby:příjmení>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/eu-1501-2015-e-idas-prováděcí/pojem/datum-narození&#34;]">
      <osoby:datum_narození>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </osoby:datum_narození>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/má-bydliště-fyzické-osoby&#34;]">
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727280328795-652b-4eaa-96cf">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-datovou-schránku-fyzické-osoby&#34;]">
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727875337204-076b-abe1-af36">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727280328795-652b-4eaa-96cf">
    <xsl:param name="id"/>
    <xsl:param name="type_name" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <xsl:if test="not(empty($type_name))">
      <xsl:attribute name="xsi:type">
        <xsl:value-of select="$type_name"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="not($no_iri)">
      <xsl:for-each select="$id/sp:uri">
        <c:iri>
          <xsl:value-of select="."/>
        </c:iri>
      </xsl:for-each>
    </xsl:if>
    <xsl:variable name="id_test">
      <xsl:value-of select="c:id-key($id/*)"/>
    </xsl:variable>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/má-místo-bydliště&#34;]">
      <osoby:trvalé_bydliště>
        <xsl:choose>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/místo&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183573744-3fff-319d-9afd">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;místa:zahraniční_adresa&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/místo&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183578102-e610-0607-ac82">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;místa:adresní_místo&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/místo&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727446931152-3102-efce-91e3">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;místa:adresa_neevidovaná_v_rúian&#34;"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </osoby:trvalé_bydliště>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727875337204-076b-abe1-af36">
    <xsl:param name="id"/>
    <xsl:param name="type_name" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <xsl:if test="not(empty($type_name))">
      <xsl:attribute name="xsi:type">
        <xsl:value-of select="$type_name"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="not($no_iri)">
      <xsl:for-each select="$id/sp:uri">
        <c:iri>
          <xsl:value-of select="."/>
        </c:iri>
      </xsl:for-each>
    </xsl:if>
    <xsl:variable name="id_test">
      <xsl:value-of select="c:id-key($id/*)"/>
    </xsl:variable>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-identifikátor-datové-schránky&#34;]">
      <osoby:datová_schránka>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </osoby:datová_schránka>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
