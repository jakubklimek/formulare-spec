<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sp="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:eidas-np="http://eidas.europa.eu/attributes/naturalperson" xmlns:c="https://schemas.dataspecer.com/xsd/core/">
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
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/fyzická-osoba-identifikovaná-skrz-eidas-jako-osoba-ve-vztahu-k-dokumentu&#34;]">
    <eidas-np:NaturalPersonType>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727789353629-4ad8-0252-b8ed">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </eidas-np:NaturalPersonType>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727789353629-4ad8-0252-b8ed">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/eu-1501-2015-e-idas-prováděcí/pojem/současné-příjmení&#34;]">
      <eidas-np:FamilyName>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </eidas-np:FamilyName>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/eu-1501-2015-e-idas-prováděcí/pojem/současné-jméno-jména&#34;]">
      <eidas-np:FirstName>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </eidas-np:FirstName>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/eu-1501-2015-e-idas-prováděcí/pojem/datum-narození&#34;]">
      <eidas-np:DateOfBirth>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </eidas-np:DateOfBirth>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/eu-1501-2015-e-idas-prováděcí/pojem/jedinečný-identifikátor-fyzické-osoby&#34;]">
      <eidas-np:PersonIdentifier>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </eidas-np:PersonIdentifier>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/eu-1501-2015-e-idas-prováděcí/pojem/jméno-jména-a-příjmení-při-narození&#34;]">
      <eidas-np:BirthName>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </eidas-np:BirthName>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/eu-1501-2015-e-idas-prováděcí/pojem/místo-narození&#34;]">
      <eidas-np:PlaceOfBirth>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </eidas-np:PlaceOfBirth>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/eu-1501-2015-e-idas-prováděcí/pojem/současná-adresa-fyzické-osoby&#34;]">
      <eidas-np:CurrentAddress>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </eidas-np:CurrentAddress>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/eu-1501-2015-e-idas-prováděcí/pojem/pohlaví&#34;]">
      <eidas-np:Gender>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </eidas-np:Gender>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
