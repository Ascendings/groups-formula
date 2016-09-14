{% set groups = pillar.get('groups', {}) -%}

{% for group, info in groups.iteritems() -%}
groups_{{ group }}:
  group.present:
    - name: {{ group }}
    {% for key, value in info.iteritems() -%}
    - {{ key }}: {{ value }}
    {% endfor %}
{% endfor -%}
