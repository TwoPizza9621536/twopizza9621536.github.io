---
layout: default
title: Tags
permalink: /tags
---

# {% octicon tag height:24 %} Tags

<!-- markdownlint-disable MD032 -->

{% for tag in site.tags %}
* [{{ tag[0] }}]({{ '/tag[0]' | relative_url }})
{% endfor %}

<!-- markdownlint restore -->
