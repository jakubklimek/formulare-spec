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
    <místa:adresa_rúian>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183542522-286c-e56a-aa7b">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </místa:adresa_rúian>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/místo&#34;]">
    <místa:adresní_místo>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183547044-2926-013f-a5e2">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </místa:adresní_místo>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/místo&#34;]">
    <místa:zahraniční_adresa>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183551327-68ed-4354-8486">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </místa:zahraniční_adresa>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/89/2012/pojem/místo&#34;]">
    <místa:adresa_textem>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183555587-5fa1-4164-9e01">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </místa:adresa_textem>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183542522-286c-e56a-aa7b">
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
      <místa:adresa_rúian>
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727155970820-d457-b51c-a945">
          <xsl:with-param name="id">
            <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
          </xsl:with-param>
        </xsl:call-template>
      </místa:adresa_rúian>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183547044-2926-013f-a5e2">
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
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727156531147-2eb9-93b7-a2cc">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183551327-68ed-4354-8486">
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
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727156605344-5dc0-a0a6-994a">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727183555587-5fa1-4164-9e01">
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
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727165482541-62bd-239d-be84">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727165482541-62bd-239d-be84">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/adresy/pojem/text-adresy&#34;]">
      <místa:třířádková_adresa_textem>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:třířádková_adresa_textem>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727156605344-5dc0-a0a6-994a">
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
      <místa:zahraniční_adresa>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:zahraniční_adresa>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727156531147-2eb9-93b7-a2cc">
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
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727156556587-187f-7b99-800a">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
        <xsl:with-param name="no_iri" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727156556587-187f-7b99-800a">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-kód-adresního-místa&#34;]">
      <místa:kód_adresního_místa>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:kód_adresního_místa>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1727155970820-d457-b51c-a945">
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
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-název-ulice&#34;]">
      <místa:název_ulice>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:název_ulice>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-číslo-domovní&#34;]">
      <místa:číslo_domovní>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:číslo_domovní>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/adresy/pojem/typ-čísla-domovního&#34;]">
      <místa:typ_čísla_domovního>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:typ_čísla_domovního>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-číslo-orientační&#34;]">
      <místa:má_číslo_orientační>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:má_číslo_orientační>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/adresy/pojem/znak-čísla-orientačního&#34;]">
      <místa:znak_čísla_orientačního>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:znak_čísla_orientačního>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-název-části-obce&#34;]">
      <místa:část_obce>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:část_obce>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-název-obce-nebo-vojenského-újezdu&#34;]">
      <místa:obec_nebo_vojenský_újezd>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:obec_nebo_vojenský_újezd>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-název-okresu&#34;]">
      <místa:okres>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:okres>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-název-katastrálního-území&#34;]">
      <místa:katastrální_území>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:katastrální_území>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/legislativní/sbírka/111/2009/pojem/má-název-městského-obvodu-v-hlavním-městě-praze&#34;]">
      <místa:městský_obvod_v_praze>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:městský_obvod_v_praze>
    </xsl:for-each>
    <xsl:for-each select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://slovník.gov.cz/generický/adresy/pojem/poštovní-směrovací-číslo&#34;]">
      <místa:psč>
        <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
      </místa:psč>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
