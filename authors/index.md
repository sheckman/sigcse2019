---
title: "Dates and Guidelines"
showTitle: true
---

We have broken out submission guidelines by type. There are many ways to share the excellent work you are doing, and we would encourage you to consider all of them as you think about what would make the best vehicle for sharing your efforts with the larger community.

<div class="row">
    <div class="table-responsive">
      <table class="table">
          <tbody>
    {% for submission in site.data.cfp.master %}
      <tr>
        <td> <b>

        {% if submission.track == "track1" %}
           {{site.data.cfp.track1.date}}
        {% elsif submission.track == "track2" %}
            {{site.data.cfp.track2.date}}
        {% elsif submission.track == "track3" %}
            {{site.data.cfp.track3.date}}
        {% elsif submission.track == "track4" %}
            {{site.data.cfp.track4.date}}
        {% else %}
           Oops
        {% endif %}
        </b> </td>
        <td>
          {% for sub in submission.types %}
              {% capture link %}<a href = "{{sub.include | remove: ' ' | downcase}}.html">{{sub.plural}}</a>{% endcapture %}
              {% capture entry %}{% if forloop.first %}{% else %}<br/> {% endif %}{{link}}{% endcapture %}
              {{entry}}
          {% endfor %}
        </td>
      </tr>
    {% endfor %}
        </tbody>
      </table>
    </div>
  <div class="col-md-12 well">
      Dates for <b>notification of acceptance</b> and <b>camera-ready submission</b> can be found on the detail page for each specific submission type.
  </div>



</div>