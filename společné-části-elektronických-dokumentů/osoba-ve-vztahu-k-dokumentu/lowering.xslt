<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sp="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:osoby="https://ofn.gov.cz/společné-části-elektronických-dokumentů/2024-10-04/osoby" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:místa="https://ofn.gov.cz/společné-části-elektronických-dokumentů/2024-10-04/místa">
  <xsl:import href="../místo/lowering.xslt"/>
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
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/osoba-ve-vztahu-k-dokumentu&#34;]">
    <osoby:osoba_ve_vztahu_k_dokumentu>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727781423973-f8b2-ef43-983c">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </osoby:osoba_ve_vztahu_k_dokumentu>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/fyzická-osoba-jako-osoba-ve-vztahu-k-dokumentu&#34;]">
    <osoby:fyzická_osoba>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727781455324-19b0-ea50-a017">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </osoby:fyzická_osoba>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/fyzická-osoba-identifikovaná-skrz-eidas-jako-osoba-ve-vztahu-k-dokumentu&#34;]">
    <osoby:fyzická_osoba_eidas>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790068060-800f-1f0d-bfb0">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </osoby:fyzická_osoba_eidas>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/právnická-osoba-jako-osoba-ve-vztahu-k-dokumentu&#34;]">
    <osoby:právnická_osoba>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790074947-2223-3c55-b14a">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </osoby:právnická_osoba>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/právnická-osoba-identifikovaná-skrz-eidas-jako-osoba-ve-vztahu-k-dokumentu&#34;]">
    <osoby:právnická_osoba_eidas>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790081708-36a4-c28c-9339">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </osoby:právnická_osoba_eidas>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/podnikající-fyzická-osoba-zapsaná-v-obchodním-rejstříku-jako-osoba-ve-vztahu-k-dokumentu&#34;]">
    <osoby:podnikající_fyzická_osoba_zapsaná_v_or>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790088059-e223-fb14-8d07">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </osoby:podnikající_fyzická_osoba_zapsaná_v_or>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/podnikající-fyzická-osoba-nezapsaná-v-obchodním-rejstříku-jako-osoba-ve-vztahu-k-dokumentu&#34;]">
    <osoby:podnikající_fyzická_osoba_nezapsaná_v_or>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790092370-dfb7-d244-a202">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </osoby:podnikající_fyzická_osoba_nezapsaná_v_or>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727781423973-f8b2-ef43-983c">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/doručovací-místo&#34;]">
      <osoby:doručovací_místo>
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
      </osoby:doručovací_místo>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727781455324-19b0-ea50-a017">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/doručovací-místo&#34;]">
      <osoby:doručovací_místo>
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
      </osoby:doručovací_místo>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790068060-800f-1f0d-bfb0">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/doručovací-místo&#34;]">
      <osoby:doručovací_místo>
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
      </osoby:doručovací_místo>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790074947-2223-3c55-b14a">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/doručovací-místo&#34;]">
      <osoby:doručovací_místo>
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
      </osoby:doručovací_místo>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790081708-36a4-c28c-9339">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/doručovací-místo&#34;]">
      <osoby:doručovací_místo>
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
      </osoby:doručovací_místo>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790088059-e223-fb14-8d07">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/doručovací-místo&#34;]">
      <osoby:doručovací_místo>
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
      </osoby:doručovací_místo>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790092370-dfb7-d244-a202">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/doručovací-místo&#34;]">
      <osoby:doručovací_místo>
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
      </osoby:doručovací_místo>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
