# Seed Products
puts 'Seeding Products ...'

[
    {
        title: 'LSD - 1g',
        short_description: 'Hybrid',
        description: 'The LSD strain was bred by Barneys Farm, with a lineage from Mazar-I-Sharif and Skunk #1. It is a disease-resistant plant that does well in most growing conditions. The buds form in curved triangles, yielding approximately 600 grams per square meter. Flowering time is approximately 8-9 weeks. This marijuana strain is popular for delivering a vivid and psychedelic experience with a powerful body buzz and cerebral high. The THC content has been measured up to 24% with a CBD of 1.3%.',
        unit_price: 10,
        icon: 'flowers',
        metadata: '{
            "effects": [
                {"label": "Relaxed", "percentage": 100},
                {"label": "Uplifted", "percentage": 98},
                {"label": "Happy", "percentage": 91},
                {"label": "Euphoric", "percentage": 85},
                {"label": "Creative", "percentage": 80}
            ],
            "dosage": "Enough for about 2 joints or 3 – 4 bowls."
        }',
        active: true
    },

    {
        title: 'Bubba Kush - 1g',
        short_description: 'Indica',
        description: 'Bubba Kush is an indica strain that has gained notoriety in the U.S. and beyond for its heavy tranquilizing effects. Sweet hashish flavors with subtle notes of chocolate and coffee come through on the exhale, delighting the palate as powerful relaxation takes over. From head to toe, muscles ease with heaviness as dreamy euphoria blankets the mind, crushing stress while coercing happy moods. Bubba Kush exhibits a distinctive, bulky bud structure with hues that range from forest green to pale purple.',
        unit_price: 10,
        icon: 'flowers',
        metadata: '{
            "effects": [
                {"label": "Relaxed", "percentage": 100},
                {"label": "Sleepy", "percentage": 71},
                {"label": "Happy", "percentage": 66},
                {"label": "Euphoric", "percentage": 55},
                {"label": "Hungry", "percentage": 46}
            ],
            "dosage": "Enough for about 2 joints or 3 – 4 bowls."
        }',
        active: true
    },

    {
        title: 'Uncle B.O.B - 5g',
        short_description: 'Hybrid',
        description: 'The famous Uncle B.O.B',
        unit_price: 25,
        icon: 'flowers',
        metadata: '{
            "effects": [
                {"label": "Stoned", "percentage": 100},
                {"label": "Hit on your wallet", "percentage": 21}
            ],
            "dosage": "Enough for about 10 joints or 15 – 20 bowls."
        }',
        active: true
    }

].each do |product|
    unless Product.where(title: product[:title]).exists?
        Product.new(product).save
    end
end
