import { mount, flushPromises } from '@vue/test-utils'
import { describe, it, expect, vi, beforeEach } from 'vitest'
import StoricoView from '@/views/StoricoView.vue'
import axios from 'axios'

// Mock axios
vi.mock('axios')

describe('StoricoView.vue', () => {
    const mockRouter = {
        push: vi.fn()
    }

    beforeEach(() => {
        vi.clearAllMocks()
    })

    it('mostra il titolo della pagina', () => {
        const wrapper = mount(StoricoView, {
            global: {
                mocks: {
                    $router: mockRouter
                }
            }
        })

        expect(wrapper.find('h1.page-title').text()).toBe('Storico Test')
    })

    it('carica e visualizza la lista dei test', async () => {
        const mockData = [
            { id: 1, dataEsecuzione: '2024-01-01T12:00:00Z', score: 8, LLM: 'GPT-4' },
            { id: 2, dataEsecuzione: '2024-02-15T12:00:00Z', score: 10, LLM: 'Claude' }
        ]

        axios.get.mockResolvedValueOnce({ data: mockData })

        const wrapper = mount(StoricoView, {
            global: {
                mocks: {
                    $router: mockRouter
                }
            }
        })

        await flushPromises()

        const cards = wrapper.findAll('.test-card')
        expect(cards.length).toBe(2)
        expect(cards[0].text()).toContain('GPT-4')
        expect(cards[1].text()).toContain('Claude')
    })

    it('mostra il messaggio se non ci sono test', async () => {
        axios.get.mockResolvedValueOnce({ data: [] })

        const wrapper = mount(StoricoView, {
            global: {
                mocks: {
                    $router: mockRouter
                }
            }
        })

        await flushPromises()

        expect(wrapper.find('h2').text()).toBe('Nessuna test eseguito')
    })

    it('cliccando su una card va al dettaglio del test', async () => {
        axios.get.mockResolvedValueOnce({
            data: [{ id: 99, dataEsecuzione: '2024-04-01T00:00:00Z', score: 9, LLM: 'Gemini' }]
        })

        const wrapper = mount(StoricoView, {
            global: {
                mocks: {
                    $router: mockRouter
                }
            }
        })

        await flushPromises()

        await wrapper.find('.test-card').trigger('click')
        expect(mockRouter.push).toHaveBeenCalledWith({ name: 'TestResult', params: { id: 99 } })
    })

    it('formatDate restituisce una stringa leggibile', () => {
        const wrapper = mount(StoricoView, {
            global: {
                mocks: {
                    $router: mockRouter
                }
            }
        })

        const result = wrapper.vm.formatDate('2024-03-31T12:00:00Z')
        expect(result).toMatch(/\d{2}\/\d{2}\/\d{4}/)
    })
})
