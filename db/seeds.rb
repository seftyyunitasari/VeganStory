# Category
category1 = Category.create(name: "Vegetables")
category2 = Category.create(name: "Fruits")
category3 = Category.create(name: "Drinks")
category4 = Category.create(name: "Spices")
category5 =  Category.create(name: "Snacks")

# General User
user1 = User.create(name: "Jake Morton", email: "jake@seed.com", password:"password", address: "61 Newroad Manchester", phone: "+81 29-957-6178")
user2 = User.create(name: "Randal Carpio", email: "randal@seed.com", password:"password", address: "25 John's Road Bath", phone: "+81 78-112-4535")
user3 = User.create(name: "Vera Stone", email: "vera@seed.com", password:"password", address: "29 Station Road Stockport", phone: "+81 34-683-4846")
user4 = User.create(name: "Hamish Duke", email: "hamish@seed.com", password:"password", address: "99 North Road Wells", phone: "+81 31-367-6716")
user5 = User.create(name: "Lilith Bathory", email: "lilith@seed.com", password:"password", address: "627 George Street Wigan", phone: "+81 60-299-0476")

# Admin User
user6 = User.create(name: "Gabrielle Dupress", email: "gabrielle@seed.com", password:"password", is_admin: true, address: "64 Grange Road Blackpool", phone: "+81 94-847-8007")
user7 = User.create(name: "Edward Conventry", email: "edward@seed.com", password:"password", is_admin: true, address: "3 Victoria Street Cardiff", phone: "+81 88-821-9911")
user8 = User.create(name: "Selena Durov", email: "selena@seed.com", password:"password", is_admin: true, address: "35 Main Road Gloucester", phone: "+81 33-777-4074")
user9 = User.create(name: "Elizabeth Kepler", email: "elizabeth@seed.com", password:"password", is_admin: true, address: "54 Kings Road Preston", phone: "+81 25-373-6490")
user10 = User.create(name: "Eric Clarke", email: "eric@seed.com", password:"password", is_admin: true, address: "18 Green Lane Saint Albans", phone: "+81 73-498-9122")

# Product
product1 = Product.create(category_id: 1, name: "Asparagus (250 gram)", price: 470, stock: 100, description: "Asparagus", image: Rails.root.join("app/assets/images/asparagus.jpeg").open)
product2 = Product.create(category_id: 1, name: "Avocado (1 piece)", price: 135, stock: 100, description: "Avocado", image: Rails.root.join("app/assets/images/avocado.jpeg").open)
product3 = Product.create(category_id: 1, name: "Corn (1 piece)", price: 230, stock: 100, description: "Corn", image: Rails.root.join("app/assets/images/corn.jpeg").open)
product4 = Product.create(category_id: 1, name: "Pumpkin (1 piece)", price: 1170, stock: 100, description: "Pumpkin", image: Rails.root.join("app/assets/images/pumpkin.jpeg").open)
product5 = Product.create(category_id: 1, name: "tomatoes (5 pieces)", price: 480, stock: 100, description: "Tomatoes", image: Rails.root.join("app/assets/images/tomatoes.jpeg").open)
product6 = Product.create(category_id: 2, name: "Strawberry (250 gram)", price: 600, stock: 100, description: "Strawberry", image: Rails.root.join("app/assets/images/strawberry.jpeg").open)
product7 = Product.create(category_id: 2, name: "Manggo (1 Piece)", price: 450, stock: 100, description: "Manggo", image: Rails.root.join("app/assets/images/manggo.jpeg").open)
product8 = Product.create(category_id: 2, name: "Blueberry (250 gram)", price: 790, stock: 100, description: "Blueberry", image: Rails.root.join("app/assets/images/blueberry.jpeg").open)
product9 = Product.create(category_id: 2, name: "Cherry (250 gram)", price: 920, stock: 100, description: "Cherry", image: Rails.root.join("app/assets/images/cherry.png").open)
product10 = Product.create(category_id: 2, name: "Watermelon (1 Piece)", price: 1200, stock: 100, description: "Watermelon", image: Rails.root.join("app/assets/images/watermelon.jpeg").open)

# Favourite
favourite1 = Favourite.create(product_id: 1, user_id: 1)
favourite2 = Favourite.create(product_id: 2, user_id: 1)
favourite3 = Favourite.create(product_id: 3, user_id: 2)
favourite4 = Favourite.create(product_id: 4, user_id: 2)
favourite5 = Favourite.create(product_id: 5, user_id: 3)
favourite6 = Favourite.create(product_id: 6, user_id: 3)
favourite7 = Favourite.create(product_id: 7, user_id: 4)
favourite8 = Favourite.create(product_id: 8, user_id: 4)
favourite9 = Favourite.create(product_id: 9, user_id: 5)
favourite10 = Favourite.create(product_id: 10, user_id: 5)

# Comment
comment1 = Comment.create(product_id: 1, user_id: 1, content: "Good quality product")
comment2 = Comment.create(product_id: 2, user_id: 2, content: "The vegetable is fresh")
comment3 = Comment.create(product_id: 3, user_id: 3, content: "Taste is good")
comment4 = Comment.create(product_id: 4, user_id: 4, content: "Worth the price")
comment5 = Comment.create(product_id: 5, user_id: 5, content: "Gorgeous")
comment6 = Comment.create(product_id: 6, user_id: 6, content: "High quality product")
comment7 = Comment.create(product_id: 7, user_id: 7, content: "Looks nice")
comment8 = Comment.create(product_id: 8, user_id: 8, content: "Taste is good")
comment9 = Comment.create(product_id: 9, user_id: 9, content: "Fast delivery")
comment10 = Comment.create(product_id: 10, user_id: 10, content: "Good packaging when delivery")

# Payment Info
payment_info1 = Comment.create(user_id: 1, card_holder: "Jake Morton", card_number: "4916379629222343", expiration_date: "1/2025", cvc: "122")
payment_info2 = Comment.create(user_id: 2, card_holder: "Randal Carpio", card_number: "4556355610854422", expiration_date: "2/2025", cvc: "435")
payment_info3 = Comment.create(user_id: 3, card_holder: "Vera Stone", card_number: "4929890151305871", expiration_date: "3/2025", cvc: "134")
payment_info4 = Comment.create(user_id: 4, card_holder: "Hamish Duke", card_number: "4532433307175812", expiration_date: "4/2025", cvc: "278")
payment_info5 = Comment.create(user_id: 5, card_holder: "Lilith Bathory", card_number: "4532040475075458", expiration_date: "5/2025", cvc: "908")
payment_info6 = Comment.create(user_id: 6, card_holder: "Gabrielle Dupress", card_number: "5562329326508100", expiration_date: "6/2025", cvc: "124")
payment_info7 = Comment.create(user_id: 7, card_holder: "Edward Conventry", card_number: "5146583286886832", expiration_date: "7/2025", cvc: "971")
payment_info8 = Comment.create(user_id: 8, card_holder: "Selena Durov", card_number: "5100212025283390", expiration_date: "8/2025", cvc: "159")
payment_info9 = Comment.create(user_id: 9, card_holder: "Elizabeth Kepler", card_number: "5237510023106364", expiration_date: "9/2025", cvc: "149")
payment_info10 = Comment.create(user_id: 10, card_holder: "Eric Clarke", card_number: "5178302798469412", expiration_date: "10/2025", cvc: "201")

# Cart
cart = Cart.create(product_id: 1, user_id: 1, quantity: 1, subtotal: Product.find(1).price*1)
cart = Cart.create(product_id: 2, user_id: 2, quantity: 2, subtotal: Product.find(2).price*2)
cart = Cart.create(product_id: 3, user_id: 3, quantity: 3, subtotal: Product.find(3).price*3)
cart = Cart.create(product_id: 4, user_id: 4, quantity: 4, subtotal: Product.find(4).price*4)
cart = Cart.create(product_id: 5, user_id: 5, quantity: 5, subtotal: Product.find(5).price*5)

# Order
order1 = Order.create(user_id: 1, total: Product.find(1).price*2 + Product.find(2).price*4, receiver: User.find(1).name, shipping_address: User.find(1).address, phone: User.find(1).phone)
order1 = Order.create(user_id: 2, total: Product.find(3).price*6 + Product.find(4).price*7, receiver: User.find(2).name, shipping_address: User.find(2).address, phone: User.find(2).phone)
order1 = Order.create(user_id: 3, total: Product.find(5).price*9 + Product.find(6).price*1, receiver: User.find(3).name, shipping_address: User.find(3).address, phone: User.find(3).phone)
order1 = Order.create(user_id: 4, total: Product.find(7).price*3 + Product.find(8).price*5, receiver: User.find(4).name, shipping_address: User.find(4).address, phone: User.find(4).phone)
order1 = Order.create(user_id: 5, total: Product.find(9).price*6 + Product.find(10).price*10, receiver: User.find(5).name, shipping_address: User.find(5).address, phone: User.find(5).phone)

# OrderDetail
order_detail1 = OrderDetail.create(product_id: 1, user_id: 1, order_id: 1, quantity: 2, subtotal: Product.find(1).price*2)
order_detail1 = OrderDetail.create(product_id: 2, user_id: 1, order_id: 1, quantity: 4, subtotal: Product.find(2).price*4)
order_detail1 = OrderDetail.create(product_id: 3, user_id: 2, order_id: 2, quantity: 6, subtotal: Product.find(3).price*6)
order_detail1 = OrderDetail.create(product_id: 4, user_id: 2, order_id: 2, quantity: 7, subtotal: Product.find(4).price*7)
order_detail1 = OrderDetail.create(product_id: 5, user_id: 3, order_id: 3, quantity: 9, subtotal: Product.find(5).price*9)
order_detail1 = OrderDetail.create(product_id: 6, user_id: 3, order_id: 3, quantity: 1, subtotal: Product.find(6).price*1)
order_detail1 = OrderDetail.create(product_id: 7, user_id: 4, order_id: 1, quantity: 3, subtotal: Product.find(7).price*3)
order_detail1 = OrderDetail.create(product_id: 8, user_id: 4, order_id: 1, quantity: 5, subtotal: Product.find(8).price*5)
order_detail1 = OrderDetail.create(product_id: 9, user_id: 5, order_id: 2, quantity: 6, subtotal: Product.find(9).price*6)
order_detail1 = OrderDetail.create(product_id: 10, user_id: 5, order_id: 2, quantity: 10, subtotal: Product.find(10).price*10)