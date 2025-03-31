import { mount } from '@vue/test-utils';
import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import DomandeView from '@/views/DomandeView.vue';

describe('DomandeView.vue', () => {
    const mockRouterPush = vi.fn();
    const globalConfig = {
        config: {
            globalProperties: {
                $router: {
                    push: mockRouterPush,
                },
            },
        },
        stubs: {
            IonIcon: {
                template: '<div class="ion-icon-stub" @click="$emit(\'click\')"></div>',
            },
            Domanda: {
                template: '<div class="domanda-stub"></div>',
            },
        },
    };

    beforeEach(() => {
        mockRouterPush.mockClear();
        vi.stubGlobal('alert', vi.fn());
        vi.stubGlobal('confirm', () => true);
    });

    afterEach(() => {
        vi.unstubAllGlobals();
    });

    it('renderizza il titolo della pagina e la lista di domande', () => {
        const wrapper = mount(DomandeView, { global: globalConfig });
        expect(wrapper.find('.page-title').text()).toBe('Domande');
        const questionContainers = wrapper.findAll('.question-container');
        expect(questionContainers.length).toBe(3);
    });

    it('al click del pulsante "Aggiungi" naviga a "/addquestion"', async () => {
        const wrapper = mount(DomandeView, { global: globalConfig });
        const addBtn = wrapper.find('.add-btn');
        await addBtn.trigger('click');
        expect(mockRouterPush).toHaveBeenCalledWith('/addquestion');
    });

    it('attiva la modalità di eliminazione e mostra le checkbox', async () => {
        const wrapper = mount(DomandeView, { global: globalConfig });
        expect(wrapper.find('input.question-checkbox').exists()).toBe(false);
        const deleteBtn = wrapper.find('.delete-btn');
        await deleteBtn.trigger('click');
        const checkboxes = wrapper.findAll('input.question-checkbox');
        expect(checkboxes.length).toBe(3);
    });

    it('gestisce la selezione delle domande tramite checkbox', async () => {
        const wrapper = mount(DomandeView, { global: globalConfig });
        const deleteBtn = wrapper.find('.delete-btn');
        await deleteBtn.trigger('click');
        expect(wrapper.vm.selectedQuestions).toEqual([]);
        const checkboxes = wrapper.findAll('input.question-checkbox');
        await checkboxes[0].setValue(true);
        expect(wrapper.vm.selectedQuestions).toEqual([1]);
        await checkboxes[0].setValue(false);
        expect(wrapper.vm.selectedQuestions).toEqual([]);
    });

    it('mostra un alert se si tenta di confermare l\'eliminazione senza selezionare domande', async () => {
        const alertSpy = vi.fn();
        vi.stubGlobal('alert', alertSpy);
        const wrapper = mount(DomandeView, { global: globalConfig });
        const deleteBtn = wrapper.find('.delete-btn');
        await deleteBtn.trigger('click');
        const confirmDeleteBtn = wrapper.find('.confirm-delete-btn');
        await confirmDeleteBtn.trigger('click');
        expect(alertSpy).toHaveBeenCalled();
    });

    it('elimina le domande selezionate al conferma', async () => {
        vi.stubGlobal('confirm', () => true);
        const wrapper = mount(DomandeView, { global: globalConfig });
        const deleteBtn = wrapper.find('.delete-btn');
        await deleteBtn.trigger('click');
        const checkboxes = wrapper.findAll('input.question-checkbox');
        await checkboxes[0].setValue(true);
        await checkboxes[1].setValue(true);
        expect(wrapper.vm.selectedQuestions).toEqual([1, 2]);
        const confirmDeleteBtn = wrapper.find('.confirm-delete-btn');
        await confirmDeleteBtn.trigger('click');
        expect(wrapper.vm.questions.length).toBe(1);
        expect(wrapper.vm.questions[0].id).toBe(3);
        expect(wrapper.vm.isDeleting).toBe(false);
    });

    it('annulla la modalità di eliminazione al click del pulsante "Annulla"', async () => {
        const wrapper = mount(DomandeView, { global: globalConfig });
        const deleteBtn = wrapper.find('.delete-btn');
        await deleteBtn.trigger('click');
        expect(wrapper.vm.isDeleting).toBe(true);
        const cancelBtn = wrapper.find('.cancel-btn');
        await cancelBtn.trigger('click');
        expect(wrapper.vm.isDeleting).toBe(false);
        expect(wrapper.vm.selectedQuestions).toEqual([]);
    });
});
