---
title: Workshops
showTitle: true
---

{% assign prevdate = "" %}

<ul>
{% for ws in site.data.workshops-2019 %}
<li><a href="#{{ws.title}}">{{ws.title}}</a></li>
{% endfor %}
</ul>

{% for ws in site.data.workshops-2019 %}

<h3 id="{{ws.title}}"> {{ws.easychair}}: {{ws.title}}</h3>

<p><b>{{ws.authors}}</b></p>
<p><em><small>{{ws.advertisement}}</small></em></p>

<p>{{ws.abstract}}</p>

{% endfor %}
