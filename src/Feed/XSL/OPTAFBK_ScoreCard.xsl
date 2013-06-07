<?xml version='1.0' ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
  <xsl:template name="max">
    <xsl:param name="pSeq"/>

    <xsl:variable name="vLen" select="count($pSeq)"/>
    <xsl:value-of select="$vLen"/>
    <!--<xsl:if test="$vLen > 0">
      <xsl:choose>
        <xsl:when test="$vLen = 1">
          <xsl:value-of select="$pSeq[1]"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="vHalf"
           select="floor($vLen div 2)"/>

          <xsl:variable name="vMax1">
            <xsl:call-template name="max">
              <xsl:with-param name="pSeq"
               select="$pSeq[not(position() > $vHalf)]"/>
            </xsl:call-template>
          </xsl:variable>

          <xsl:variable name="vMax2">
            <xsl:call-template name="max">
              <xsl:with-param name="pSeq"
               select="$pSeq[position() > $vHalf]"/>
            </xsl:call-template>
          </xsl:variable>

          <xsl:choose>
            <xsl:when test="$vMax1 >= $vMax2">
              <xsl:value-of select="$vMax1"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$vMax2"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>-->
  </xsl:template>

  <xsl:template name="Sum">
    <xsl:variable name="vMax2">
      <xsl:call-template name="max">
        <xsl:with-param name="pSeq"
             select="/CricketMatchSummary/Innings/@id"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:for-each select ="/CricketMatchSummary/Innings">
      <xsl:if test="@id = $vMax2">
        <xsl:value-of select="concat(sum(Bowlers/Bowler/@overs_bowled),'.',sum(Bowlers/Bowler/@balls_bowled))"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="/">
		<match_scorecard>
      <xsl:attribute name="feed_source">
        <xsl:text>opta</xsl:text>
      </xsl:attribute>
			<match_details>
				<xsl:attribute name="match_id">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@game_id"/>
				</xsl:attribute>
				<xsl:attribute name="match_date">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@game_date"/>
				</xsl:attribute>
				<xsl:attribute name="match_type">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@match_type"/>
				</xsl:attribute>
				<xsl:attribute name="match_days">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@number_days"/>
				</xsl:attribute>
				<xsl:attribute name="match_innings">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@match_innings"/>
				</xsl:attribute>      
        <xsl:variable name="osum">
          <xsl:call-template name="Sum"/>
        </xsl:variable>
       <xsl:attribute name="match_overs">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@match_overs"/>
				</xsl:attribute>
				<xsl:attribute name="number_batsmen">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@number_batsmen"/>
				</xsl:attribute>
				<xsl:attribute name="toss_winning_team_id">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@toss_team_id"/>
				</xsl:attribute>
				<xsl:attribute name="toss_decision">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@toss_decision"/>
				</xsl:attribute>
				<xsl:attribute name="umpire1_id">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/Officials/@official_1_id"/>
				</xsl:attribute>
				<xsl:attribute name="umpire2_id">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/Officials/@official_2_id"/>
				</xsl:attribute>
				<xsl:attribute name="tv_umpire_id">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/Officials/@official_3_id"/>
				</xsl:attribute>
				<xsl:attribute name="reserve_umpire_id">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/Officials/@official_4_id"/>
				</xsl:attribute>
				<xsl:attribute name="referee_id">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/Officials/@official_5_id"/>
				</xsl:attribute>
				<xsl:attribute name="minimum_required_overs">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@minimum_required_overs"/>
				</xsl:attribute>
				<xsl:attribute name="adjusted_target">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@adjusted_target"/>
				</xsl:attribute>
				<xsl:attribute name="venue_id">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@venue_id"/>
				</xsl:attribute>
				<xsl:attribute name="match_result">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@result"/>
				</xsl:attribute>
				<xsl:attribute name="man_of_match">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@man_of_match"/>
				</xsl:attribute>
				<xsl:attribute name="man_of_series">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@man_of_series"/>
				</xsl:attribute>
				<xsl:attribute name="series_result">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@series_result"/>
				</xsl:attribute>
				<xsl:attribute name="current_day">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@match_day"/>
				</xsl:attribute>
				<xsl:attribute name="current_session">
					<xsl:value-of select="CricketMatchSummary/MatchDetail/@current_session"/>
				</xsl:attribute>
				<xsl:attribute name="current_ball_no">
					<xsl:value-of select="$osum"/>
				</xsl:attribute>
        <xsl:attribute name="away_batting_bonus">
          <xsl:value-of select="CricketMatchSummary/MatchDetail/@away_batting_bonus"/>
        </xsl:attribute>
        <xsl:attribute name="away_bowling_bonus">
          <xsl:value-of select="CricketMatchSummary/MatchDetail/@away_bowling_bonus"/>
        </xsl:attribute>
        <xsl:attribute name="home_batting_bonus">
          <xsl:value-of select="CricketMatchSummary/MatchDetail/@home_batting_bonus"/>
        </xsl:attribute>
        <xsl:attribute name="home_bowling_bonus">
          <xsl:value-of select="CricketMatchSummary/MatchDetail/@home_bowling_bonus"/>
        </xsl:attribute>
        <xsl:attribute name="result_id">
          <xsl:value-of select="CricketMatchSummary/MatchDetail/@result_id"/>
        </xsl:attribute>
        <xsl:attribute name="status_id">
          <xsl:value-of select="CricketMatchSummary/MatchDetail/@status_id"/>
        </xsl:attribute>
        


        <xsl:value-of select="CricketMatchSummary/MatchDetail"/>
			</match_details>
			<players>
				<xsl:for-each select="CricketMatchSummary/PlayerDetail/Team/Player">
					<player>
						<xsl:attribute name="team_id">
							<xsl:value-of select="../@team_id"/>
						</xsl:attribute>
						<xsl:attribute name="player_id">
							<xsl:value-of select="@id"/>
						</xsl:attribute>
						<xsl:attribute name="first_name">
							<xsl:value-of select="@player_first_name"/>
						</xsl:attribute>
						<xsl:attribute name="last_name">
							<xsl:value-of select="@player_last_name"/>
						</xsl:attribute>
						<xsl:if test="@captain = -1">
							<xsl:attribute name="captain"><xsl:text>true</xsl:text></xsl:attribute>
						</xsl:if>
						<xsl:if test="@keeper = -1">
							<xsl:attribute name="keeper"><xsl:text>true</xsl:text></xsl:attribute>
						</xsl:if>
					</player>
				</xsl:for-each>
				<xsl:value-of select="CricketMatchSummary/PlayerDetail"/>
				<xsl:value-of select="CricketMatchSummary/PlayerDetail"/>
			</players>
			<xsl:for-each select="CricketMatchSummary/Innings">
				<innings>
					<xsl:attribute name="innings_no">
						<xsl:value-of select="@id"/>
					</xsl:attribute>
					<xsl:attribute name="batting_team_id">
						<xsl:value-of select="@batting_team_id"/>
					</xsl:attribute>
          <xsl:choose>
            <xsl:when test="@declared=1">
              <xsl:attribute name="declared">
                <xsl:text>true</xsl:text>
              </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="declared">
                <xsl:text>false</xsl:text>
              </xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="@forfeited=1">
              <xsl:attribute name="forfeit">
                <xsl:text>true</xsl:text>
              </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="forfeit">
                <xsl:text>false</xsl:text>
              </xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>				
					<xsl:attribute name="all_out">
						<xsl:value-of select="@all_out"/>
					</xsl:attribute>
					<xsl:attribute name="complete">
						<xsl:value-of select="@complete"/>
					</xsl:attribute>
					<xsl:attribute name="team_batting_time">
						<xsl:value-of select="@team_batting_time"/>
					</xsl:attribute>
					<xsl:attribute name="maximum_overs">
						<xsl:value-of select="@maximum_overs"/>
					</xsl:attribute>
					<xsl:attribute name="innings_started">
						<xsl:value-of select="@innings_started"/>
					</xsl:attribute>
					<batting_card>
						<xsl:for-each select="Batsmen/Batsman">
              <xsl:if test="@balls_faced &gt; 0">
                <batsman>
                  <xsl:attribute name="batting_order">
                    <xsl:value-of select="@order"/>
                  </xsl:attribute>
                  <xsl:attribute name="player_id">
                    <xsl:value-of select="@id"/>
                  </xsl:attribute>
                  <xsl:variable name="playerid" select="@id"></xsl:variable>
                  <xsl:attribute name="player_name">
                  <xsl:for-each select ="/CricketMatchSummary/PlayerDetail/Team/Player">
                    <xsl:if test="@id = $playerid">
                      <xsl:value-of select="@player_name"/>
                    </xsl:if>
                  </xsl:for-each>
                  </xsl:attribute>                 
                  <xsl:attribute name="runs">
                    <xsl:value-of select="@runs_scored"/>
                  </xsl:attribute>
                  <xsl:attribute name="balls">
                    <xsl:value-of select="@balls_faced"/>
                  </xsl:attribute>
                  <xsl:attribute name="fours">
                    <xsl:value-of select="@fours_scored"/>
                  </xsl:attribute>
                  <xsl:attribute name="sixes">
                    <xsl:value-of select="@sixes_scored"/>
                  </xsl:attribute>
                  <xsl:attribute name="batting_time">
                    <xsl:value-of select="@minutes"/>
                  </xsl:attribute>
                  <xsl:if test="@on_strike =1">
                    <xsl:attribute name="striker">
                      <xsl:text>true</xsl:text>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="@non_strike =1">
                    <xsl:attribute name="nonstriker">
                      <xsl:text>true</xsl:text>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="@on_strike =1 or @non_strike =1">
                    <xsl:attribute name="not_out">
                      <xsl:text>true</xsl:text>
                    </xsl:attribute>
                  </xsl:if>

                  <xsl:if test="@on_strike != 1 and @non_strike != 1">
                    <dismissal>
                      <xsl:attribute name="how_out">
                        <xsl:value-of select="@how_out"/>
                      </xsl:attribute>
                      <xsl:attribute name="dismissal_type">
                        <xsl:choose>
                          <xsl:when test="@dismissal_id = -1">
                            <xsl:text>Yet to Bat</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 0">
                            <xsl:text>Not out</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 1">
                            <xsl:text>Bowled</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 2">
                            <xsl:text>Caught &amp; Bowled</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 3">
                            <xsl:text>Caught</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 4">
                            <xsl:text>Handled the Ball</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 5">
                            <xsl:text>Hit Ball Twice</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 6">
                            <xsl:text>Hit Wicket</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 7">
                            <xsl:text>L.B.W.</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 8">
                            <xsl:text>Obstructing Field</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 9">
                            <xsl:text>Retired Hurt</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 10">
                            <xsl:text>Retired Out</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 11">
                            <xsl:text>Run Out</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 12">
                            <xsl:text>Stumped</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 13">
                            <xsl:text>Timed Out</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 14">
                            <xsl:text>Caught (Sub)</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 15">
                            <xsl:text>Run Out (Sub)</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 16">
                            <xsl:text>Absent Hurt</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 17">
                            <xsl:text>Retired Not Out</xsl:text>
                          </xsl:when>
                          <xsl:when test="@dismissal_id = 18">
                            <xsl:text>Stumped (Sub)</xsl:text>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:text></xsl:text>
                          </xsl:otherwise>
                        </xsl:choose>                        
                      </xsl:attribute>
                      <xsl:attribute name="bowler_id">
                        <xsl:value-of select="@bowled_by"/>
                      </xsl:attribute>
                      <xsl:if test="@caught_by &gt; 0">
                        <dismissal_fielders>
                          <player>
                            <xsl:attribute name="player_id">
                              <xsl:value-of select="@caught_by"/>
                            </xsl:attribute>
                            <xsl:variable name="caughtby" select="@caught_by"/>
                            <xsl:attribute name="player_name">
                              <xsl:for-each select="/CricketMatchSummary/PlayerDetail/Team/Player">
                                <xsl:if test="@id = $caughtby">
                                  <xsl:value-of select="@player_name"/>
                                </xsl:if>
                              </xsl:for-each>
                             
                            </xsl:attribute>
                          </player>
                        </dismissal_fielders>
                      </xsl:if>
                    </dismissal>
                  </xsl:if>
                </batsman>
              </xsl:if>						
						</xsl:for-each>
						<xsl:value-of select="Batsmen"/>
					</batting_card>
					<bowling_card>
						<xsl:for-each select="Bowlers/Bowler">
							<bowler>
								<xsl:attribute name="player_id">
									<xsl:value-of select="@id"/>
								</xsl:attribute>
                <xsl:attribute name="player_name">
                  <xsl:value-of select="@player_name"/>
                </xsl:attribute>
								<xsl:attribute name="overs">
									<xsl:choose>
										<xsl:when test="@balls_bowled &gt; 0">
											<xsl:value-of select="concat(@overs_bowled,'.',@balls_bowled)"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="@overs_bowled"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<xsl:attribute name="maidens">
									<xsl:value-of select="@maidens_bowled"/>
								</xsl:attribute>
								<xsl:attribute name="runs">
									<xsl:value-of select="@runs_conceded"/>
								</xsl:attribute>
								<xsl:attribute name="wickets">
									<xsl:value-of select="@wickets_taken"/>
								</xsl:attribute>
								<xsl:attribute name="no_balls">
									<xsl:value-of select="@no_balls"/>
								</xsl:attribute>
								<xsl:attribute name="wides">
									<xsl:value-of select="@wides"/>
								</xsl:attribute>
                <xsl:if test="@non_strike=1">
                  <xsl:attribute name="previous">
                    <xsl:text>true</xsl:text>
                  </xsl:attribute>
                </xsl:if>
                <xsl:if test="@on_strike=1">
                  <xsl:attribute name="current">
                    <xsl:text>true</xsl:text>
                  </xsl:attribute>
                </xsl:if>							
							</bowler>
						</xsl:for-each>
						<xsl:value-of select="Bowlers"/>
					</bowling_card>
					<extras>
						<xsl:attribute name="wides">
							<xsl:value-of select="Extras/@wides"/>
						</xsl:attribute>
						<xsl:attribute name="no_balls">
							<xsl:value-of select="Extras/@no_balls"/>
						</xsl:attribute>
						<xsl:attribute name="byes">
							<xsl:value-of select="Extras/@byes"/>
						</xsl:attribute>
						<xsl:attribute name="leg_byes">
							<xsl:value-of select="Extras/@leg_byes"/>
						</xsl:attribute>
						<xsl:attribute name="penalty_runs">
							<xsl:value-of select="Extras/@penalties"/>
						</xsl:attribute>
						<xsl:attribute name="extras_total">
							<xsl:value-of select="Extras/@total_extras"/>
						</xsl:attribute>
						<xsl:value-of select="Extras"/>
						<xsl:value-of select="Extras"/>
					</extras>
					<fow_summary>
						<xsl:for-each select="FallofWickets/FallofWicket">
							<fow>
								<xsl:attribute name="fow_order">
									<xsl:value-of select="@order"/>
								</xsl:attribute>
                <xsl:attribute name="wickets_fallen">
                  <xsl:value-of select="@wickets_fallen"/>
                </xsl:attribute>
								<xsl:attribute name="team_score">
									<xsl:value-of select="@runs"/>
								</xsl:attribute>
								<xsl:attribute name="overs">
									<xsl:value-of select="@over_ball"/>
								</xsl:attribute>
                <xsl:attribute name="fow_type">
                  <xsl:value-of select="@fow_type"/>
                </xsl:attribute>
								<xsl:attribute name="dismissed_player_id">
									<xsl:value-of select="@player_id"/>
								</xsl:attribute>
                <xsl:attribute name="player1_id">
                  <xsl:value-of select="@player1_id"/>
                </xsl:attribute>
                <xsl:attribute name="player1_name">
                  <xsl:value-of select="@player1_name"/>
                </xsl:attribute>
                <xsl:attribute name="player2_id">
                  <xsl:value-of select="@player2_id"/>
                </xsl:attribute>
                <xsl:attribute name="player2_name">
                  <xsl:value-of select="@player2_name"/>
                </xsl:attribute>
                <xsl:attribute name="player1_runs">
                  <xsl:value-of select="@player1_runs"/>
                </xsl:attribute>
                <xsl:attribute name="player2_runs">
                  <xsl:value-of select="@player2_runs"/>
                </xsl:attribute>
							</fow>
						</xsl:for-each>
						<xsl:value-of select="FallofWickets"/>
					</fow_summary>
          <umpire_reviews>
            
          </umpire_reviews>
					<innings_total>
						<xsl:attribute name="runs">
							<xsl:value-of select="Total/@runs_scored"/>
						</xsl:attribute>
						<xsl:attribute name="overs">
							<xsl:value-of select="Total/@overs"/>
						</xsl:attribute>
						<xsl:attribute name="wickets">
							<xsl:value-of select="Total/@wickets"/>
						</xsl:attribute>
						<xsl:value-of select="Total"/>
					</innings_total>
          <scorecard_notes>
            
          </scorecard_notes>
				</innings>
			</xsl:for-each>
      <close_of_play>
        
      </close_of_play>
		</match_scorecard>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="C2 crml-33974.xml" userelativepaths="yes" externalpreview="no" url="C2 crml-33974.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength=""
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="scorecardxml.xml" destSchemaRoot="match_scorecard" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="C2 crml-33974.xml" srcSchemaRoot="CricketMatchSummary" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/">
				<block path="match_scorecard/players/xsl:for-each" x="318" y="141"/>
				<block path="match_scorecard/players/xsl:for-each/player/xsl:if/=[0]" x="192" y="139"/>
				<block path="match_scorecard/players/xsl:for-each/player/xsl:if" x="238" y="141"/>
				<block path="match_scorecard/players/xsl:for-each/player/xsl:if[1]/=[0]" x="152" y="139"/>
				<block path="match_scorecard/players/xsl:for-each/player/xsl:if[1]" x="198" y="141"/>
				<block path="match_scorecard/xsl:for-each" x="278" y="141"/>
				<block path="match_scorecard/xsl:for-each/innings/batting_card/xsl:for-each" x="158" y="141"/>
				<block path="match_scorecard/xsl:for-each/innings/batting_card/xsl:for-each/batsman/xsl:if/and[0]" x="0" y="139"/>
				<block path="match_scorecard/xsl:for-each/innings/batting_card/xsl:for-each/batsman/xsl:if/and[0]/!=[0]" x="0" y="133"/>
				<block path="match_scorecard/xsl:for-each/innings/batting_card/xsl:for-each/batsman/xsl:if/and[0]/!=[1]" x="0" y="161"/>
				<block path="match_scorecard/xsl:for-each/innings/batting_card/xsl:for-each/batsman/xsl:if" x="38" y="141"/>
				<block path="match_scorecard/xsl:for-each/innings/batting_card/xsl:for-each/batsman/xsl:if/dismissal/xsl:if/&gt;[0]" x="192" y="99"/>
				<block path="match_scorecard/xsl:for-each/innings/batting_card/xsl:for-each/batsman/xsl:if/dismissal/xsl:if" x="238" y="101"/>
				<block path="match_scorecard/xsl:for-each/innings/bowling_card/xsl:for-each" x="118" y="141"/>
				<block path="match_scorecard/xsl:for-each/innings/bowling_card/xsl:for-each/bowler/xsl:attribute[1]/xsl:choose" x="248" y="71"/>
				<block path="match_scorecard/xsl:for-each/innings/bowling_card/xsl:for-each/bowler/xsl:attribute[1]/xsl:choose/&gt;[0]" x="202" y="65"/>
				<block path="match_scorecard/xsl:for-each/innings/bowling_card/xsl:for-each/bowler/xsl:attribute[1]/xsl:choose/xsl:when/xsl:value-of" x="38" y="141"/>
				<block path="match_scorecard/xsl:for-each/innings/fow_summary/xsl:for-each" x="78" y="141"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->