{% from 'bird/map.jinja' import rawmap %}

bird_service:
{% if rawmap.enable_v4 %}
    service.running:
        - enable: True
{% else %}
    service.dead:
        - enable: False
{% endif %}
        - name: {{rawmap.lookup.service_v4}}

bird6_service:
{% if rawmap.enable_v6 %}
    service.running:
        - enable: True
{% else %}
    service.dead:
        - enable: False
{% endif %}
        - name: {{rawmap.lookup.service_v6}}
