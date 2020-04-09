<aura:application >
        <aura:attribute name="myText" type="string" default="Hello there!"/>
        <ui:inputText label="Enter some text" class="field" value="{!v.myText}" updateOn="keyup"/>
        You entered: <ui:outputText value="{!v.myText}"/> 
</aura:application>