import { describe, it, expect, vi, beforeEach } from "vitest";
import { mount } from "@vue/test-utils";
import HomeView from "@/views/HomeView.vue"; // Aggiorna il path in base alla tua struttura

describe("HomeView", () => {
    let wrapper;
    let mockRouterPush;

    beforeEach(() => {
        mockRouterPush = vi.fn();

        wrapper = mount(HomeView, {
            global: {
                mocks: {
                    $router: {
                        push: mockRouterPush,
                    },
                },
                stubs: {
                    IonIcon: {
                        template: "<div><slot /></div>",
                    },
                },
            },
        });
    });

    it("Il componente si monta correttamente", () => {
        expect(wrapper.exists()).toBe(true);
    });

    it("Mostra il titolo 'Artifial QI'", () => {
        const title = wrapper.find("h1");
        expect(title.exists()).toBe(true);
        expect(title.text()).toBe("Artifial QI");
    });

    it("Mostra il pulsante con testo 'Scopri di più'", () => {
        const button = wrapper.find("button.cta-btn");
        expect(button.exists()).toBe(true);
        expect(button.text()).toBe("Scopri di più");
    });

    it("Click sul pulsante chiama $router.push('/questions')", async () => {
        const button = wrapper.find("button.cta-btn");
        await button.trigger("click");
        expect(mockRouterPush).toHaveBeenCalledWith("/questions");
    });

    it("Controlla la presenza della sezione 'Come funziona?'", () => {
        const sectionTitle = wrapper.find(".features h2");
        expect(sectionTitle.exists()).toBe(true);
        expect(sectionTitle.text()).toBe("Come funziona?");
    });

    it("Verifica la presenza di 3 feature-card", () => {
        const featureCards = wrapper.findAll(".feature-card");
        expect(featureCards.length).toBe(3);
    });
});
