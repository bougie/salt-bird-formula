{% from 'bird/map.jinja' import rawmap %}

{% if rawmap.enable_v4 %}
bird_config:
    file.managed:
        - name: {{rawmap.lookup.config_file_v4}}
        - source: salt://bird/files/bird.conf.j2
        - template: jinja
        - context:
            local_config: {{rawmap.lookup.config_file_v4 ~ '.local'}}

bird_config_local:
    file.managed:
        - name: {{rawmap.lookup.config_file_v4 ~ '.local'}}
{% endif %}

{% if rawmap.enable_v6 %}
bird6_config:
    file.managed:
        - name: {{rawmap.lookup.config_file_v6}}
        - source: salt://bird/files/bird.conf.j2
        - template: jinja
        - context:
            local_config: {{rawmap.lookup.config_file_v6 ~ '.local'}}

bird6_config_local:
    file.managed:
        - name: {{rawmap.lookup.config_file_v6 ~ '.local'}}
{% endif %}
