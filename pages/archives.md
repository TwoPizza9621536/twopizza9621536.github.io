---
layout: default
title: Archives
permalink: /archives
---

# {% octicon archive height:24 %} Yearly Archives

<!-- markdownlint-disable MD032 -->

{% assign posts = site.posts %}
{% assign postsByYear = posts | group_by_exp:"post", "post.date | date: '%Y'" %}
{% for year in postsByYear %}
- [{{ year.name }}]({{ year.name | relative_url }})
{% endfor %}

<!-- markdownlint-disable -->
