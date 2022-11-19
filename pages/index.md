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

<!-- markdownlint-disable MD032 -->
{% assign public_repositories = site.github.public_repositories %}
{% assign unarchive_repositories = public_repositories | sort:"archived" %}
{% assign personal_repositories = unarchive_repositories | sort:"fork" %}
{% assign repositories = personal_repositories | sort:"stargazers_count" %}
{% for repository in repositories limit:5 %}
* [{{ repository.name }}]({{ repository.html_url }})
{% endfor %}
<!-- markdownlint restore -->
