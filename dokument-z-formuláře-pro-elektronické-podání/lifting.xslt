<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:podání="https://ofn.gov.cz/jmenný-prostor/podání" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:osoby="https://ofn.gov.cz/jmenný-prostor/podání/osoby" xmlns:ns0="https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/" xmlns:ns1="https://slovník.gov.cz/legislativní/sbírka/259/2012/pojem/" xmlns:ns2="https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/" xmlns:ns3="https://slovník.gov.cz/legislativní/sbírka/499/2004/pojem/" xmlns:ns4="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/" xmlns:ns5="https://slovník.gov.cz/agendový/104/pojem/" xmlns:ns6="https://slovník.gov.cz/legislativní/sbírka/329/2020/pojem/" xmlns:ns7="https://slovník.gov.cz/datový/číselníky/pojem/" xmlns:ns8="https://slovník.gov.cz/legislativní/sbírka/12/2020/pojem/" xmlns:ns9="https://slovník.gov.cz/generický/digitální-objekty/pojem/">
  <xsl:import href="./společné-specifikace/person-in-relationship-with-a-document/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/podání:dokument">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173141547-74a8-9cd3-beea"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173141547-74a8-9cd3-beea">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/dokument-vytvořený-elektronickým-formulářem"/>
      <xsl:copy-of select="$arc"/>
      <ns0:je-opatřen-identifikátorem>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309832-624b-b643-b039">
          <xsl:with-param name="no_iri" select="true()"/>
        </xsl:call-template>
      </ns0:je-opatřen-identifikátorem>
      <xsl:for-each select="podání:je_odpovědí_na_dokument">
        <ns1:je-odpovědí-na-dokument>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173504787-1106-9848-b26a"/>
        </ns1:je-odpovědí-na-dokument>
      </xsl:for-each>
      <xsl:for-each select="podání:odesílatel">
        <ns0:odesílatel>
          <xsl:variable name="type" select="resolve-QName(@xsi:type,.)"/>
          <xsl:variable name="types">
            <xsl:sequence>
              <osoby:právnická_osoba/>
              <osoby:fyzická_osoba/>
              <osoby:podnikající_fyzická_osoba_zapsaná_v_or/>
              <osoby:podnikající_fyzická_osoba_nezapsaná_v_or/>
            </xsl:sequence>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$type=node-name($types/*[1])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191874076-2b69-749e-9e91"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[2])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191881510-e100-9761-b2a3"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[3])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191896626-e404-554e-8ed2"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[4])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191904594-0067-a227-add3"/>
            </xsl:when>
          </xsl:choose>
        </ns0:odesílatel>
      </xsl:for-each>
      <xsl:for-each select="podání:příjemce">
        <ns0:příjemce>
          <xsl:variable name="type" select="resolve-QName(@xsi:type,.)"/>
          <xsl:variable name="types">
            <xsl:sequence>
              <osoby:právnická_osoba/>
              <osoby:fyzická_osoba/>
              <osoby:podnikající_fyzická_osoba_zapsaná_v_or/>
              <osoby:podnikající_fyzická_osoba_nezapsaná_v_or/>
            </xsl:sequence>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$type=node-name($types/*[1])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191874076-2b69-749e-9e91"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[2])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191881510-e100-9761-b2a3"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[3])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191896626-e404-554e-8ed2"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[4])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191904594-0067-a227-add3"/>
            </xsl:when>
          </xsl:choose>
        </ns0:příjemce>
      </xsl:for-each>
      <xsl:for-each select="podání:uživatel_služby">
        <ns2:uživatel-služby>
          <xsl:variable name="type" select="resolve-QName(@xsi:type,.)"/>
          <xsl:variable name="types">
            <xsl:sequence>
              <osoby:právnická_osoba/>
              <osoby:fyzická_osoba/>
              <osoby:podnikající_fyzická_osoba_zapsaná_v_or/>
              <osoby:podnikající_fyzická_osoba_nezapsaná_v_or/>
            </xsl:sequence>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$type=node-name($types/*[1])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191874076-2b69-749e-9e91"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[2])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191881510-e100-9761-b2a3"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[3])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191896626-e404-554e-8ed2"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[4])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191904594-0067-a227-add3"/>
            </xsl:when>
          </xsl:choose>
        </ns2:uživatel-služby>
      </xsl:for-each>
      <xsl:for-each select="podání:použité_zastoupení">
        <ns2:použité-oprávnění-k-zastupování>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727774623050-add6-f276-8e66"/>
        </ns2:použité-oprávnění-k-zastupování>
      </xsl:for-each>
      <xsl:for-each select="podání:k_rukám">
        <ns0:k-rukám rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:k-rukám>
      </xsl:for-each>
      <xsl:for-each select="podání:vyplněn_v_isvs">
        <ns2:byl-vyplněn-v-isvs>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309315-4c31-def5-acdd"/>
        </ns2:byl-vyplněn-v-isvs>
      </xsl:for-each>
      <xsl:for-each select="podání:způsob_provedení_úkonu">
        <ns2:má-způsob-provedení-digitálního-úkonu>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309348-2251-fc6a-8fd9"/>
        </ns2:má-způsob-provedení-digitálního-úkonu>
      </xsl:for-each>
      <xsl:for-each select="podání:byl_vytvořen_formulářem">
        <ns0:byl-vytvořen-formulářem>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309422-8a40-ed3d-89c8"/>
        </ns0:byl-vytvořen-formulářem>
      </xsl:for-each>
      <xsl:for-each select="podání:počet_příloh">
        <ns0:počet-příloh rdf:datatype="http://www.w3.org/2001/XMLSchema#integer">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:počet-příloh>
      </xsl:for-each>
      <xsl:for-each select="podání:příloha">
        <ns0:obsahuje-přílohu>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309545-81f0-ebb4-be82"/>
        </ns0:obsahuje-přílohu>
      </xsl:for-each>
      <xsl:for-each select="podání:věc">
        <ns1:má-stručný-obsah-dokumentu>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:má-stručný-obsah-dokumentu>
      </xsl:for-each>
      <xsl:for-each select="podání:doručit_osvědčení_do_datové_schránky">
        <ns2:doručit-osvědčení-do-datové-schránky rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:doručit-osvědčení-do-datové-schránky>
      </xsl:for-each>
      <xsl:for-each select="podání:služba_v_přenesené_působnosti">
        <ns2:služba-v-přenesené-působnosti rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:služba-v-přenesené-působnosti>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309832-624b-b643-b039">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/jednoznačný-identifikátor"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="podání:jid">
        <ns0:řetězcová-podoba-jednoznačného-identifikátoru rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:řetězcová-podoba-jednoznačného-identifikátoru>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173504787-1106-9848-b26a">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/499/2004/pojem/dokument-veřejnoprávního-původce"/>
      <xsl:copy-of select="$arc"/>
      <ns3:je-opatřen-identifikátorem>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173530933-5387-c9b3-9a60">
          <xsl:with-param name="no_iri" select="true()"/>
        </xsl:call-template>
      </ns3:je-opatřen-identifikátorem>
      <ns1:má-evidenční-číslo-ze-samostatné-evidence-dokumentů>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173531006-9f58-3229-9fc2">
          <xsl:with-param name="no_iri" select="true()"/>
        </xsl:call-template>
      </ns1:má-evidenční-číslo-ze-samostatné-evidence-dokumentů>
      <xsl:for-each select="podání:číslo_jednací">
        <ns1:má-číslo-jednací rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:má-číslo-jednací>
      </xsl:for-each>
      <ns3:je-zařazen-do-spisu>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173530968-8bce-ffa5-b12d">
          <xsl:with-param name="no_iri" select="true()"/>
        </xsl:call-template>
      </ns3:je-zařazen-do-spisu>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727774623050-add6-f276-8e66">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/oprávnění-k-zastupování"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="podání:okz">
        <ns4:identifikátor-oprávnění-k-zastupování rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns4:identifikátor-oprávnění-k-zastupování>
      </xsl:for-each>
      <xsl:for-each select="podání:zastoupený">
        <ns2:zastoupený>
          <xsl:variable name="type" select="resolve-QName(@xsi:type,.)"/>
          <xsl:variable name="types">
            <xsl:sequence>
              <osoby:právnická_osoba/>
              <osoby:fyzická_osoba/>
              <osoby:podnikající_fyzická_osoba_zapsaná_v_or/>
              <osoby:podnikající_fyzická_osoba_nezapsaná_v_or/>
            </xsl:sequence>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$type=node-name($types/*[1])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191874076-2b69-749e-9e91"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[2])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191881510-e100-9761-b2a3"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[3])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191896626-e404-554e-8ed2"/>
            </xsl:when>
            <xsl:when test="$type=node-name($types/*[4])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727191904594-0067-a227-add3"/>
            </xsl:when>
          </xsl:choose>
        </ns2:zastoupený>
      </xsl:for-each>
      <xsl:for-each select="podání:zástupce">
        <ns2:zástupce>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727280250648-5253-44c4-a1e6"/>
        </ns2:zástupce>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309315-4c31-def5-acdd">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/365/2000/pojem/informační-systém-veřejné-správy"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="podání:kód">
        <ns5:má-identifikátor-isvs rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns5:má-identifikátor-isvs>
      </xsl:for-each>
      <xsl:for-each select="podání:název">
        <ns6:název-isvs>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns6:název-isvs>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309348-2251-fc6a-8fd9">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/generický/standard-pro-elektronické-formuláře/pojem/způsob-povedení-digitálního-úkonu"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="podání:kód">
        <ns7:kód-položky-číselníku rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns7:kód-položky-číselníku>
      </xsl:for-each>
      <xsl:for-each select="podání:název">
        <ns7:plný-název-položky-číselníku>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns7:plný-název-položky-číselníku>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309422-8a40-ed3d-89c8">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/12/2020/pojem/elektronický-formulář"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="podání:identifikátor">
        <ns2:má-identifikátor-formuláře rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:má-identifikátor-formuláře>
      </xsl:for-each>
      <xsl:for-each select="podání:název">
        <ns8:název-formuláře>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns8:název-formuláře>
      </xsl:for-each>
      <xsl:for-each select="podání:verze">
        <ns2:verze rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:verze>
      </xsl:for-each>
      <xsl:for-each select="podání:úkon">
        <ns8:umožňuje-činit-úkon>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727193644579-0217-07ed-a043"/>
        </ns8:umožňuje-činit-úkon>
      </xsl:for-each>
      <xsl:for-each select="podání:služba">
        <ns8:umožňuje-činit-úkon-služby>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727193644627-8006-e10c-a984"/>
        </ns8:umožňuje-činit-úkon-služby>
      </xsl:for-each>
      <xsl:for-each select="podání:agenda">
        <ns8:umožňuje-činit-úkon-služby-agendy>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727193644678-b5a9-5d06-b1b8"/>
        </ns8:umožňuje-činit-úkon-služby-agendy>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173309545-81f0-ebb4-be82">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/příloha"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="podání:název">
        <ns0:název-přílohy>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:název-přílohy>
      </xsl:for-each>
      <xsl:for-each select="podání:název_souboru">
        <ns0:název-souboru-přílohy rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:název-souboru-přílohy>
      </xsl:for-each>
      <xsl:for-each select="podání:typ_média">
        <ns9:má-typ-média>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns9:má-typ-média>
      </xsl:for-each>
      <xsl:for-each select="podání:obsah">
        <ns0:obsah-přílohy rdf:datatype="http://www.w3.org/2001/XMLSchema#base64Binary">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:obsah-přílohy>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727193644579-0217-07ed-a043">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/12/2020/pojem/digitální-úkon"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="podání:kód">
        <ns5:má-identifikátor-úkonu-služby rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns5:má-identifikátor-úkonu-služby>
      </xsl:for-each>
      <xsl:for-each select="podání:název">
        <ns5:má-název-úkonu-služby>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns5:má-název-úkonu-služby>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727193644627-8006-e10c-a984">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/služba-veřejné-správy"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="podání:kód">
        <ns5:má-identifikátor-služby rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns5:má-identifikátor-služby>
      </xsl:for-each>
      <xsl:for-each select="podání:název">
        <ns5:má-název-služby>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns5:má-název-služby>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727193644678-b5a9-5d06-b1b8">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/agenda"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="podání:kód">
        <ns4:má-kód-agendy rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns4:má-kód-agendy>
      </xsl:for-each>
      <xsl:for-each select="podání:název">
        <ns4:má-název-agendy>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns4:má-název-agendy>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173530933-5387-c9b3-9a60">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/499/2004/pojem/jednoznačný-identifikátor"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="podání:jid">
        <ns0:řetězcová-podoba-jednoznačného-identifikátoru rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:řetězcová-podoba-jednoznačného-identifikátoru>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173531006-9f58-3229-9fc2">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/259/2012/pojem/evidenční-číslo-ze-samostatné-evidence-dokumentů"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="podání:evidenční_číslo">
        <ns0:řetězcová-podoba-evidenčního-čísla rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:řetězcová-podoba-evidenčního-čísla>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727173530968-8bce-ffa5-b12d">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/499/2004/pojem/spis"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="podání:spisová_značka">
        <ns1:má-spisovou-značku rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:má-spisovou-značku>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
