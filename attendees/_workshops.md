---
title: Workshops
showTitle: true
---

{% comment %}
There are two pages for workshops, currently---one for the YAML structure, 
which was used in previous SIGCSEs, and one for the CSV structure, which
is what we got in 2019. Fortunately, Jekyll eats both.
{% endcomment %}

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
