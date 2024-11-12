---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
title: Documentazione Artificial QI
layout: index
---

# Documentazione

## Candidatura
<!-- così vado a prendermi i file pdf in Candidatura -->
{% for pdf in site.static_files %}
{% if pdf.path contains "Candidatura/" and pdf.extname == ".pdf" %}
- [{{ pdf.name | replace: '_', ' ' }}]({{ pdf.path | relative_url }}){:target="_blank"}
{% endif %}
{% endfor %}

## Verbali

### Interni
<!--  così vado a prendermi i file pdf in Verbali/Interni -->

{% for pdf in site.static_files %}
{% if pdf.path contains "Verbali/Interni" and pdf.extname == ".pdf" %}

    {% assign data = pdf.name | split: "Verbale" | last | split: "." | first | split: "-" %}

    {% assign giorno =  data[2] %}

    {% assign mese =  data[1] %}

    {% assign anno =  data[0] %}

- [ Verbale {{ giorno }}/{{ mese }}/{{ anno }} ]({{ pdf.path | relative_url }}){:target="_blank"}
{% endif %}
{% endfor %}

### Esterni
<!--  così vado a prendermi i file pdf in Verbali/Esterni -->
{% for pdf in site.static_files %}
    {% assign check_approved = pdf.name | split: "Verbale" | last | split: "_" | last %}
    {% if pdf.path contains "Verbali/Esterni" and pdf.extname == ".pdf" and check_approved == "approved" %}

        {% assign data = pdf.name | split: "Verbale" | last | split: "_" | first | split: "-" %}

        {% assign giorno =  data[2] %}

        {% assign mese =  data[1] %}

        {% assign anno =  data[0] %}

        {% assign last_part = pdf.name | split: "Verbale" | last | split: "_" | last %}

- [ Verbale {{ giorno }}/{{ mese }}/{{ anno }} {{ last_part }} ]({{ pdf.path | relative_url }}){:target="_blank"}
    {% endif %}
{% endfor %}