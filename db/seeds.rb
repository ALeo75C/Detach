# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

@brand_image_path = "public/uploads/brands/"
@product_image_path = "public/uploads/products/"

def brand_logo (file_name)
  File.open(File.join(Rails.root, @brand_image_path + file_name))
end

def product_image (file_name)
  File.open(File.join(Rails.root, @product_image_path + file_name))
end

effects = ['увлажнение', 'питание', "фиксация", 'не сушит кожу', 'не раздражает кожу']

effects.each do |effect|
  e = ActiveEffect.create!(name: effect.downcase)
end


skins = [
  {
    type: "Жирная кожа",
    about: "Блеск, пористость, частые угри и прыщи. Она имеет сероватый цвет. Плюсы такой кожи – она эластична, лучше увлажнена, хорошо защищена от действия окружающей среды благодаря пленке, которую создает жир, морщины на такой коже появляются позже, чем у обладательниц другого типа кожи."
  }, {
    type: "Сухая кожа",
    about: "Тонкая и нежная кожа, склонная к преждевременному старению, имеет низкую эластичность, часто шелушится, краснеет, трескается, воспаляется, на ней редко проявляются прыщи, но она сильно подвержена влиянию внешних факторов."
  }, {
    type: "Нормальная кожа",
    about: "Самый редкий тип. Кожа практически безупречная, в меру чувствительная, упругая, матовая, поры почти не видны. Со временем может появиться сухость, морщинки и трещины."
  }, {
    type: "Комбинированная кожа",
    about: "Этот тип распространен больше других, его особенность в том, что разные области на лице имеют разный тип кожи, например, на скулах кожа сухая, а на лбу, носу, подбородке — жирная. Эта кожа аллергична, склонна к прыщам и раздражениям."
  }, {
    type: "Чувствительня кожа",
    about: "Это кожа, которая из-за воздействий внешних факторов зудит, испытывает сухость, краснеет, воспаляется. Она плохо реагирует на применение агрессивных косметических средств. Такая кожа менее эластична и менее увлажнена, чем другие типы кожи, у нее слабые защитные свойства."
  }
]

skins.each do |skin|
  SkinType.create!(name: skin[:type], description: skin[:about])
end

users = [
  {
    email: "za.iz.pr@yandex.kz",
    password: BCrypt::Password.create("123456"),
    user_name: 'Лера',
    skin: "Сухая кожа"
  }, {
    email: "taest@test.ru",
    password: BCrypt::Password.create("1234896"),
    user_name: "Имя",
    skin: "Чувствительня кожа"
    }
  ]

users.each do |user|
    u = User.create!(email: user[:email], password: user[:password], encrypted_password: user[:password])
    pr = Profile.last
    pr.name = user[:user_name]
    pr.save
    skin = user[:skin]
    skin = SkinType.find_by name: skin

    if skin != nil
      per = PersonalFactor.create(user_id: u.id, skin_type_id: skin.id)
      puts per
      # puts " пользовательс e-mail #{u.email} и тип кожи #{skin.name} связаны"
    end
  end

brands = [
  {
    name: "Lush",
    logo: brand_logo('lush.jpg'),
    product: [{
      name: "Палитра эмоций",
      about: "Естественная, полупрозрачная, ультра легкая, отражающая свет пудра для лица, которая подходит для всех типов кожи. Её можно использовать как завершающую часть макияжа или же использовать только её для натурального образа.",
      promist_effests: ['Фиксация', 'Не сушит кожу', 'Питание', 'Не раздражает кожу'],
      image: product_image('lush/palitra.jpg'),
      structure: [
        {
          name: "тальк",
          description: "1296",
          effects: ["Матирует кожу", "Смягчение", "Успокаивает кожу", "Формула поддержки", "Закупоривает поры"]
        }, {
          name: "синтетический фторфлогопит",
          description: "Синтетический фторфлогопит, более известный как синтетическая слюда, это один из компонентов блёсток и блеска без пластика, а также красителей.",
          effects: ["Формула поддержки", "Создание пленки на коже", "Рассеиваетт свет"]
        }, {
          name: "крахмал тапиоки",
          description: "15478",
          effects: ["Смягчение", "Увлажнение", "Очищение", "Антиоксидант", "Регенирация кожи"]
        }, {
          name: "органическое масло жожоба",
          description: "уникальный жидкий воск, получаемый из плодов кустарника жожоба ",
          effects: ["Увлажнение", "Смягчение", "Анти-age"]
        }, {
          name: "краситель 77491",
          description: "Краситель красного цвета",
          effects: ["Формула поддержки"]
        }, {
          name: "краситель 77499",
          description: "Краситель черного цвета",
          effects: ["Формула поддержки"]
        }
      ]
    }, {
      name: "Slap Stick 2N Твёрдая тональная основа",
      about: "Поприветствуйте кожу столь свежую, словно вы только что посетили СПА, и ингредиенты столь роскошные, что увлажняют, смягчают и омолаживают с каждым нанесением. С 40 оттенками в гамме (также в тёплом и нейтральном подтонах), чтобы удовлетворить потребности любого цвета лица, ваша кожа ещё никогда не чувствовала себя так хорошо.",
      promist_effests: ['Пилинг', "Фиксация", "Питание"],
      image: product_image('lush/tonal.jpg'),
      structure: [
        {
          name: "EMULIUM 22",
          description: "125478",
          effects: ["Пилинг", "Увлажнение"]
        }, {
          name: "ПЭГ-7 ГЛИЦЕРИЛ КОКОАТ",
          description: "1256548",
          effects: ["Увлажнение", "Питание"]
        }, {
          name: "СОРБИТАН ПЕРОЛЕАТ",
          description: "15478",
          effects: ["Питание", "Увлажнение"]
        }, {
          name: "ЛЕЦИТИН",
          description: "123",
          effects: ["Увлажнение", "Питание"]
        }
      ]

    }]
  }
]

litle_arr = Array.new

def new_objects(old, fresh)

  all_objects = old.all
  old_objects = Array.new

  all_objects.each do |k, v|
    old_objects.push(k.name.downcase)
  end
  new_objects = (old_objects | fresh) - old_objects

  new_objects.each do |object|
    n = old.create!(name: object)
  end
end

brands.each do |brand|
  b = Brand.create!(name: brand[:name], logo: brand[:logo])

  brand[:product].each do |product|
     pr = Product.create!(brand_id: b.id, name: product[:name], description: product[:about], image: product[:image])

     components = Array.new

     product[:structure].each do |component|
       components.push(component[:name].downcase)
     end

     new_objects(Component, components)

     product[:structure].each do |component|

       component[:effects].each do |effect|
         litle_arr.push(effect.downcase)
       end

     end

     new_objects(ActiveEffect, litle_arr)

     product[:structure].each do |component|
       comp = Component.find_by name: component[:name].downcase

       Structure.create!(component_id: comp.id, product_id: pr.id)

       component[:effects].each do |effect|
         ef = ActiveEffect.find_by name: effect.downcase
         Property.create!(active_effect_id: ef.id, component_id: comp.id)
       end
     end

     product[:promist_effests].each do |promist|
       ef = ActiveEffect.find_by name: promist.downcase

       if ef == nil
         puts "элемента #{promist} не существует".colorize(:red)
       else
        ob = ProductPromise.create!(active_effect_id: ef.id, product_id: pr.id)
       end
    end
  end
end
