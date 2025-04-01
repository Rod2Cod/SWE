import { mount, flushPromises } from '@vue/test-utils'
import { describe, it, expect, vi, beforeEach } from 'vitest'
import AggiungiDomandaView from '@/views/AggiungiDomandaView.vue'
import axios from 'axios'
import { createRouter, createMemoryHistory } from 'vue-router'

// Mock di Axios
vi.mock('axios')

// Router fittizio per simulare la navigazione
const router = createRouter({
    history: createMemoryHistory(),
    routes: [
        { path: '/questions', name: 'Questions', component: { template: '<div>Questions</div>' } }
    ]
})

describe('AggiungiDomandaView.vue', () => {
    let wrapper

    beforeEach(async () => {
        wrapper = mount(AggiungiDomandaView, {
            global: {
                plugins: [router]
            }
        })
        await router.isReady()
    })

    it('mostra correttamente il modulo', () => {
        expect(wrapper.find('input#question').exists()).toBe(true)
        expect(wrapper.find('textarea#answer').exists()).toBe(true)
        expect(wrapper.find('button.submit-btn').exists()).toBe(true)
    })

    it('mostra un avviso se i campi sono vuoti al momento dell\'invio', async () => {
        window.alert = vi.fn()

        await wrapper.find('form').trigger('submit.prevent')
        expect(window.alert).toHaveBeenCalledWith('Compila entrambi i campi.')
    })

    it('invia i dati e reindirizza alla pagina /questions se tutto è corretto', async () => {
        await wrapper.find('#question').setValue('Qual è la capitale d\'Italia?')
        await wrapper.find('#answer').setValue('Roma')

        axios.post.mockResolvedValueOnce({ data: { success: true } })

        await wrapper.find('form').trigger('submit.prevent')
        await flushPromises()

        expect(axios.post).toHaveBeenCalledWith('/domande', {
            domanda: 'Qual è la capitale d\'Italia?',
            risposta: 'Roma'
        })

        expect(wrapper.vm.$route.path).toBe('/questions')
    })
})
