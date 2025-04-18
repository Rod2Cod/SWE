import { describe, it, expect } from 'vitest';
import { nextTick } from 'vue';

describe('main.js', () => {
    it('Monta l\'app nel div con id #app', async () => {
        document.body.innerHTML = `<div id="app"></div>`;
        await import('@/main.js');
        await nextTick();
        const appEl = document.getElementById('app');
        expect(appEl.innerHTML).not.toBe('');
    });
});
