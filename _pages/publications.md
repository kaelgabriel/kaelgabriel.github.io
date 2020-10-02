---
layout: page
permalink: /publications/
title: Publications
description: 
# years: [2020,2019,2018,2017]
years: [2020,1956, 1950, 1935, 1905]
nav: true
---

<div class="publications">

{% for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>
