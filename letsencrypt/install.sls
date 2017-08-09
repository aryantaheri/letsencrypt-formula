# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "letsencrypt/map.jinja" import letsencrypt with context %}
{% if letsencrypt.get('git', False) %}
letsencrypt-client-git:
  git.latest:
    - name: https://github.com/letsencrypt/letsencrypt
    - target: {{ letsencrypt.cli_install_dir }}
    - force_reset: True
{% else %}
letsencrypt-client-repo:
  pkgrepo.managed:
    - humanname: Certbot Repo
    - name: ppa:certbot/certbot
    - file: /etc/apt/sources.list.d/certbot.list
    - require_in:
        pkg: letsencrypt-client-package
    - clean_file: true

letsencrypt-client-package:
  pkg.installed:
    - pkgs:
        - certbot
{% endif %}      
