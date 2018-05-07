---
title: Pre-Symposium Events
showTitle: true
---

There are several exciting pre-symposium events this year; plan your travel so you can get in a day early and take part in these excellent professional development and educational opportunities.

<p>
{% for event in site.data.presymposium %}
  {% assign inc = event.name | remove: 'presymposium/' | remove: '.html' | remove: " " %}
  <a href="#{{inc | remove: ' '}}">{{event.name}}</a><br/>
{% endfor %}
</p>

{% for event in site.data.presymposium %}
{% if event.name != "" %}
{% assign inc = event.name | remove: 'presymposium/' | remove: '.html' | remove: " " %}


<p><a name="{{inc}}"></a></p>

### {{event.name}}

**Date/Time**: {{event.date}} {% if event.room %} <br/> **Room**: {{event.room}} {% endif %} <br/>
**Cost**: {{event.cost}} <br/>
**Max Participants**: {{event.max}}

{{event.blurb}}

{% if event.info %}
  {% if event.info contains "http" %}
**For additional information**: <a href="{{event.info}}">{{event.info}}</a>
  {% else %}
**For additional information**: {{event.info}}
  {% endif %}
{% endif %}

{% if event.register %}
  {% if event.register contains "http" %}
**To register for this event**: <a href="{{event.register}}">{{event.register}}</a>
  {% else %}
<b>{{event.register}}</b>
  {% endif %}
{% endif %}

{% if event.deadline %}
<b>Application Deadline</b>: {{event.deadline}}
{% endif %}

**Organizers**:
<ul>
{% for org in event.organizers %}
{% if org.email %}
  <li>{{org.name}} (<a href="mailto:{{org.email}}">{{org.email}}</a>)</li>
  {% else %}
    <li>{{org.name}}</li>
  {% endif %}

{% endfor%}
</ul>

<p>&nbsp;</p>
{% endif %}

{% endfor %}

{% comment %}
## For More Information

If you are interested in hosting a pre-symposium event, please contact the Pre-Conference Events Liaison (below) to request an application form.  Application forms should be submitted by <b>{{subdate}}</b> for full consideration.

Depending on the number of applications submitted and space availability at the conference hotel, not all events may be selected for inclusion.
{% endcomment %}

{% include submission-questions category="Pre-Symposium and Affiliated Events Liaison" %}
