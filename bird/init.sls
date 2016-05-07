# Meta-state to fully install and manage bird
#
{% from 'bird/map.jinja' import rawmap %}

include:
    - bird.install
    - bird.config
    - bird.service

{% if rawmap.enable_v4 or rawmap.enable_v6 %}
extend:
    {% if rawmap.enable_v4 %}
    bird_service:
        service:
            - watch:
                - pkg: bird_package
                - file: bird_config
                - file: bird_config_local
    bird_config:
        file:
            - require:
                - pkg: bird_package
    {% endif %}
    {% if rawmap.enable_v6 %}
    bird6_service:
        service:
            - watch:
                - pkg: bird6_package
                - file: bird6_config
                - file: bird6_config_local
    bird6_config:
        file:
            - require:
                - pkg: bird6_package
    {% endif %} 
{% endif %}
