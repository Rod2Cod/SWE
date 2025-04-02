import { mount, flushPromises } from '@vue/test-utils'
import DomandeView from "@/views/DomandeView.vue";
import axios from 'axios'
import { createRouter, createWebHistory } from 'vue-router'
import { describe, it, vi, expect, beforeEach } from 'vitest'

// Mock domande
const mockQuestions = [
    { id: 1, domanda: 'Domanda 1', risposta: 'Risposta 1' },
    { id: 2, domanda: 'Domanda 2', risposta: 'Risposta 2' }
]

vi.mock('axios')

// Router mock
const router = createRouter({
    history: createWebHistory(),
    routes: [{ path: '/addquestion', name: 'AddQuestion' }]
})

describe('DomandeView.vue', () => {
    let wrapper

    beforeEach(async () => {
        axios.get.mockResolvedValue({ data: mockQuestions })
        wrapper = mount(DomandeView, {
            global: {
                plugins: [router]
            }
        })
        await flushPromises()
    })

    it('carica le domande al mount', () => {
        expect(axios.get).toHaveBeenCalledWith('/domande')
        expect(wrapper.vm.questions.length).toBe(2)
    })

    it('mostra il messaggio se non ci sono domande', async () => {
        axios.get.mockResolvedValue({ data: [] })
        wrapper = mount(DomandeView, { global: { plugins: [router] } })
        await flushPromises()
        expect(wrapper.text()).toContain('Nessuna domanda inserita!')
    })

    it('naviga alla pagina per aggiungere una domanda', async () => {
        router.push = vi.fn()
        await wrapper.vm.goToAddQuestion()
        expect(router.push).toHaveBeenCalledWith('/addquestion')
    })

    it('attiva la modalità eliminazione', async () => {
        await wrapper.find('.delete-btn').trigger('click')
        expect(wrapper.vm.isDeleting).toBe(true)
    })

    it('seleziona e deseleziona una domanda', async () => {
        wrapper.vm.startDeleteMode()
        await wrapper.vm.$nextTick()
        wrapper.vm.toggleSelection(1)
        expect(wrapper.vm.selectedQuestions).toContain(1)

        wrapper.vm.toggleSelection(1)
        expect(wrapper.vm.selectedQuestions).not.toContain(1)
    })

    it('conferma e invia la richiesta di eliminazione', async () => {
        axios.delete.mockResolvedValue({})
        window.confirm = vi.fn(() => true)

        wrapper.vm.startDeleteMode()
        wrapper.vm.selectedQuestions = [1]
        await wrapper.vm.confirmDelete()

        expect(axios.delete).toHaveBeenCalledWith('/domande/delete', { data: { ids: [1] } })
        expect(wrapper.vm.questions.length).toBe(1) // Rimuove la domanda 1
        expect(wrapper.vm.isDeleting).toBe(false)
    })

    it('non elimina nulla se nessuna domanda è selezionata', async () => {
        window.alert = vi.fn()
        wrapper.vm.selectedQuestions = []
        await wrapper.vm.confirmDelete()
        expect(window.alert).toHaveBeenCalledWith('Seleziona almeno una domanda da eliminare.')
    })
})
