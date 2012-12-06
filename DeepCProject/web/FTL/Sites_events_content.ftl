<table class="featureInfo">
    <#list features as feature>
            <tr><td>--</td></tr>
            <tr><td><b>Site:</b>  ${feature.attributes['site'].value} </td></tr>
            <tr><td><b>Event:</b>
            <a target="_blank"
            href="http://dev.deep-c.org/data/cruises/tabular.php?lvl=event&event_type=${feature.attributes['event_type_id'].value}&event_id=${feature.attributes['event'].value}">${feature.attributes['event'].value}</a></td></tr>
            <tr><td><b>Type:</b>  ${feature.attributes['event_type'].value} </td></tr>
            <tr><td><b>Date:</b>  ${feature.attributes['date'].value?substring(0,8)} </td></tr>
    </#list>
</table>
