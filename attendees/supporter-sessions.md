---
title: Supporter Sessions
showTitle: true
---

<!-- 
DAY,NUMBER,TIME,COMPANY,LEVEL,SESSION TITLE,ROOM,PRESENTERS,CONTENT
-->

{% for ws in site.data.supporter-sessions-2017 %}
<div class = "row">
	<h3>{{ws["sessiontitle"]}} (Room #{{ws["room"]}})</h3>
</div>
<div class = "row">
	<div class = "col-sm-4">
		<b>Date/Time: {{ws["day"]}}, March {{ws["number"]}}th, {{ws["time"]}}</b>
	</div>
  <div class = "col-sm-8">
    {% for p in ws["presenters"] %}
      <li> {{p}} </li>
    {% endfor %}
	</div>
</div>
<div class = "row">
	<div class = "col-sm-8 col-sm-offset-1" style = "margin-top: 20px;">
		<p> {{ws["content"]}} </p>
	</div>
</div>
	
{% endfor %}
