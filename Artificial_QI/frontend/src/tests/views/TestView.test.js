import { mount, flushPromises } from '@vue/test-utils'
import { describe, it, expect, vi, beforeEach } from 'vitest'
import TestView from '@/views/TestView.vue'
import axios from 'axios'

// Mock axios
vi.mock('axios')

describe('TestView.vue', () => {
    let wrapper
    const mockRouter = {
        push: vi.fn()
    }

    beforeEach(() => {
        vi.useFakeTimers()
        vi.clearAllMocks()
        wrapper = mount(TestView, {
            global: {
                mocks: {
                    $router: mockRouter
                }
            }
        })
    })

    it('avvia il test e mostra la barra di avanzamento', async () => {
        const startPollingMock = vi.fn()
        wrapper.vm.startPolling = startPollingMock

        await wrapper.find('.start-btn').trigger('click')

        expect(wrapper.vm.testStarted).toBe(true)
        expect(startPollingMock).toHaveBeenCalled()
        expect(wrapper.find('.progress-container').exists()).toBe(true)
    })


    it('cliccando su "Vai al risultato!" naviga alla pagina dei risultati', async () => {
        wrapper.setData({
            testCompleted: true,
            id: 'abc123'
        })

        await flushPromises()
        await wrapper.find('.start-btn').trigger('click')

        expect(mockRouter.push).toHaveBeenCalledWith({
            name: 'TestResult',
            params: { id: 'abc123' }
        })
    })
})
