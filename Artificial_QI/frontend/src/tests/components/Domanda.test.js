import { mount } from '@vue/test-utils';
import { describe, it, expect, vi, beforeEach } from 'vitest';
import Domanda from '@/components/Domanda.vue';

describe('Domanda.vue', () => {
    const mockRouterPush = vi.fn();

    const factory = (props) => mount(Domanda, {
        props,
        global: {
            mocks: {
                $router: {
                    push: mockRouterPush,
                },
            },
            stubs: {
                IonIcon: {
                    template: '<div class="ion-icon-stub" @click="$emit(\'click\')"></div>',
                },
            },
        },
    });

    beforeEach(() => {
        mockRouterPush.mockClear();
    });

    it('renderizza il titolo della domanda e la risposta attesa', () => {
        const wrapper = factory({
            id: 42,
            question: 'Che cos\'è l\'IA?',
            expectedAnswer: 'Intelligenza Artificiale',
        });
        expect(wrapper.find('.question-title').text()).toBe('Che cos\'è l\'IA?');
        expect(wrapper.find('.expected-answer').text()).toBe('Intelligenza Artificiale');
    });

    it('al click sull\'icona, chiama editQuestion e naviga correttamente', async () => {
        const wrapper = factory({
            id: 42,
            question: 'Che cos\'è l\'IA?',
            expectedAnswer: 'Intelligenza Artificiale',
        });
        const icon = wrapper.find('.ion-icon-stub');
        await icon.trigger('click');
        expect(mockRouterPush).toHaveBeenCalledWith('/editquestion/42');
    });
});
