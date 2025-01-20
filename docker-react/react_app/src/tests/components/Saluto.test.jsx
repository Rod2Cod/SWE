import React from 'react';
import { render, screen } from '@testing-library/react';
import Saluto from '@/components/Saluto';

test('renders greeting with name', () => {
    render(<Saluto nome="Luca" />);
    const greetingElement = screen.getByText(/Ciao, Luca!/i);
    expect(greetingElement).toBeInTheDocument();
});
