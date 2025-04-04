import { mount, flushPromises } from '@vue/test-utils'
import TestResultView from '@/views/TestResultView.vue'
import axios from 'axios'
import { describe, it, vi, expect, beforeEach, afterEach } from 'vitest'
import { createRouter, createWebHistory } from 'vue-router'

// Mock axios
vi.mock('axios')

const mockTest = {
    id: 1,
    dataEsecuzione: '2025-04-01T10:00:00Z',
    score: 0.9,
    risultatiDomande: [
        { domanda: 'Domanda 1', rispostaUtente: 'Risposta A', corretta: true }
    ]
}

const router = createRouter({
    history: createWebHistory(),
    routes: [{ path: '/result/:id', name: 'TestResultView' }]
})

describe('TestResultView.vue', () => {
    let wrapper

    beforeEach(async () => {
        axios.get.mockResolvedValue({ data: mockTest })

        router.push('/result/1')
        await router.isReady()

        wrapper = mount(TestResultView, {
            global: {
                plugins: [router]
            }
        })

        await flushPromises()
    })

    afterEach(() => {
        vi.resetAllMocks()
    })

    it('carica il test al mount', () => {
        expect(axios.get).toHaveBeenCalledWith('/risultati/1')
        expect(wrapper.vm.test.id).toBe(1)
    })

    it('passa la prop test al componente <Test>', () => {
        const testComponent = wrapper.findComponent({ name: 'Test' })
        expect(testComponent.exists()).toBe(true)
        expect(testComponent.props('test')).toEqual(mockTest)
    })

    it('formatDate restituisce una data leggibile', () => {
        const date = '2025-04-01T10:00:00Z'
        expect(wrapper.vm.formatDate(date)).toMatch(/\d{1,2}\/\d{1,2}\/\d{2,4}/)
    })

    it('gestisce errore nel caricamento', async () => {
        const spy = vi.spyOn(console, 'error').mockImplementation(() => {})
        axios.get.mockRejectedValueOnce(new Error('Errore fittizio'))

        wrapper = mount(TestResultView, {
            global: { plugins: [router] }
        })

        await flushPromises()
        expect(spy).toHaveBeenCalledWith('Error loading test data:', expect.any(Error))

        spy.mockRestore()
    })
})
