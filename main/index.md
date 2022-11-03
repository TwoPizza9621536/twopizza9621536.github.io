---
layout: default
title: Home
permalink: /
---

Welcome to my github.io page. This is where I store my [blogs for technology,
programming, open source, games, and more]({{ '/blogs' | relative_url}}).

To contact me or using public cryptographic keys to send or verify messages or
files, see the sidebar on the left.

## Repositories

<!-- markdownlint-disable MD013 MD032 -->
{% assign popular_repositories = site.github.public_repositories | sort:"archived" | sort:"fork" | sort:"stargazers_count" %}
{% for repository in popular_repositories limit:5 %}
* [{{ repository.name }}]({{ repository.html_url }})
{% endfor %}
<!-- markdownlint restore -->
