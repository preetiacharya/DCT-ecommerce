task :setup_data => :environment do
  Category.create(name: "Sports, Fitness, & Outdoors")
  Category.create(name: "Home, Kitchen & Pets")
  Category.create(name: "Books")
  Category.create(name: "Shoes")

  SubCategory.create(name: "Cricket", category_id: 1)
  SubCategory.create(name: "Badminton", category_id: 1)
  SubCategory.create(name: "Swimming", category_id: 1)
  SubCategory.create(name: "Home Improvement", category_id: 2)
  SubCategory.create(name: "Furniture", category_id: 2)
  SubCategory.create(name: "Pet supplies", category_id: 2)
  SubCategory.create(name: "Textbooks", category_id: 3)
  SubCategory.create(name: "ebooks", category_id: 3)
  SubCategory.create(name: "Exam central", category_id: 3)
  SubCategory.create(name: "Sneakers", category_id: 4)
  SubCategory.create(name: " Formal shoes", category_id: 4)
  SubCategory.create(name: "Sandal & Floaters", category_id: 4)


  100.times do
    product = Product.new
    product.name = Faker::Commerce.product_name
    product.price = Faker::Commerce.price(10,1000)
    product.description = Faker::Lorem.paragraph
    product.stock = Faker::Number.number(3)
    product.cod_eligibility = [true,false].sample
    category = Category.all.sample
    product.category_id = category.id
    product.sub_category_id = category.sub_categories.sample.id
    product.save
  end
end
