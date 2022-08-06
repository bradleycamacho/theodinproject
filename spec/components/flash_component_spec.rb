require 'rails_helper'

RSpec.describe FlashComponent, type: :component do
  context 'when a notice' do
    it 'renders a success flash message' do
      component = described_class.new(type: 'notice', message: 'You did a thing')

      render_inline(component)

      expect(page).to have_text('Success')
    end
  end

  context 'when an alert' do
    it 'renders an error flash message' do
      component = described_class.new(type: 'alert', message: "You didn't do a thing")

      render_inline(component)

      expect(page).to have_text('Error')
    end
  end
end
