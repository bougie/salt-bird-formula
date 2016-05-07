{% from 'bird/map.jinja' import rawmap %}

{% if rawmap.enable_v4 %}
bird_package:
    pkg.installed:
        - name: {{rawmap.lookup.package_v4}}
{% endif %}

{% if rawmap.enable_v6 %}
bird6_package:
    pkg.installed:
        - name: {{rawmap.lookup.package_v6}}
{% endif %}
