import { mount, flushPromises } from '@vue/test-utils'
import StoricoView from '@/views/StoricoView.vue'
import axios from 'axios'
import { describe, it, vi, expect, beforeEach, afterEach } from 'vitest'
import { createRouter, createWebHistory } from 'vue-router'

// Mock axios
vi.mock('axios')

// Mock dati dei test
const mockTests = [
    {
        id: 1,
        dataEsecuzione: '2025-04-01T10:00:00Z',
        score: 0.87,
        LLM: 'GPT-4'
    },
    {
        id: 2,
        dataEsecuzione: '2025-03-28T12:30:00Z',
        score: 0.72,
        LLM: 'Claude'
    }
]

// Mock router
const router = createRouter({
    history: createWebHistory(),
    routes: [{ path: '/testresult/:id', name: 'TestResult' }]
})

describe('StoricoView.vue', () => {
    let wrapper

    beforeEach(async () => {
        axios.get.mockResolvedValue({ data: mockTests })

        wrapper = mount(StoricoView, {
            global: {
                plugins: [router]
            }
        })

        await flushPromises()
    })

    afterEach(() => {
        vi.resetAllMocks()
    })

    it('carica e mostra i test al mount', () => {
        expect(axios.get).toHaveBeenCalledWith('/risultati')
        expect(wrapper.vm.tests.length).toBe(2)

        const cards = wrapper.findAll('.test-card')
        expect(cards.length).toBe(2)
        expect(cards[0].text()).toContain('GPT-4')
        expect(cards[1].text()).toContain('Claude')
    })

    it('mostra il messaggio se non ci sono test eseguiti', async () => {
        axios.get.mockResolvedValue({ data: [] })

        wrapper = mount(StoricoView, {
            global: {
                plugins: [router]
            }
        })

        await flushPromises()

        expect(wrapper.text()).toContain('Nessuna test eseguito')
    })

    it('naviga al dettaglio del test cliccando su una card', async () => {
        router.push = vi.fn()
        await wrapper.find('.test-card').trigger('click')
        expect(router.push).toHaveBeenCalledWith({ name: 'TestResult', params: { id: 1 } })
    })
})
