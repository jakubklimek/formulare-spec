<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sp="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:formuláře="https://ofn.gov.cz/dokumenty-z-formulářů-ZoPDS/2024-10-04" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:osoby="https://ofn.gov.cz/společné-části-elektronických-dokumentů/2024-10-04/osoby">
  <xsl:import href="../../společné-části-elektronických-dokumentů/2024-10-04/person-in-relationship-with-a-document/lowering.xslt"/>
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
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/dokument-vytvořený-elektronickým-formulářem&#34;]">
    <formuláře:dokument>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173141547-74a8-9cd3-beea">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </formuláře:dokument>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173141547-74a8-9cd3-beea">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/je-opatřen-identifikátorem&#34;]">
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309832-624b-b643-b039">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/259/2012/pojem/je-odpovědí-na-dokument&#34;]">
      <formuláře:je_odpovědí_na_dokument>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173504787-1106-9848-b26a">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </formuláře:je_odpovědí_na_dokument>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/odesílatel&#34;]">
      <formuláře:odesílatel>
        <xsl:choose>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191874076-2b69-749e-9e91">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:právnická_osoba&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191881510-e100-9761-b2a3">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:fyzická_osoba&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191896626-e404-554e-8ed2">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:podnikající_fyzická_osoba_zapsaná_v_or&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191904594-0067-a227-add3">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:podnikající_fyzická_osoba_nezapsaná_v_or&#34;"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </formuláře:odesílatel>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/příjemce&#34;]">
      <formuláře:příjemce>
        <xsl:choose>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191874076-2b69-749e-9e91">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:právnická_osoba&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191881510-e100-9761-b2a3">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:fyzická_osoba&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191896626-e404-554e-8ed2">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:podnikající_fyzická_osoba_zapsaná_v_or&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191904594-0067-a227-add3">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:podnikající_fyzická_osoba_nezapsaná_v_or&#34;"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </formuláře:příjemce>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/uživatel-služby&#34;]">
      <formuláře:uživatel_služby>
        <xsl:choose>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191874076-2b69-749e-9e91">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:právnická_osoba&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191881510-e100-9761-b2a3">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:fyzická_osoba&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191896626-e404-554e-8ed2">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:podnikající_fyzická_osoba_zapsaná_v_or&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191904594-0067-a227-add3">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:podnikající_fyzická_osoba_nezapsaná_v_or&#34;"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </formuláře:uživatel_služby>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/použité-oprávnění-k-zastupování&#34;]">
      <formuláře:použité_zastupování>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727774623050-add6-f276-8e66">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </formuláře:použité_zastupování>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/k-rukám&#34;]">
      <formuláře:k_rukám>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:k_rukám>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/byl-vyplněn-v-isvs&#34;]">
      <formuláře:vyplněn_v_isvs>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309315-4c31-def5-acdd">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </formuláře:vyplněn_v_isvs>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/má-způsob-provedení-digitálního-úkonu&#34;]">
      <formuláře:způsob_provedení_úkonu>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309348-2251-fc6a-8fd9">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </formuláře:způsob_provedení_úkonu>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/byl-vytvořen-formulářem&#34;]">
      <formuláře:byl_vytvořen_formulářem>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309422-8a40-ed3d-89c8">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </formuláře:byl_vytvořen_formulářem>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/počet-příloh&#34;]">
      <formuláře:počet_příloh>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:počet_příloh>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/obsahuje-přílohu&#34;]">
      <formuláře:příloha>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309545-81f0-ebb4-be82">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </formuláře:příloha>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/259/2012/pojem/má-stručný-obsah-dokumentu&#34;]">
      <formuláře:věc>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:věc>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/doručit-osvědčení-do-datové-schránky&#34;]">
      <formuláře:doručit_osvědčení_do_datové_schránky>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:doručit_osvědčení_do_datové_schránky>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/služba-v-přenesené-působnosti&#34;]">
      <formuláře:služba_v_přenesené_působnosti>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:služba_v_přenesené_působnosti>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309832-624b-b643-b039">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/řetězcová-podoba-jednoznačného-identifikátoru&#34;]">
      <formuláře:jid>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:jid>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173504787-1106-9848-b26a">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/499/2004/pojem/je-opatřen-identifikátorem&#34;]">
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173530933-5387-c9b3-9a60">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/259/2012/pojem/má-evidenční-číslo-ze-samostatné-evidence-dokumentů&#34;]">
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173531006-9f58-3229-9fc2">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/259/2012/pojem/má-číslo-jednací&#34;]">
      <formuláře:číslo_jednací>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:číslo_jednací>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/499/2004/pojem/je-zařazen-do-spisu&#34;]">
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173530968-8bce-ffa5-b12d">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727774623050-add6-f276-8e66">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/identifikátor-oprávnění-k-zastupování&#34;]">
      <formuláře:okz>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:okz>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/datový-slovník-registru-zastoupení/pojem/vytvořeno-na-základě-šablony&#34;]">
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727794661831-9919-bd9c-ad9c">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/zastoupený&#34;]">
      <formuláře:zastoupený>
        <xsl:choose>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191874076-2b69-749e-9e91">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:právnická_osoba&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191881510-e100-9761-b2a3">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:fyzická_osoba&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191896626-e404-554e-8ed2">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:podnikající_fyzická_osoba_zapsaná_v_or&#34;"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;null&#34;]">
            <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191904594-0067-a227-add3">
              <xsl:with-param name="id">
                <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
              </xsl:with-param>
              <xsl:with-param name="type_name" select="&#34;osoby:podnikající_fyzická_osoba_nezapsaná_v_or&#34;"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </formuláře:zastoupený>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/zástupce&#34;]">
      <formuláře:zástupce>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727280250648-5253-44c4-a1e6">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </formuláře:zástupce>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309315-4c31-def5-acdd">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/agendový/104/pojem/má-identifikátor-isvs&#34;]">
      <formuláře:kód>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:kód>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/329/2020/pojem/název-isvs&#34;]">
      <formuláře:název>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:název>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309348-2251-fc6a-8fd9">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/datový/číselníky/pojem/kód-položky-číselníku&#34;]">
      <formuláře:kód>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:kód>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/datový/číselníky/pojem/plný-název-položky-číselníku&#34;]">
      <formuláře:název>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:název>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309422-8a40-ed3d-89c8">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/má-identifikátor-formuláře&#34;]">
      <formuláře:identifikátor>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:identifikátor>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/12/2020/pojem/název-formuláře&#34;]">
      <formuláře:název>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:název>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/verze&#34;]">
      <formuláře:verze>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:verze>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/12/2020/pojem/umožňuje-činit-úkon&#34;]">
      <formuláře:úkon>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727193644579-0217-07ed-a043">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </formuláře:úkon>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/12/2020/pojem/umožňuje-činit-úkon-služby&#34;]">
      <formuláře:služba>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727193644627-8006-e10c-a984">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </formuláře:služba>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/12/2020/pojem/umožňuje-činit-úkon-služby-agendy&#34;]">
      <formuláře:agenda>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727193644678-b5a9-5d06-b1b8">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </formuláře:agenda>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309545-81f0-ebb4-be82">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/název-přílohy&#34;]">
      <formuláře:název>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:název>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/název-souboru-přílohy&#34;]">
      <formuláře:název_souboru>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:název_souboru>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/digitální-objekty/pojem/má-typ-média&#34;]">
      <formuláře:typ_média>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:uri"/>
      </formuláře:typ_média>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/obsah-přílohy&#34;]">
      <formuláře:obsah>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:obsah>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727193644579-0217-07ed-a043">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/agendový/104/pojem/má-identifikátor-úkonu-služby&#34;]">
      <formuláře:kód>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:kód>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/agendový/104/pojem/má-název-úkonu-služby&#34;]">
      <formuláře:název>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:název>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727193644627-8006-e10c-a984">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/agendový/104/pojem/má-identifikátor-služby&#34;]">
      <formuláře:kód>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:kód>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/agendový/104/pojem/má-název-služby&#34;]">
      <formuláře:název>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:název>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727193644678-b5a9-5d06-b1b8">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-kód-agendy&#34;]">
      <formuláře:kód>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:kód>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-název-agendy&#34;]">
      <formuláře:název>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:název>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727794661831-9919-bd9c-ad9c">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/datový-slovník-registru-zastoupení/pojem/kód-šablony&#34;]">
      <formuláře:kód_šablony>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:kód_šablony>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173530933-5387-c9b3-9a60">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/řetězcová-podoba-jednoznačného-identifikátoru&#34;]">
      <formuláře:jid>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:jid>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173531006-9f58-3229-9fc2">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/řetězcová-podoba-evidenčního-čísla&#34;]">
      <formuláře:evidenční_číslo>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:evidenční_číslo>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173530968-8bce-ffa5-b12d">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/259/2012/pojem/má-spisovou-značku&#34;]">
      <formuláře:spisová_značka>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </formuláře:spisová_značka>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
