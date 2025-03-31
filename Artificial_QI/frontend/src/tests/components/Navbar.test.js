import { mount } from "@vue/test-utils";
import { describe, it, expect } from "vitest";
import Navbar from "@/components/Navbar.vue";

describe("Navbar.vue", () => {
    const wrapper = mount(Navbar, {
        global: {
            stubs: {
                RouterLink: {
                    template: '<a><slot/></a>',
                },
            },
        },
    });

    it("si monta correttamente", () => {
        expect(wrapper.exists()).toBe(true);
    });

    it("renderizza il numero corretto di link", () => {
        const navLinks = wrapper.findAll("ul.nav-links li");
        expect(navLinks.length).toBe(3);
    });

    it("toggleMenu cambia la classe dei nav-links al click del bottone hamburger", async () => {
        const navLinks = wrapper.find("ul.nav-links");

        expect(navLinks.classes()).not.toContain("show");


        const hamburgerButton = wrapper.find("button.hamburger");
        await hamburgerButton.trigger("click");
        expect(navLinks.classes()).toContain("show");

        await hamburgerButton.trigger("click");
        expect(navLinks.classes()).not.toContain("show");
    });

    it("closeMenu chiude il menu quando si clicca un link", async () => {
        const navLinks = wrapper.find("ul.nav-links");

        const hamburgerButton = wrapper.find("button.hamburger");
        await hamburgerButton.trigger("click");
        expect(navLinks.classes()).toContain("show");


        const link = wrapper.find("ul.nav-links li a");
        await link.trigger("click");

        expect(navLinks.classes()).not.toContain("show");
    });
});
