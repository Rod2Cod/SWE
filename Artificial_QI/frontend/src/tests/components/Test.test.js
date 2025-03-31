import { describe, it, expect } from "vitest";
import { mount } from "@vue/test-utils";
import TestComponent from "@/components/Test.vue";

describe("TestComponent", () => {

    const mockTest = {
        date: "2025-03-16",
        llmUsed: "GPT-4",
        score: 85,
        questionSet: "Set 1",
        questions: [
            {
                text: "Domanda 1",
                expectedAnswer: "Risposta 1",
                llmResponse: "Risposta LLM 1",
                score: 10,
            },
            {
                text: "Domanda 2",
                expectedAnswer: "Risposta 2",
                llmResponse: "Risposta LLM 2",
                score: 8,
            },
        ],
    };

    it("Il componente si monta correttamente", () => {
        const wrapper = mount(TestComponent, {
            props: {
                test: mockTest,
            },
        });
        expect(wrapper.exists()).toBe(true);
    });

    it("Visualizza le info di base: data, llmUsed, score, questionSet", () => {
        const wrapper = mount(TestComponent, {
            props: {
                test: mockTest,
            },
        });

        const titleEl = wrapper.find(".test-title");
        expect(titleEl.text()).toContain("Test del 2025-03-16");


        const infoEls = wrapper.findAll(".test-info");

        expect(infoEls[0].text()).toContain("GPT-4");

        expect(infoEls[1].text()).toContain("85");

        expect(infoEls[2].text()).toContain("Set 1");
    });

    it("Renderizza correttamente le domande", () => {
        const wrapper = mount(TestComponent, {
            props: {
                test: mockTest,
            },
        });

        const questionItems = wrapper.findAll(".question-item");
        expect(questionItems.length).toBe(mockTest.questions.length);

        const firstQuestion = questionItems[0];
        expect(firstQuestion.find(".question-text").text()).toContain("Domanda 1");
        expect(firstQuestion.find(".expected-answer").text()).toContain("Risposta 1");
        expect(firstQuestion.find(".llm-response").text()).toContain("Risposta LLM 1");
        expect(firstQuestion.find(".score").text()).toContain("10");

        const secondQuestion = questionItems[1];
        expect(secondQuestion.find(".question-text").text()).toContain("Domanda 2");
        expect(secondQuestion.find(".expected-answer").text()).toContain("Risposta 2");
        expect(secondQuestion.find(".llm-response").text()).toContain("Risposta LLM 2");
        expect(secondQuestion.find(".score").text()).toContain("8");
    });
});
