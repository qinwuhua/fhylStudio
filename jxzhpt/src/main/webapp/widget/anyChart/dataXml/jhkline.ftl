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
                <series name="南昌市" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.je360100}"/>        
                      </#list>
				</series>
				<series name="景德镇市" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.je360200}"/>        
                      </#list>
				</series>
				<series name="萍乡市" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.je360300}"/>        
                      </#list>
				</series>
				<series name="九江市" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.je360400}"/>        
                      </#list>
				</series>
				<series name="新余市" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.je360500}"/>        
                      </#list>
				</series>
				<series name="鹰潭市" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.je360600}"/>        
                      </#list>
				</series>
				<series name="赣州市" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.je360700}"/>        
                      </#list>
				</series>
				<series name="吉安市" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.je360800}"/>        
                      </#list>
				</series>
				<series name="宜春市" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.je360900}"/>        
                      </#list>
				</series>
				<series name="抚州市" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.je361000}"/>        
                      </#list>
				</series>
				<series name="上饶市" palette="Default">
				     <#list list as l >
				          <point name="${l.year}" y="${l.je361100}"/>        
                      </#list>
				</series>
	    </data>
    </chart>
  </charts>
</anychart>
		