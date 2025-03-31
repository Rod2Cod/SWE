import { mount } from '@vue/test-utils';
import { describe, it, expect, vi, beforeEach } from 'vitest';
import AggiungiDomanda from '@/views/AggiungiDomanda.vue';

describe('AggiungiDomanda.vue', () => {
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
    });

    it('renders page title and form fields', () => {
        const wrapper = mount(AggiungiDomanda, { global: globalConfig });
        expect(wrapper.find('.page-title').text()).toBe('Aggiungi una Domanda');
        expect(wrapper.find('input#question').exists()).toBe(true);
        expect(wrapper.find('textarea#answer').exists()).toBe(true);
    });

    it('updates data on input and textarea change', async () => {
        const wrapper = mount(AggiungiDomanda, { global: globalConfig });
        const input = wrapper.find('input#question');
        const textarea = wrapper.find('textarea#answer');
        await input.setValue('Test question');
        await textarea.setValue('Test answer');
        expect(wrapper.vm.question).toBe('Test question');
        expect(wrapper.vm.expectedAnswer).toBe('Test answer');
    });

    it('calls submitForm and navigates to "/questions" on form submission', async () => {
        const wrapper = mount(AggiungiDomanda, { global: globalConfig });
        const input = wrapper.find('input#question');
        const textarea = wrapper.find('textarea#answer');
        await input.setValue('Test question');
        await textarea.setValue('Test answer');
        await wrapper.find('form').trigger('submit.prevent');
        expect(mockRouterPush).toHaveBeenCalledWith('/questions');
    });
});
