import { mount } from '@vue/test-utils';
import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import ModificaDomanda from '@/views/ModificaDomanda.vue';

describe('ModificaDomanda.vue', () => {
    const mockRouterPush = vi.fn();
    const globalConfig = {
        config: {
            globalProperties: {
                $router: { push: mockRouterPush }
            }
        }
    };

    beforeEach(() => {
        mockRouterPush.mockClear();
        vi.useFakeTimers();
    });

    afterEach(() => {
        vi.useRealTimers();
    });

    it('mostra il testo di caricamento inizialmente', () => {
        const wrapper = mount(ModificaDomanda, { global: globalConfig });
        expect(wrapper.find('.loading-text').exists()).toBe(true);
        expect(wrapper.find('.loading-text').text()).toBe('Caricamento domanda...');
    });

    it('mostra il form con i dati caricati dopo il timeout', async () => {
        const wrapper = mount(ModificaDomanda, { global: globalConfig });
        expect(wrapper.find('form').exists()).toBe(false);
        vi.advanceTimersByTime(500);
        await wrapper.vm.$nextTick();
        expect(wrapper.find('form').exists()).toBe(true);
        const input = wrapper.find('input#question');
        const textarea = wrapper.find('textarea#answer');
        expect(input.element.value).toBe("Cos'è Vue.js?");
        expect(textarea.element.value).toBe("Vue.js è un framework JavaScript progressivo per la creazione di interfacce utente.");
    });

    it('aggiorna i dati della domanda e invia il form', async () => {
        const wrapper = mount(ModificaDomanda, { global: globalConfig });
        vi.advanceTimersByTime(500);
        await wrapper.vm.$nextTick();
        const input = wrapper.find('input#question');
        const textarea = wrapper.find('textarea#answer');
        await input.setValue('Nuova domanda');
        await textarea.setValue('Nuova risposta');
        const consoleSpy = vi.spyOn(console, 'log').mockImplementation(() => {});
        await wrapper.find('form').trigger('submit.prevent');
        expect(consoleSpy).toHaveBeenCalledWith("Domanda modificata:", "Nuova domanda", "Nuova risposta");
        consoleSpy.mockRestore();
    });

    it('esegue submitForm e logga i dati con valori predefiniti se non modificati', async () => {
        const wrapper = mount(ModificaDomanda, { global: globalConfig });
        vi.advanceTimersByTime(500);
        await wrapper.vm.$nextTick();
        const consoleSpy = vi.spyOn(console, 'log').mockImplementation(() => {});
        await wrapper.find('form').trigger('submit.prevent');
        expect(consoleSpy).toHaveBeenCalledWith("Domanda modificata:", "Cos'è Vue.js?", "Vue.js è un framework JavaScript progressivo per la creazione di interfacce utente.");
        consoleSpy.mockRestore();
    });

    it('naviga a "/questions" quando si clicca il pulsante "Annulla"', async () => {
        const wrapper = mount(ModificaDomanda, { global: globalConfig });
        vi.advanceTimersByTime(500);
        await wrapper.vm.$nextTick();
        await wrapper.find('button.cancel-btn').trigger('click');
        expect(mockRouterPush).toHaveBeenCalledWith("/questions");
    });
});
