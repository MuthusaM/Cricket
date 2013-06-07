<?xml version='1.0' ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<match_bbb>
      <xsl:attribute name="feed_source">
        <xsl:text>opta</xsl:text>
      </xsl:attribute>
			<m>
				<xsl:attribute name="id">
					<xsl:value-of select="BallSummary/BallDetail/@game_id"/>
				</xsl:attribute>
        <xsl:attribute name="compl">
          <xsl:value-of select="BallSummary/BallDetail/@game_completed"/>
        </xsl:attribute>
			</m>
			<i>
				<xsl:attribute name="no">
					<xsl:value-of select="BallSummary/BallDetail/@innings_id"/>
				</xsl:attribute>
        <xsl:attribute name="decl">
          <xsl:value-of select="BallSummary/BallDetail/@innings_decl"/>
        </xsl:attribute>
        <xsl:attribute name="forfeit">
          <xsl:value-of select="BallSummary/BallDetail/@innings_forfeit"/>
        </xsl:attribute>
        <xsl:attribute name="compl">
          <xsl:value-of select="BallSummary/BallDetail/@innings_compl"/>
        </xsl:attribute>
        <xsl:if test="BallSummary/BallDetail/@over_number=1 and BallSummary/BallDetail/@over_ball_number=1">
          <xsl:attribute name="opener1_id">
            <xsl:value-of select="BallSummary/BallDetail/@batsman_id"/>
          </xsl:attribute>
          <xsl:attribute name="opener2_id">
            <xsl:value-of select="BallSummary/BallDetail/@ns_batsman_id"/>
          </xsl:attribute>
        </xsl:if>
				<o>
					<xsl:attribute name="no">
						<xsl:value-of select="BallSummary/BallDetail/@over_number"/>
					</xsl:attribute>
          <xsl:attribute name="m">
            <xsl:value-of select="BallSummary/BallDetail/@maiden"/>
          </xsl:attribute>
          <xsl:attribute name="compl">
            <xsl:choose>
              <xsl:when test="BallSummary/BallDetail/@over_ball_number=6">
                <xsl:text>true</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>false</xsl:text>
              </xsl:otherwise>
            </xsl:choose>           
          </xsl:attribute>
          <xsl:if test="BallSummary/BallDetail/@innings_id=1 and BallSummary/BallDetail/@over_number=1">
            <xsl:attribute name="innings1maxovers">
              <xsl:value-of select="BallSummary/BallDetail/@innings1maxovers"/>
            </xsl:attribute>
          </xsl:if>          
          <xsl:attribute name="target">
            <xsl:value-of select="BallSummary/BallDetail/@target"/>
          </xsl:attribute>
          <xsl:attribute name="maxovers">
            <xsl:value-of select="BallSummary/BallDetail/@maxovers"/>
          </xsl:attribute>
          <xsl:attribute name="ppNo">
            <xsl:value-of select="BallSummary/BallDetail/@ppNo"/>
          </xsl:attribute>
          <xsl:attribute name="ppWhichSide">
            <xsl:value-of select="BallSummary/BallDetail/@ppWhichSide"/>
          </xsl:attribute>
          <xsl:attribute name="r">
            <xsl:value-of select="BallSummary/BallDetail/@r"/>
          </xsl:attribute>
          <xsl:attribute name="w">
            <xsl:value-of select="BallSummary/BallDetail/@w"/>
          </xsl:attribute>
					<b>
						<xsl:attribute name="no">
							<xsl:value-of select="BallSummary/BallDetail/@over_ball_number"/>
						</xsl:attribute>
						<xsl:attribute name="act">
							<xsl:value-of select="BallSummary/BallDetail/@display_ball_number"/>
						</xsl:attribute>
						<xsl:attribute name="bowl">
							<xsl:value-of select="BallSummary/BallDetail/@bowler_id"/>
						</xsl:attribute>
						<xsl:attribute name="bat">
							<xsl:value-of select="BallSummary/BallDetail/@batsman_id"/>
						</xsl:attribute>
            <xsl:attribute name="aline">
              <xsl:value-of select="BallSummary/BallDetail/@bowling_line"/>
            </xsl:attribute>
            <xsl:attribute name="alen">
              <xsl:value-of select="BallSummary/BallDetail/@bowling_length"/>
            </xsl:attribute>
						<xsl:attribute name="shot">
							<xsl:value-of select="BallSummary/BallDetail/@batting_shot_type"/>
						</xsl:attribute>
						<xsl:attribute name="type">
							<xsl:value-of select="BallSummary/BallDetail/@bowling_detail"/>
						</xsl:attribute>
						<xsl:attribute name="runs">
							<xsl:value-of select="BallSummary/BallDetail/@batsman_runs"/>
						</xsl:attribute>
						<xsl:attribute name="ex">
							<xsl:value-of select="BallSummary/BallDetail/@team_runs - BallSummary/BallDetail/@batsman_runs"/>
						</xsl:attribute>
						<xsl:attribute name="nb">
							<xsl:value-of select="BallSummary/BallDetail/@no_ball"/>
						</xsl:attribute>
						<xsl:attribute name="w">
							<xsl:value-of select="BallSummary/BallDetail/@wide"/>
						</xsl:attribute>
						<xsl:attribute name="lb">
							<xsl:value-of select="BallSummary/BallDetail/@leg_bye"/>
						</xsl:attribute>
            <xsl:attribute name="bye">
              <xsl:value-of select="BallSummary/BallDetail/@bye"/>
            </xsl:attribute>
            <xsl:attribute name="tot">
              <xsl:value-of select="BallSummary/BallDetail/@tot"/>
            </xsl:attribute>
            <xsl:attribute name="wick">
              <xsl:value-of select="BallSummary/BallDetail/@wick"/>
            </xsl:attribute>
            <xsl:attribute name="s_r">
              <xsl:value-of select="BallSummary/BallDetail/@s_r"/>
            </xsl:attribute>
            <xsl:attribute name="s_b">
              <xsl:value-of select="BallSummary/BallDetail/@s_b"/>
            </xsl:attribute>
            <xsl:attribute name="s_4">
              <xsl:value-of select="BallSummary/BallDetail/@s_4"/>
            </xsl:attribute>
            <xsl:attribute name="s_6">
              <xsl:value-of select="BallSummary/BallDetail/@s_6"/>
            </xsl:attribute>
            <xsl:attribute name="b_o">
              <xsl:value-of select="BallSummary/BallDetail/@b_o"/>
            </xsl:attribute>
            <xsl:attribute name="b_m">
              <xsl:value-of select="BallSummary/BallDetail/@b_m"/>
            </xsl:attribute>
            <xsl:attribute name="b_r">
              <xsl:value-of select="BallSummary/BallDetail/@b_r"/>
            </xsl:attribute>
            <xsl:attribute name="b_w">
              <xsl:value-of select="BallSummary/BallDetail/@b_w"/>
            </xsl:attribute>
            <xsl:attribute name="day">
              <xsl:value-of select="BallSummary/BallDetail/@day"/>
            </xsl:attribute>
            <xsl:attribute name="sess">
              <xsl:value-of select="BallSummary/BallDetail/@sess"/>
            </xsl:attribute>
            <xsl:if test="BallSummary/BallDetail/@appeal_id =1">
              <e>
              <xsl:attribute name="eid">
                <xsl:text>20</xsl:text>
              </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@fielder1_action_id =23 or BallSummary/BallDetail/@fielder2_action_id =23 or BallSummary/BallDetail/@fielder3_action_id =23 or BallSummary/BallDetail/@fielder4_action_id =23">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>24</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@no_ball >0">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>25</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@wide >0">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>26</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@leg_bye >0">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>27</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@bye >0">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>28</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@boundary =1">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>29</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@fielder1_action_id =3 or BallSummary/BallDetail/@fielder2_action_id =3 or BallSummary/BallDetail/@fielder3_action_id =3 or BallSummary/BallDetail/@fielder4_action_id =3">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>31</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@no_ball >0 and BallSummary/BallDetail/@leg_bye >0">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>34</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@no_ball >0 and BallSummary/BallDetail/@bye >0">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>35</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@fielder1_action_id =1 or BallSummary/BallDetail/@fielder2_action_id =1 or BallSummary/BallDetail/@fielder3_action_id =1 or BallSummary/BallDetail/@fielder4_action_id =1">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>36</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@fielder1_action_id =2 or BallSummary/BallDetail/@fielder2_action_id =2 or BallSummary/BallDetail/@fielder3_action_id =2 or BallSummary/BallDetail/@fielder4_action_id =2">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>37</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@fielder1_action_id =8 or BallSummary/BallDetail/@fielder2_action_id =8 or BallSummary/BallDetail/@fielder3_action_id =8 or BallSummary/BallDetail/@fielder4_action_id =8">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>39</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@fielder1_action_id =20 or BallSummary/BallDetail/@fielder2_action_id =20 or BallSummary/BallDetail/@fielder3_action_id =20 or BallSummary/BallDetail/@fielder4_action_id =20">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>40</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@fielder1_action_id =22 or BallSummary/BallDetail/@fielder2_action_id =22 or BallSummary/BallDetail/@fielder3_action_id =22 or BallSummary/BallDetail/@fielder4_action_id =22">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>41</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@dismissal_id=13">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>42</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@batting_connection=3 or BallSummary/BallDetail/@batting_connection=4 or BallSummary/BallDetail/@batting_connection=5 or BallSummary/BallDetail/@batting_connection=6 or BallSummary/BallDetail/@batting_connection=7 or BallSummary/BallDetail/@batting_connection=14">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>43</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@appeal_type_name ='Not Out'">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>44</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@batting_connection=2">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>46</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@air_controlled=1">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>47</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@air_not_controlled=1">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>48</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@batting_feet>1">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>49</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@new_ball=1">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>50</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@bowling_from=2">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>52</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@free_hit=1">
              <e>
                <xsl:attribute name="eid">
                  <xsl:text>54</xsl:text>
                </xsl:attribute>
              </e>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@dismissal_id > 0 or BallSummary/BallDetail/@dismissal_id != ''">
              <wkt>
                <xsl:attribute name="no">
                  <xsl:value-of select="BallSummary/BallDetail/@wicket_no"/>
                </xsl:attribute>
                <xsl:attribute name="pid">
                  <xsl:value-of select="BallSummary/BallDetail/@dismissal_player_id"/>
                </xsl:attribute>
                <xsl:attribute name="did">
                  <xsl:value-of select="BallSummary/BallDetail/@dismissal_id"/>
                </xsl:attribute>
                <xsl:attribute name="next_bat_1">
                  <xsl:value-of select="BallSummary/BallDetail/@next_bat_1"/>
                </xsl:attribute>
                <xsl:attribute name="next_bat_2">
                  <xsl:value-of select="BallSummary/BallDetail/@next_bat_2"/>
                </xsl:attribute>
              </wkt>
            </xsl:if>						
						<xsl:value-of select="BallSummary/BallDetail"/>
            <xsl:if test="BallSummary/BallDetail/@fielder1_id >0 or BallSummary/BallDetail/@fielder1_id !=''">
              <f>
                <xsl:attribute name="pid">
                  <xsl:value-of select="BallSummary/BallDetail/@fielder1_id"/>
                </xsl:attribute>
                <xsl:attribute name="eid">
                  <xsl:value-of select="BallSummary/BallDetail/@fielder1_action_id"/>
                </xsl:attribute>
              </f>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@fielder2_id >0 or BallSummary/BallDetail/@fielder2_id !=''">
              <f>
                <xsl:attribute name="pid">
                  <xsl:value-of select="BallSummary/BallDetail/@fielder2_id"/>
                </xsl:attribute>
                <xsl:attribute name="eid">
                  <xsl:value-of select="BallSummary/BallDetail/@fielder2_action_id"/>
                </xsl:attribute>
              </f>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@fielder3_id >0 or BallSummary/BallDetail/@fielder3_id !=''">
              <f>
                <xsl:attribute name="pid">
                  <xsl:value-of select="BallSummary/BallDetail/@fielder3_id"/>
                </xsl:attribute>
                <xsl:attribute name="eid">
                  <xsl:value-of select="BallSummary/BallDetail/@fielder3_action_id"/>
                </xsl:attribute>
              </f>
            </xsl:if>
            <xsl:if test="BallSummary/BallDetail/@fielder4_id >0 or BallSummary/BallDetail/@fielder4_id !=''">
              <f>
                <xsl:attribute name="pid">
                  <xsl:value-of select="BallSummary/BallDetail/@fielder4_id"/>
                </xsl:attribute>
                <xsl:attribute name="eid">
                  <xsl:value-of select="BallSummary/BallDetail/@fielder4_action_id"/>
                </xsl:attribute>
              </f>
            </xsl:if>
						
					</b>
				</o>
			</i>
		</match_bbb>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="C50- ballbyball.xml" userelativepaths="yes" externalpreview="no" url="C50- ballbyball.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="bGenerateByteCode" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="ballbyballxml.xml" destSchemaRoot="match_bbb" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="C50- ballbyball.xml" srcSchemaRoot="BallSummary" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/"></template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->