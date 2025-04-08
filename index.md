---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: index
---

# Documenti

{% assign data_candidatura = "2024-11-04" %}
{% assign data_rtb = "2025-02-27" %}
{% assign data_pb = "2025-04-04" %}

## Product Baseline
{% for pdf in site.static_files %}
    {% if pdf.path contains "Documentazione/Candidatura_PB" and pdf.extname == ".pdf" %}
- [Lettera di Presentazione PB]({{ pdf.path | relative_url }}){:target="_blank"}
    {% endif %}
{% endfor %}

### Esterni
<!--  così vado a prendermi i file pdf in PdQ, PdP, AdR e Glossario -->
{% assign documentiEsterni = "PdQ:Piano di Qualifica, PdP:Piano di Progetto, AdR:Analisi dei Requisiti, Glossario:Glossario, MS:Manuale Sviluppatore, MU:Manuale Utente, ST:Specifica Tecnica" | split: ", " %}
{% for pdf in site.static_files %}
    {% for documento in documentiEsterni %}
        {% assign nome = documento | split: ":" %}
        {% assign percorso = "Documentazione/" | append: nome[0] %}
        {% unless pdf.path contains "Deprecated" %}
            {% if pdf.path contains percorso and pdf.extname == ".pdf" %}
- [{{ nome[1] }} <span class="version">{{ pdf.name | split: "_" | last | split: ".pdf" | first }}</span>]({{ pdf.path | relative_url }}){:target="_blank"}
            {% endif %}
        {% endunless %}
    {% endfor %}
{% endfor %}

#### Verbali
<!--  così vado a prendermi i file pdf in Verbali/Esterni -->
{% for pdf in site.static_files reversed %}
    {% if pdf.path contains "Documentazione/Verbali/Esterni" and pdf.extname == ".pdf" %}

        {% assign data = pdf.name | split: "Verbale" | last | split: "_" | first %}

        {% assign giorno = data | split: "-" | slice: 2 %}

        {% assign mese = data | split: "-" | slice: 1 %}

        {% assign anno = data | split: "-" | slice: 0 %}

        {% assign last_part = pdf.name | split: "Verbale" | last | split: "_" | last | split: ".pdf" | first %}

        {% if data <= data_pb and data > data_rtb %}

- [ Verbale {{ giorno }}/{{ mese }}/{{ anno }} {{ last_part }} ]({{ pdf.path | relative_url }}){:target="_blank"}
        {% endif %}
    {% endif %}
{% endfor %}

### Interni
<!--  così vado a prendermi i file pdf in WoW,... -->
{% assign documentiInterni = "WOW:Way of Working" | split: ", " %}
{% for pdf in site.static_files %}
    {% for documento in documentiInterni %}
        {% assign nome = documento | split: ":" %}
        {% assign percorso = "Documentazione/" | append: nome[0] %}
        {% unless pdf.path contains "Deprecated" %}
            {% if pdf.path contains percorso and pdf.extname == ".pdf" %}
- [{{ nome[1] }} <span class="version">{{ pdf.name | split: "_" | last | split: ".pdf" | first }}</span>]({{ pdf.path | relative_url }}){:target="_blank"}
            {% endif %}
        {% endunless %}
    {% endfor %}
{% endfor %}

#### Verbali
<!--  così vado a prendermi i file pdf in Verbali/Interni -->
{% for pdf in site.static_files reversed %}
    {% if pdf.path contains "Documentazione/Verbali/Interni" and pdf.extname == ".pdf" %}

        {% assign data = pdf.name | split: "Verbale" | last | split: "." | first %}

        {% assign giorno = data | split: "-" | slice: 2 %}

        {% assign mese = data | split: "-" | slice: 1 %}

        {% assign anno = data | split: "-" | slice: 0 %}

        {% if data <= data_pb and data > data_rtb %}

- [ Verbale {{ giorno }}/{{ mese }}/{{ anno }} ]({{ pdf.path | relative_url }}){:target="_blank"}
        {% endif %}
    {% endif %}
{% endfor %}

## Requirements and Technology Baseline
{% for pdf in site.static_files %}
    {% if pdf.path contains "Documentazione/Candidatura_RTB" and pdf.extname == ".pdf" %}
- [Lettera di Presentazione RTB]({{ pdf.path | relative_url }}){:target="_blank"}
    {% endif %}
{% endfor %}

### Esterni
<!--  così vado a prendermi i file pdf in PdQ, PdP, AdR e Glossario -->
{% assign documentiEsterni = "PdQ:Piano di Qualifica:v2.0.0, PdP:Piano di Progetto:v1.0.0, AdR:Analisi dei Requisiti:v2.0.0, Glossario:Glossario:v1.0.0" | split: ", " %}
{% for pdf in site.static_files %}
    {% for documento in documentiEsterni %}
        {% assign nome = documento | split: "_" | first | split: ":" %}
        {% assign percorso = "Documentazione/" | append: nome[0] %}
        {% if pdf.path contains percorso and pdf.path contains nome[2] and pdf.extname == ".pdf" %}
- [{{ nome[1] }} <span class="version">{{ pdf.name | split: "_" | last | split: ".pdf" | first }}</span>]({{ pdf.path | relative_url }}){:target="_blank"}
        {% endif %}
    {% endfor %}
{% endfor %}


#### Verbali
<!--  così vado a prendermi i file pdf in Verbali/Esterni -->
{% for pdf in site.static_files reversed %}
    {% if pdf.path contains "Documentazione/Verbali/Esterni" and pdf.extname == ".pdf" %}

        {% assign data = pdf.name | split: "Verbale" | last | split: "_" | first %}

        {% assign giorno = data | split: "-" | slice: 2 %}

        {% assign mese = data | split: "-" | slice: 1 %}

        {% assign anno = data | split: "-" | slice: 0 %}

        {% assign last_part = pdf.name | split: "Verbale" | last | split: "_" | last | split: ".pdf" | first %}

        {% if data <= data_rtb and data > data_candidatura %}

- [ Verbale {{ giorno }}/{{ mese }}/{{ anno }} {{ last_part }} ]({{ pdf.path | relative_url }}){:target="_blank"}
        {% endif %}
    {% endif %}
{% endfor %}

### Interni
<!--  così vado a prendermi i file pdf in WoW,.. -->
{% assign documentiInterni = "WOW:Way of Working:v2.0.0" | split: ", " %}
{% for pdf in site.static_files %}
    {% for documento in documentiInterni %}
        {% assign nome = documento | split: "_" | first | split: ":" %}
        {% assign percorso = "Documentazione/" | append: nome[0] %}
        {% if pdf.path contains percorso and pdf.path contains nome[2] and pdf.extname == ".pdf" %}
- [{{ nome[1] }} <span class="version">{{ pdf.name | split: "_" | last | split: ".pdf" | first }}</span>]({{ pdf.path | relative_url }}){:target="_blank"}
        {% endif %}
    {% endfor %}
{% endfor %}

#### Verbali
<!--  così vado a prendermi i file pdf in Verbali/Interni -->
{% for pdf in site.static_files reversed %}
    {% if pdf.path contains "Documentazione/Verbali/Interni" and pdf.extname == ".pdf" %}

        {% assign data = pdf.name | split: "Verbale" | last | split: "." | first %}

        {% assign giorno = data | split: "-" | slice: 2 %}

        {% assign mese = data | split: "-" | slice: 1 %}

        {% assign anno = data | split: "-" | slice: 0 %}

        {% if data <= data_rtb and data > data_candidatura %}

- [ Verbale {{ giorno }}/{{ mese }}/{{ anno }} ]({{ pdf.path | relative_url }}){:target="_blank"}
        {% endif %}
    {% endif %}
{% endfor %}

## Candidatura
<!-- così vado a prendermi i file pdf in Candidatura -->
{% for pdf in site.static_files %}
    {% if pdf.path contains "Documentazione/Candidatura/" and pdf.extname == ".pdf" %}
        {% if pdf.path contains "Documentazione/Candidatura/Candidatura" %}
- [Lettera di Candidatura]({{ pdf.path | relative_url }}){:target="_blank"}
        {% else %}
- [{{ pdf.name | replace: '_',' ' | split: ".pdf" | first }}]({{ pdf.path | relative_url }}){:target="_blank"}
        {% endif %}
    {% endif %}
{% endfor %}

### Esterni
#### Verbali
<!--  così vado a prendermi i file pdf in Verbali/Esterni -->
{% for pdf in site.static_files reversed %}
    {% if pdf.path contains "Documentazione/Verbali/Esterni" and pdf.extname == ".pdf" %}

        {% assign data = pdf.name | split: "Verbale" | last | split: "_" | first %}

        {% assign giorno = data | split: "-" | slice: 2 %}

        {% assign mese = data | split: "-" | slice: 1 %}

        {% assign anno = data | split: "-" | slice: 0 %}

        {% assign last_part = pdf.name | split: "Verbale" | last | split: "_" | last | split: ".pdf" | first %}

        {% if data <= data_candidatura %}

- [ Verbale {{ giorno }}/{{ mese }}/{{ anno }} {{ last_part }} ]({{ pdf.path | relative_url }}){:target="_blank"}
        {% endif %}
    {% endif %}
{% endfor %}

### Interni
#### Verbali
<!--  così vado a prendermi i file pdf in Verbali/Interni -->
{% for pdf in site.static_files reversed %}
    {% if pdf.path contains "Documentazione/Verbali/Interni" and pdf.extname == ".pdf" %}

        {% assign data = pdf.name | split: "Verbale" | last | split: "." | first %}

        {% assign giorno = data | split: "-" | slice: 2 %}

        {% assign mese = data | split: "-" | slice: 1 %}

        {% assign anno = data | split: "-" | slice: 0 %}

        {% if data <= data_candidatura %}

- [ Verbale {{ giorno }}/{{ mese }}/{{ anno }} ]({{ pdf.path | relative_url }}){:target="_blank"}
        {% endif %}
    {% endif %}
{% endfor %}