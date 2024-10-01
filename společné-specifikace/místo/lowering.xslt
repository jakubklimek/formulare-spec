<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sp="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:místa="https://ofn.gov.cz/jmenný-prostor/podání/místa" xmlns:c="https://schemas.dataspecer.com/xsd/core/">
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
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/místo&#34;]">
    <místa:zahraniční_adresa>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183573744-3fff-319d-9afd">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </místa:zahraniční_adresa>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/místo&#34;]">
    <místa:adresní_místo>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183578102-e610-0607-ac82">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </místa:adresní_místo>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/místo&#34;]">
    <místa:adresa_neevidovaná_v_rúian>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727446931152-3102-efce-91e3">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </místa:adresa_neevidovaná_v_rúian>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183573744-3fff-319d-9afd">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/umístění/pojem/má-zahraniční-adresu&#34;]">
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727090720974-b081-02a5-a810">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183578102-e610-0607-ac82">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/umístění/pojem/má-adresu&#34;]">
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727090765021-f52f-e41a-a3bc">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727446931152-3102-efce-91e3">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/umístění/pojem/adresa-neevidovaná-v-rúian&#34;]">
      <místa:text_adresy>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:text_adresy>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727090765021-f52f-e41a-a3bc">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$obj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-adresu&#34;]">
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727090783518-4ff8-d3fd-92a1">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727090783518-4ff8-d3fd-92a1">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/adresy/pojem/kód-adresního-místa&#34;]">
      <místa:kód_adresního_místa>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:kód_adresního_místa>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727090720974-b081-02a5-a810">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/umístění/pojem/lokalizační-popis&#34;]">
      <místa:text_adresy>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:text_adresy>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
