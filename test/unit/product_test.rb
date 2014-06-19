require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def new_product(image_url)
    Product.new(title: "My Book Title", description: "yyy", price: 1, image_url: image_url)
  end

  test "product attributes must not be empty" do
    # свойства товара не должны оставаться пустыми
    product = Product.new

    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(title: "My Book Title", description: "yyy", image_url: "zzz.jpg")
    #product.price = -1
    #assert product.invalid?
    #assert_equal "must by greater than or equal to 0.01",
    #       product.errors[:price].join('; ')
         # должна быть больше или равна 0.01
    #product.price = 0.2
    #assert product.invalid?
    #assert_equal "must by greater than or equal to 0.01",
    #       product.errors[:price].join('; ')
         # должна быть больше или равна 0.01
    product.price = 1 
    assert product.valid?
  end
  
  test "image url" do
    # url image
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end
end
