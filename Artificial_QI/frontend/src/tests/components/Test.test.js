import { mount, flushPromises } from '@vue/test-utils'
import Test from '@/components/Test.vue'
import axios from 'axios'
import { describe, it, vi, expect, beforeEach, afterEach } from 'vitest'

// Mock axios
vi.mock('axios')

// Mock domanda singola
const mockDomanda = {
    id: 101,
    domanda: 'Domanda dettagliata',
    rispostaUtente: 'Risposta X',
    corretta: true,
    spiegazione: 'Spiegazione dettagliata'
}

// Mock test di input
const mockTest = {
    id: 1,
    dataEsecuzione: '2025-04-01T10:00:00Z',
    llmUsed: 'GPT-4',
    score: 0.85,
    risultatiDomande: [
        { id: 101, domanda: 'Domanda 1', score: 0.9 },
        { id: 102, domanda: 'Domanda 2', score: 0.7 }
    ]
}

describe('Test.vue', () => {
    let wrapper

    beforeEach(() => {
        wrapper = mount(Test, {
            props: {
                test: mockTest
            }
        })
    })

    afterEach(() => {
        vi.resetAllMocks()
    })

    it('renderizza i dati generali del test', () => {
        expect(wrapper.text()).toContain('Test del 2025-04-01T10:00:00Z')
        expect(wrapper.text()).toContain('GPT-4')
        expect(wrapper.text()).toContain('8.5/10')
    })

    it('clic su una domanda apre il popup con i dati corretti', async () => {
        axios.get.mockResolvedValueOnce({ data: mockDomanda })

        await wrapper.findAll('.question-item')[0].trigger('click')
        await flushPromises()

        expect(wrapper.vm.showPopup).toBe(true)
        expect(wrapper.vm.domandaSelezionata).toEqual(mockDomanda)

        const popup = wrapper.findComponent({ name: 'DomandaPopup' })
        expect(popup.exists()).toBe(true)
        expect(popup.props('domanda')).toEqual(mockDomanda)
    })

    it('chiude il popup al click su close', async () => {
        wrapper.vm.showPopup = true
        wrapper.vm.domandaSelezionata = mockDomanda

        await wrapper.vm.closePopup()
        await wrapper.vm.$nextTick()

        expect(wrapper.vm.showPopup).toBe(false)
        expect(wrapper.vm.domandaSelezionata).toBe(null)
    })

    it('gestisce errore se la fetch della domanda fallisce', async () => {
        const spy = vi.spyOn(console, 'error').mockImplementation(() => {})
        axios.get.mockRejectedValueOnce(new Error('Errore fittizio'))

        await wrapper.findAll('.question-item')[0].trigger('click')
        await flushPromises()

        expect(wrapper.vm.showPopup).toBe(false)
        expect(wrapper.vm.domandaSelezionata).toBe(null)
        expect(spy).toHaveBeenCalled()

        spy.mockRestore()
    })
})
