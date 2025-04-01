import { mount } from '@vue/test-utils'
import { describe, it, expect } from 'vitest'
import Test from '@/components/Test.vue'

describe('Test.vue', () => {
    it('si monta correttamente', () => {
        const wrapper = mount(Test, {
            props: {
                test: {
                    dataEsecuzione: '2025-04-01',
                    llmUsed: 'GPT-4',
                    score: 10,
                    risultatiDomande: []
                }
            }
        })

        expect(wrapper.exists()).toBe(true)
    })
})
