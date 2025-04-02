import { mount } from '@vue/test-utils'
import { describe, it, expect } from 'vitest'
import App from '@/App.vue'

describe('App.vue', () => {
    it('Renderizza l\'app con la navbar e il componente routerview, che gestisce le viste', () => {
        const wrapper = mount(App, {
            global: {
                stubs: {
                    Navbar: true,
                    RouterView: true
                }
            }
        })
        expect(wrapper.find('header').exists()).toBe(true)
        expect(wrapper.findComponent({ name: 'Navbar' }).exists()).toBe(true)
        expect(wrapper.findComponent({ name: 'RouterView' }).exists()).toBe(true)
    })
})
