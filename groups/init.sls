{% set groups = pillar.get('groups', {}) -%}

{% for group, info in groups.iteritems() -%}
groups_{{ group }}:
  group.present:
    - name: {{ group }}
    {% for key, value in info.iteritems() -%}
    - {{ key }}: {{ value }}
      {% if key == 'members' %}
    - require:
        {% for user in value %}
      - user: {{ user }}
        {% endfor %}
      {% endif %}
    {% endfor %}
{% endfor -%}
