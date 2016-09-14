{% from "groups/map.jinja" import groups with context -%}

{% for group, info in groups.iteritems() -%}
groups_{{ group }}:
  group.present:
    - name: {{ group }}
    {% for key, value in info.iteritems() -%}
    - {{ key }}: {{ value }}
    {% endfor %}
{% endfor -%}
