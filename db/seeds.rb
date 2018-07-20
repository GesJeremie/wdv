# Seed Options
puts 'Seeding App options ...'

if Option.count == 0
    Option.new(
        open: false,
        phone: '+1 647-931-6480',
        admin_name: 'admin',
        admin_password: 'admin'
    ).save
end

# Seed Products
puts 'Seeding Products ...'

[
    {
        title: 'Purple Kush - 1g',
        short_description: 'Indica',
        description: 'Purple Kush is a pure indica strain that emerged from the Oakland area of California as the result of a Hindu Kush and Purple Afghani cross. Its aroma is subtle and earthy with sweet overtones typical of Kush varieties. Blissful, long-lasting euphoria blankets the mind while physical relaxation rids the body of pain, sleeplessness, and stress.',
        unit_price: 12,
        icon: 'flowers.svg',
        metadata: '{
            "effects": [
                {"label": "Relaxed", "percentage": 100},
                {"label": "Happy", "percentage": 73},
                {"label": "Euphoric", "percentage": 68},
                {"label": "Sleepy", "percentage": 60},
                {"label": "Hungry", "percentage": 44}
            ],
            "dosage": "Enough for about 2 joints or 3 – 4 bowls."
        }',
        in_stock: true,
        active: true
    },

    {
        title: 'ALF - 1g',
        short_description: 'Hybrid',
        description: 'The indica-dominant hybrid Alf was created by crossing Animal Pie (an Animal Cookies and Cherry Pie hybrid) and Black Raven (White Fire Alien OG x ’09 Cookies) from The Captain’s Connection. With dessert-like notes of cookies and sour cherry, Alf’s aroma is as enticing as its purple crystal-coated buds.',
        unit_price: 12,
        icon: 'flowers.svg',
        metadata: '{
            "effects": [
                {"label": "Relaxed", "percentage": 100},
                {"label": "Creative", "percentage": 50},
                {"label": "Euphoric", "percentage": 50},
                {"label": "Giggly", "percentage": 50},
                {"label": "Happy", "percentage": 50}
            ],
            "dosage": "Enough for about 2 joints or 3 – 4 bowls."
        }',
        in_stock: false,
        active: true
    },

    {
        title: 'Uncle B.O.B - 5g',
        short_description: 'Hybrid',
        description: "Want to get high but you're running low on cash? Don't worry we've got you covered, say hello to your new favorite Uncle: B.O.B B.O.B is the acronym for Bottom Of Bag: Long story short, this is a 5grams blend of the little crispy crumbs left at the bottom of our weed bags. This is not your usual shitty shake, it's Uncle B.O.B!",
        unit_price: 30,
        icon: 'flowers.svg',
        metadata: '{
            "effects": [
                {"label": "Stoned", "percentage": 100},
                {"label": "Hit on your wallet", "percentage": 23}
            ],
            "dosage": "Enough for about 10 joints or 15 – 20 bowls."
        }',
        in_stock: true,
        active: true
    }

].each do |product|
    unless Product.where(title: product[:title]).exists?
        Product.new(product).save
    end
end
