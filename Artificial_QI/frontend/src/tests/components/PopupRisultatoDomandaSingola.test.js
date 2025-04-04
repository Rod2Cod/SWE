import { mount } from '@vue/test-utils'
import DomandaPopup from '@/components/PopupRisultatoDomandaSingola.vue'
import { describe, it, expect, vi } from 'vitest'

const mockDomanda = {
    id: 101,
    domanda: 'Qual è la capitale della Francia?',
    risposta: 'Parigi',
    rispostaLLM: 'Paris',
    score: 0.9765,
    metriche: {
        BLEU: 0.95,
        TER: 0.87
    }
}

describe('DomandaPopup.vue', () => {
    it('mostra correttamente tutti i dati della domanda', () => {
        const wrapper = mount(DomandaPopup, {
            props: {
                domanda: mockDomanda
            }
        })

        expect(wrapper.text()).toContain('Qual è la capitale della Francia?')
        expect(wrapper.text()).toContain('Parigi')
        expect(wrapper.text()).toContain('Paris')
        expect(wrapper.text()).toContain('9.77/10')
        expect(wrapper.text()).toContain('BLEU')
        expect(wrapper.text()).toContain('TER')
    })

    it('emette l\'evento "close" al click sul pulsante ✖', async () => {
        const wrapper = mount(DomandaPopup, {
            props: {
                domanda: mockDomanda
            }
        })

        await wrapper.find('.close-button').trigger('click')
        expect(wrapper.emitted('close')).toBeTruthy()
    })

    it('non mostra il blocco metriche se non ci sono', () => {
        const wrapper = mount(DomandaPopup, {
            props: {
                domanda: {
                    ...mockDomanda,
                    metriche: null
                }
            }
        })

        expect(wrapper.text()).not.toContain('Metriche:')
    })
})
