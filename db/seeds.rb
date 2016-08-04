# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seeder
  attr_reader :all_model_names
  def initialize
    @all_model_names = ["packages", "items", "package_items", "users", "cubbies", "subscriptions", "fulfillments"]
  end

  def load
    all_model_names.each do |model_name|

      model = model_name.classify.constantize
      collection = eval(model_name)

      collection.each do |data|
        model.create(data)
        puts "#{model.count} #{model_name.capitalize} Imported!"
      end
    end
  end

  def packages
    [
    { name: "Sweet 'n Savory",
      price: 15
    },
    { name: "Savory 'n Sweet",
      price: 10
    }
    ]
  end

  def items
    [
    { name: "Peanut M&M's",
      description: "What's better than peanuts and chocolate?"
    },
    { name: "Caffeine Pills",
      description: "To stay up all night and code."
    },
    { name: "Pocket Dogs",
      description: "A hot dog in your pocket."
    }
    ]
  end

  def package_items
    [
    { package: Package.find_by(name: "Sweet 'n Savory"),
      item: Item.find_by(name: "Peanut M&M's"),
      quantity: 1
    },
    { package: Package.find_by(name: "Sweet 'n Savory"),
      item: Item.find_by(name: "Caffeine Pills"),
      quantity: 2
    },
    { package: Package.find_by(name: "Sweet 'n Savory"),
      item: Item.find_by(name: "Pocket Dogs"),
      quantity: 3
    }
    ]
  end

  def users
    [
    { first_name: "Neight",
      last_name: "Aeighlen",
      email: "neightaeighlen@test.com",
      email_confirmation: "neightaeighlen@test.com",
      password: "password",
      password_confirmation: "password",
      phone_number: "123-456-7890"
    },
    { first_name: "Franco",
      last_name: "Mejia",
      email: "yungfranco@test.com",
      email_confirmation: "yungfranco@test.com",
      password: "password",
      password_confirmation: "password",
      phone_number: "123-456-7890"
    },
    { first_name: "Admin",
      last_name: "Admin",
      email: "admin@admin.com",
      email_confirmation: "admin@admin.com",
      password: "password",
      password_confirmation: "password",
      phone_number: "123-456-7890",
      role: 1
    }
    ]
  end

  def cubbies
    [
    { user_id: 1,
      location: "Big Workspace",
      column: "A",
      row: "1"
    }
    ]
  end

  def subscriptions
    [
    { user: User.find_by(first_name: "Neight"),
      price: 5,
      mod: "1703",
      weeks: 6,
      package: Package.find_by(name: "Sweet 'n Savory")
    },
    { user: User.find_by(first_name: "Franco"),
      price: 10,
      mod: "1705",
      weeks: 4,
      package: Package.find_by(name: "Savory 'n Sweet")
    }
    ]
  end

  def fulfillments
    user1 = User.find_by(first_name: "Neight")
    user2 = User.find_by(first_name: "Franco")
    [
    { week: 1,
      fulfilled?: true,
      subscription: Subscription.find_by(user: user1)
    },
    { week: 2,
      fulfilled?: true,
      subscription: Subscription.find_by(user: user1)
    },
    { week: 3,
      fulfilled?: false,
      subscription: Subscription.find_by(user: user1)
    },
    { week: 4,
      fulfilled?: false,
      subscription: Subscription.find_by(user: user1)
    },
    { week: 5,
      fulfilled?: false,
      subscription: Subscription.find_by(user: user1)
    },
    { week: 6,
      fulfilled?: false,
      subscription: Subscription.find_by(user: user1)
    },
    { week: 1,
      fulfilled?: true,
      subscription: Subscription.find_by(user: user2)
    },
    { week: 2,
      fulfilled?: false,
      subscription: Subscription.find_by(user: user2)
    },
    { week: 3,
      fulfilled?: false,
      subscription: Subscription.find_by(user: user2)
    },
    { week: 4,
      fulfilled?: false,
      subscription: Subscription.find_by(user: user2)
    }
    ]
  end
end

seeder = Seeder.new
seeder.load
