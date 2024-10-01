<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:osoby="https://ofn.gov.cz/jmenný-prostor/podání/osoby" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:místa="https://ofn.gov.cz/jmenný-prostor/podání/místa" xmlns:ns0="https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/">
  <xsl:import href="../místo/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/osoby:osoba_ve_vztahu_k_dokumentu">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727781423973-f8b2-ef43-983c"/>
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
  <xsl:template match="/osoby:fyzická_osoba">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727781455324-19b0-ea50-a017"/>
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
  <xsl:template match="/osoby:fyzická_osoba_eidas">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790068060-800f-1f0d-bfb0"/>
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
  <xsl:template match="/osoby:právnická_osoba">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790074947-2223-3c55-b14a"/>
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
  <xsl:template match="/osoby:právnická_osoba_eidas">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790081708-36a4-c28c-9339"/>
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
  <xsl:template match="/osoby:podnikající_fyzická_osoba_zapsaná_v_or">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790088059-e223-fb14-8d07"/>
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
  <xsl:template match="/osoby:podnikající_fyzická_osoba_nezapsaná_v_or">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790092370-dfb7-d244-a202"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727781423973-f8b2-ef43-983c">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/osoba-ve-vztahu-k-dokumentu"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="osoby:doručovací_místo">
        <ns0:doručovací-místo>
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
        </ns0:doručovací-místo>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727781455324-19b0-ea50-a017">
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
      <xsl:for-each select="osoby:doručovací_místo">
        <ns0:doručovací-místo>
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
        </ns0:doručovací-místo>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790068060-800f-1f0d-bfb0">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/fyzická-osoba-identifikovaná-skrz-eidas-jako-osoba-ve-vztahu-k-dokumentu"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="osoby:doručovací_místo">
        <ns0:doručovací-místo>
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
        </ns0:doručovací-místo>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790074947-2223-3c55-b14a">
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
      <xsl:for-each select="osoby:doručovací_místo">
        <ns0:doručovací-místo>
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
        </ns0:doručovací-místo>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790081708-36a4-c28c-9339">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/právnická-osoba-identifikovaná-skrz-eidas-jako-osoba-ve-vztahu-k-dokumentu"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="osoby:doručovací_místo">
        <ns0:doručovací-místo>
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
        </ns0:doručovací-místo>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790088059-e223-fb14-8d07">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/podnikající-fyzická-osoba-zapsaná-v-obchodním-rejstříku-jako-osoba-ve-vztahu-k-dokumentu"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="osoby:doručovací_místo">
        <ns0:doručovací-místo>
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
        </ns0:doručovací-místo>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727790092370-dfb7-d244-a202">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/generický/standard-pro-elektronické-dokumenty/pojem/podnikající-fyzická-osoba-nezapsaná-v-obchodním-rejstříku-jako-osoba-ve-vztahu-k-dokumentu"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="osoby:doručovací_místo">
        <ns0:doručovací-místo>
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
        </ns0:doručovací-místo>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
