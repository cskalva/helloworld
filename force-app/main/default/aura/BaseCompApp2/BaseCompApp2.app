<aura:application extends="force:slds" >
	<aura:attribute name="accessToken" type="String"/>
	<aura:attribute name="ckey" type="String" default="3MVG9sG9Z3Q1RlbczDWmyB39ZYBQFmRc50CVpeAs1jzw6od3u6pne4Irnb4dwNu0wyWDXtlg38e0srQbq.Zq_"/>
	<lightning:layout horizontalAlign="spread">
		<lightning:layoutItem flexibility="grow" padding="around-small">
			<lightning:input name="ckey" value="{!v.ckey}" label="Consumer Key" maxlength="128" />
		</lightning:layoutItem>
	</lightning:layout>
	<lightning:layout horizontalAlign="space">
		<lightning:layoutItem flexibility="grow" padding="around-small">
			<lightning:button variant="brand" label="Get Access Token" onclick="{! c.getToken }" />
		</lightning:layoutItem>
	</lightning:layout>
	<lightning:layout horizontalAlign="space">
		<lightning:layoutItem flexibility="grow" padding="around-small">
			Received Token is: {!v.accessToken}
		</lightning:layoutItem>
	</lightning:layout>


</aura:application>