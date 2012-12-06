<table class="featureInfo">
    <#list features as feature>
            <tr><td>--</td></tr>
            <tr><td> <b> Cruise: </b>
            <a target="_blank"
            href="http://dev.deep-c.org/data/cruises/tabular.php?lvl=site&cruise_id=${feature.attributes['id'].value}">${feature.attributes['id'].value}</a></td></tr>
            <tr><td><b>Pi:</b>  ${feature.attributes['name'].value} </td></tr>
            <tr><td><b>Departure:</b>  ${feature.attributes['dep'].value} </td></tr>
    </#list>
</table>
