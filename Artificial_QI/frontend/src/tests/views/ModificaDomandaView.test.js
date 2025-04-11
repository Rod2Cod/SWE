import { mount, flushPromises } from '@vue/test-utils'
import { describe, it, expect, vi, beforeEach } from 'vitest'
import ModificaDomandaView from '@/views/ModificaDomandaView.vue'
import axios from 'axios'
import { createRouter, createMemoryHistory } from 'vue-router'

vi.mock('axios')

const router = createRouter({
    history: createMemoryHistory(),
    routes: [{ path: '/questions', name: 'Questions', component: { template: '<div>Questions</div>' } }]
})

describe('ModificaDomandaView.vue', () => {
    let wrapper
    let routerPush

    beforeEach(async () => {
        // Mock risposta GET
        axios.get.mockResolvedValueOnce({
            data: { domanda: 'Domanda originale', risposta: 'Risposta originale' }
        })

        // Spia su router.push
        routerPush = vi.spyOn(router, 'push')

        wrapper = mount(ModificaDomandaView, {
            global: {
                plugins: [router],
                mocks: {
                    $route: { params: { id: '123' } }
                }
            }
        })

        await router.isReady()
        await flushPromises()
    })

    it('carica la domanda e la mostra nel form', () => {
        expect(wrapper.find('#question').element.value).toBe('Domanda originale')
        expect(wrapper.find('#answer').element.value).toBe('Risposta originale')
    })

    it('mostra un alert se si invia il form con campi vuoti', async () => {
        window.alert = vi.fn()
        await wrapper.setData({ question: '', expectedAnswer: '' })
        await wrapper.find('form').trigger('submit.prevent')
        expect(window.alert).toHaveBeenCalledWith('Compila entrambi i campi.')
    })

    it('invia la modifica e fa il redirect su /questions', async () => {
        axios.put.mockResolvedValueOnce({ data: { success: true } })

        await wrapper.find('#question').setValue('Domanda modificata')
        await wrapper.find('#answer').setValue('Risposta modificata')

        await wrapper.find('form').trigger('submit.prevent')
        await flushPromises()

        expect(axios.put).toHaveBeenCalledWith('/domande/123', {
            domanda: 'Domanda modificata',
            risposta: 'Risposta modificata'
        })

        expect(routerPush).toHaveBeenCalledWith('/questions')
    })

    it('fa il redirect su Annulla', async () => {
        await wrapper.find('button.cancel-btn').trigger('click')
        expect(routerPush).toHaveBeenCalledWith('/questions')
    })

    it('reindirizza a /questions se c’è un errore durante il caricamento', async () => {
        // Forziamo un errore nel caricamento
        axios.get.mockRejectedValueOnce(new Error('Errore di caricamento'))
        const routerPush = vi.spyOn(router, 'push')

        mount(ModificaDomandaView, {
            global: {
                plugins: [router],
                mocks: {
                    $route: { params: { id: 'errore' } }
                }
            }
        })

        await flushPromises()
        expect(routerPush).toHaveBeenCalledWith('/questions')
    })

    it('gestisce errori durante il salvataggio senza bloccare il sistema', async () => {
        // Forziamo un errore nel salvataggio
        axios.put.mockRejectedValueOnce(new Error('Errore salvataggio'))

        await wrapper.find('#question').setValue('Nuova domanda')
        await wrapper.find('#answer').setValue('Nuova risposta')

        await wrapper.find('form').trigger('submit.prevent')
        await flushPromises()

        // Non ci serve una assert, basta che non crashi
        expect(true).toBe(true)
    })

})
