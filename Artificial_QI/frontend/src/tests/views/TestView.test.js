import { mount, flushPromises } from '@vue/test-utils'
import TestView from '@/views/TestView.vue'
import axios from 'axios'
import { createRouter, createWebHistory } from 'vue-router'
import { describe, it, vi, expect, beforeEach, afterEach } from 'vitest'
import { globalState } from '@/globalState'

// Mock axios
vi.mock('axios')

// Router finto per simulare il push
const router = createRouter({
    history: createWebHistory(),
    routes: [{ path: '/testresult/:id', name: 'TestResult' }]
})

describe('TestView.vue', () => {
    let wrapper

    beforeEach(async () => {
        vi.useFakeTimers()
        axios.get.mockResolvedValue({
            data: {
                starting: false,
                in_progress: false,
                completed: false
            }
        })
        wrapper = mount(TestView, {
            global: {
                plugins: [router]
            }
        })
        await flushPromises()
    })

    afterEach(() => {
        vi.clearAllTimers()
        vi.resetAllMocks()
    })

    it('mostra il pulsante "Inizia Test" se il test non è avviato', () => {
        const startBtn = wrapper.find('.start-btn')
        expect(startBtn.exists()).toBe(true)
        expect(startBtn.text()).toBe('Inizia Test')
    })

    it('avvia il test cliccando "Inizia Test"', async () => {
        axios.post.mockResolvedValueOnce({ status: 200 })
        axios.get.mockResolvedValueOnce({ data: { in_progress: true, percentage: 0 } })

        await wrapper.find('.start-btn').trigger('click')
        await flushPromises()

        vi.advanceTimersByTime(1000)
        await flushPromises()

        expect(axios.post).toHaveBeenCalledWith('/executeTest')
        expect(wrapper.vm.testStarted).toBe(true)
        expect(wrapper.vm.progress).toBe(0)
    })

    it('completa il test se il backend restituisce percentage=100', async () => {
        wrapper.vm.testStarted = true
        axios.get.mockResolvedValueOnce({
            data: {
                in_progress: false,
                percentage: 100,
                id_risultato: 5
            }
        })

        await wrapper.vm.checkTestStatus()
        expect(wrapper.vm.testCompleted).toBe(true)
        expect(wrapper.vm.id).toBe(5)
    })

    it('naviga alla pagina del risultato con id corretto', async () => {
        wrapper.vm.testCompleted = true
        wrapper.vm.id = 123

        router.push = vi.fn()
        await wrapper.vm.goToResult()

        expect(router.push).toHaveBeenCalledWith({ name: 'TestResult', params: { id: 123 } })
    })

    it('mostra stato test in esecuzione se già in corso al mount', async () => {
        axios.get.mockResolvedValueOnce({
            data: {
                in_progress: true,
                percentage: 42
            }
        })

        wrapper = mount(TestView, {
            global: {
                plugins: [router]
            }
        })

        await flushPromises()
        vi.advanceTimersByTime(1000)

        expect(wrapper.vm.testStarted).toBe(true)
        expect(wrapper.vm.progress).toBe(42)
    })

})
