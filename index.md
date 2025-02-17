---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
title: Documentazione Artificial QI
layout: index
---

# Artificial QI

## Candidatura
<!-- così vado a prendermi i file pdf in Candidatura -->
{% for pdf in site.static_files %}
    {% if pdf.path contains "Documentazione/Candidatura/" and pdf.extname == ".pdf" %}
- [{{ pdf.name | split: "_" | first | split: ".pdf" | first }}]({{ pdf.path | relative_url }}){:target="_blank"}
    {% endif %}
{% endfor %}

## Esterni
<!--  così vado a prendermi i file pdf in PdQ, PdP, AdR e Glossario -->
{% assign documenti = "PdQ:Piano di Qualifica, PdP:Piano di Progetto, AdR:Analisi dei Requisiti, Glossario:Glossario, MS:Manuale Sviluppatore" | split: ", " %}
{% for pdf in site.static_files %}
    {% for documento in documenti %}
        {% assign nome = documento | split: ":" %}
        {% assign percorso = "Documentazione/" | append: nome[0] %}
        {% if pdf.path contains percorso and pdf.extname == ".pdf" %}
- [{{ nome[1] }} <span class="version">{{ pdf.name | split: "_" | last | split: ".pdf" | first }}</span>]({{ pdf.path | relative_url }}){:target="_blank"}
        {% endif %}
    {% endfor %}
{% endfor %}


### Verbali
<!--  così vado a prendermi i file pdf in Verbali/Esterni -->
{% for pdf in site.static_files reversed %}
    {% if pdf.path contains "Documentazione/Verbali/Esterni" and pdf.extname == ".pdf" %}

        {% assign data = pdf.name | split: "Verbale" | last | split: "_" | first | split: "-" %}

        {% assign giorno =  data[2] %}

        {% assign mese =  data[1] %}

        {% assign anno =  data[0] %}

        {% assign last_part = pdf.name | split: "Verbale" | last | split: "_" | last | split: ".pdf" | first %}

- [ Verbale {{ giorno }}/{{ mese }}/{{ anno }} {{ last_part }} ]({{ pdf.path | relative_url }}){:target="_blank"}
    {% endif %}
{% endfor %}

## Interni

### WoW
<!--  così vado a prendermi i file pdf in WoW -->
{% for pdf in site.static_files %}
    {% if pdf.path contains "Documentazione/WOW/" and pdf.extname == ".pdf" %}
- [Way of Working <span class="version">{{ pdf.name | split: "_" | last | split: ".pdf" | first }}</span>]({{ pdf.path | relative_url }}){:target="_blank"}
    {% endif %}
{% endfor %}

### Verbali
<!--  così vado a prendermi i file pdf in Verbali/Interni -->

{% for pdf in site.static_files reversed %}
    {% if pdf.path contains "Documentazione/Verbali/Interni" and pdf.extname == ".pdf" %}

        {% assign data = pdf.name | split: "Verbale" | last | split: "." | first | split: "-" %}

        {% assign giorno =  data[2] %}

        {% assign mese =  data[1] %}

        {% assign anno =  data[0] %}

- [ Verbale {{ giorno }}/{{ mese }}/{{ anno }} ]({{ pdf.path | relative_url }}){:target="_blank"}
    {% endif %}
{% endfor %}