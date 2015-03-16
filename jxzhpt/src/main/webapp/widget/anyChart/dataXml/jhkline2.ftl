<anychart>
	<settings>
		<animation enabled="True"/>
	</settings>
  <charts>
    <chart plot_type="CategorizedVertical">
   <chart_settings>
				<title enabled="true">
					<text>${chart_title}</text>
				</title>
				<legend enabled="true" position="Bottom" align="Spread"
					ignore_auto_item="true">
					<format>{@Icon} {@Name}{numDecimals:0}</format>
					<template></template>
					<title enabled="true">
						<text>${legend_title}</text>
					</title>
					<columns_separator enabled="false" />
					<background>
						<inside_margin left="10" right="10" />
					</background>
					<items>
						<item source="Series" />
					</items>
				</legend>
				<axes>
					<y_axis>
						<title>
							<text>${yName}</text>
						</title>
						<labels align="Inside">
							<format>{@Value}{numDecimals:0}</format>
						</labels>
					</y_axis>
					<x_axis>
						<title>
							<text>${xName}</text>
						</title>
					</x_axis>
				</axes>
			</chart_settings>  	
    	<data_plot_settings default_series_type="Line">
    		<line_series>
    			<marker_settings>
    					<marker size="8"/>
    					<states>
    						<hover>
    							<marker size="12"/>
    						</hover>
    					</states>
    			</marker_settings>
    			<tooltip_settings enabled="True">
	    			<format>
	               		<![CDATA[{@Name}{numDecimals: 0}年{%SeriesName} 总投资：{@YValue}{numDecimals: ${precision}}]]>
					</format>
    			</tooltip_settings>
    		</line_series>
    	</data_plot_settings>
    	   
	    <data>
                <series name="工程改建" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.gcgj}"/>        
                      </#list>
				</series>
				<series name="工程升级" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.gcsj}"/>        
                      </#list>
				</series>
				<series name="水毁" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.shuih}"/>        
                      </#list>
				</series>
				<series name="养护大中修" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.yhdzx}"/>        
                      </#list>
				</series>
				<series name="危桥改造" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.wqgz}"/>        
                      </#list>
				</series>
				<series name="安保工程" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.abgc}"/>        
                      </#list>
				</series>
				<series name="灾害防治" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.zhfz}"/>        
                      </#list>
				</series>
	    </data>
    </chart>
  </charts>
</anychart>
		