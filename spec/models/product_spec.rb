require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    let(:category) { Category.create!(name: 'Toys') }
    let(:product) { category.products.new(name: 'Bear', price: 64.99, quantity: 5) }
    # let(:no_price) { category.products.new(name: 'Bear', quantity: 5) }

    it 'Should save to db if name, category, price and quantity are present' do
      product.save
      expect(product).to be_persisted
      expect(product.id).to be_present
    end

    it 'Should throw an error with no name present' do
      product.name = nil
      product.save
      expect(product).to_not be_persisted
      expect(product.errors.size).to eql(1)
      expect(product.errors.full_messages).to include('Name can\'t be blank')
    end

    it 'Should throw an error with no price present' do
      product.price_cents = nil
      product.save
      expect(product).to_not be_persisted
      expect(product.errors.size).to eql(3)
      expect(product.errors.full_messages).to include('Price can\'t be blank')
    end

    it 'Should throw an error with no category present' do
      product.category = nil
      product.save
      expect(product).to_not be_persisted
      expect(product.errors.size).to eql(1)
      expect(product.errors.full_messages).to include('Category can\'t be blank')
    end

    it 'Should throw an error with no quantity present' do
      product.quantity = nil
      product.save
      expect(product).to_not be_persisted
      expect(product.errors.size).to eql(1)
      expect(product.errors.full_messages).to include('Quantity can\'t be blank')

    end

  end

end

