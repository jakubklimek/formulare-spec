<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:místa="https://ofn.gov.cz/jmenný-prostor/podání/místa" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="https://slovník.gov.cz/generický/umístění/pojem/" xmlns:ns1="https://slovník.gov.cz/generický/adresy/pojem/" xmlns:ns2="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/">
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/místa:adresa_rúian">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183542522-286c-e56a-aa7b"/>
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
  <xsl:template match="/místa:adresní_místo">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183547044-2926-013f-a5e2"/>
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
  <xsl:template match="/místa:zahraniční_adresa">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183551327-68ed-4354-8486"/>
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
  <xsl:template match="/místa:adresa_textem">
    <rdf:RDF>
      <xsl:variable name="result">
        <xsl:sequence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183555587-5fa1-4164-9e01"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183542522-286c-e56a-aa7b">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/místo"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="místa:adresa_rúian">
        <ns0:má-adresu>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727155970820-d457-b51c-a945"/>
        </ns0:má-adresu>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183547044-2926-013f-a5e2">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/místo"/>
      <xsl:copy-of select="$arc"/>
      <ns0:má-adresu>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727156531147-2eb9-93b7-a2cc">
          <xsl:with-param name="no_iri" select="true()"/>
        </xsl:call-template>
      </ns0:má-adresu>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183551327-68ed-4354-8486">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/místo"/>
      <xsl:copy-of select="$arc"/>
      <ns0:má-zahraniční-adresu>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727156605344-5dc0-a0a6-994a">
          <xsl:with-param name="no_iri" select="true()"/>
        </xsl:call-template>
      </ns0:má-zahraniční-adresu>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183555587-5fa1-4164-9e01">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/místo"/>
      <xsl:copy-of select="$arc"/>
      <ns0:má-adresu>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727165482541-62bd-239d-be84">
          <xsl:with-param name="no_iri" select="true()"/>
        </xsl:call-template>
      </ns0:má-adresu>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727165482541-62bd-239d-be84">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/adresa"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="místa:třířádková_adresa_textem">
        <ns1:text-adresy rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:text-adresy>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727156605344-5dc0-a0a6-994a">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/generický/umístění/pojem/zahraniční-adresa"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="místa:zahraniční_adresa">
        <ns0:lokalizační-popis rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:lokalizační-popis>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727156531147-2eb9-93b7-a2cc">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/adresa"/>
      <xsl:copy-of select="$arc"/>
      <xsl:variable name="arc">
        <ns2:má-adresu>
          <rdf:Description>
            <xsl:copy-of select="$id//@*"/>
          </rdf:Description>
        </ns2:má-adresu>
      </xsl:variable>
      <top-level>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727156556587-187f-7b99-800a">
          <xsl:with-param name="arc" select="$arc"/>
          <xsl:with-param name="no_iri" select="true()"/>
        </xsl:call-template>
      </top-level>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727156556587-187f-7b99-800a">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/adresní-místo"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="místa:kód_adresního_místa">
        <ns2:má-kód-adresního-místa rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:má-kód-adresního-místa>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727155970820-d457-b51c-a945">
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
      <rdf:type rdf:resource="https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/adresa"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="místa:název_ulice">
        <ns2:má-název-ulice>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:má-název-ulice>
      </xsl:for-each>
      <xsl:for-each select="místa:číslo_domovní">
        <ns2:má-číslo-domovní rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:má-číslo-domovní>
      </xsl:for-each>
      <xsl:for-each select="místa:typ_čísla_domovního">
        <ns1:typ-čísla-domovního rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:typ-čísla-domovního>
      </xsl:for-each>
      <xsl:for-each select="místa:má_číslo_orientační">
        <ns2:má-číslo-orientační rdf:datatype="http://www.w3.org/2001/XMLSchema#integer">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:má-číslo-orientační>
      </xsl:for-each>
      <xsl:for-each select="místa:znak_čísla_orientačního">
        <ns1:znak-čísla-orientačního rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:znak-čísla-orientačního>
      </xsl:for-each>
      <xsl:for-each select="místa:část_obce">
        <ns2:má-název-části-obce>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:má-název-části-obce>
      </xsl:for-each>
      <xsl:for-each select="místa:obec_nebo_vojenský_újezd">
        <ns2:má-název-obce-nebo-vojenského-újezdu>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:má-název-obce-nebo-vojenského-újezdu>
      </xsl:for-each>
      <xsl:for-each select="místa:okres">
        <ns2:má-název-okresu>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:má-název-okresu>
      </xsl:for-each>
      <xsl:for-each select="místa:katastrální_území">
        <ns2:má-název-katastrálního-území>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:má-název-katastrálního-území>
      </xsl:for-each>
      <xsl:for-each select="místa:městský_obvod_v_praze">
        <ns2:má-název-městského-obvodu-v-hlavním-městě-praze>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:má-název-městského-obvodu-v-hlavním-městě-praze>
      </xsl:for-each>
      <xsl:for-each select="místa:psč">
        <ns1:poštovní-směrovací-číslo rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:poštovní-směrovací-číslo>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
