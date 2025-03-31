import { mount } from '@vue/test-utils';
import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import TestView from '@/views/TestView.vue';

describe('TestView.vue', () => {
    beforeEach(() => {
        vi.useFakeTimers();
    });
    afterEach(() => {
        vi.useRealTimers();
    });

    it('renders initial state with start button', () => {
        const wrapper = mount(TestView);
        expect(wrapper.find('.page-title').text()).toBe('Esegui un Test');
        expect(wrapper.find('button.start-btn').exists()).toBe(true);
        expect(wrapper.find('.progress-container').exists()).toBe(false);
        expect(wrapper.find('.test-results').exists()).toBe(false);
    });

    it('starts test execution on clicking the start button', async () => {
        const wrapper = mount(TestView);
        await wrapper.find('button.start-btn').trigger('click');
        expect(wrapper.vm.testStarted).toBe(true);
        expect(wrapper.find('.progress-container').exists()).toBe(true);
        expect(wrapper.find('.test-results').exists()).toBe(false);
        expect(wrapper.vm.progress).toBe(0);
    });

    it('updates progress during test execution and completes test execution', async () => {
        const wrapper = mount(TestView, {
            global: {
                stubs: {
                    Test: {
                        template: '<div class="test-stub">{{ test.llmUsed }}</div>',
                        props: ['test']
                    }
                }
            }
        });
        await wrapper.find('button.start-btn').trigger('click');
        for (let i = 1; i <= 5; i++) {
            vi.advanceTimersByTime(300);
            await wrapper.vm.$nextTick();
        }
        expect(wrapper.vm.progress).toBe(50);
        const progressFill = wrapper.find('.progress-fill');
        expect(progressFill.exists()).toBe(true);
        expect(progressFill.element.style.width).toBe('50%');
        for (let i = 6; i <= 10; i++) {
            vi.advanceTimersByTime(300);
            await wrapper.vm.$nextTick();
        }
        expect(wrapper.vm.progress).toBe(100);

    });

    it('renders the Test component with test data after completion', async () => {
        const wrapper = mount(TestView, {
            global: {
                stubs: {
                    Test: {
                        template: '<div class="test-stub">{{ test.llmUsed }}</div>',
                        props: ['test']
                    }
                }
            }
        });
        await wrapper.find('button.start-btn').trigger('click');
        vi.advanceTimersByTime(3000);
        vi.runOnlyPendingTimers();
        await wrapper.vm.$nextTick();
        expect(wrapper.vm.testCompleted).toBe(true);
        const testStub = wrapper.find('.test-stub');
        expect(testStub.exists()).toBe(true);
        expect(testStub.text()).toBe('GPT-4');
        expect(wrapper.vm.test).toHaveProperty('questionSet', 'Vue Basics');
        expect(wrapper.vm.test.questions.length).toBe(2);
    });
});
