# -*- coding: utf-8 -*-
# vim: ft=sls
{% if pillar.letsencrypt.get('enabled', false) %}
include:
  - letsencrypt.install
  - letsencrypt.config
  - letsencrypt.domains
{% endif %}