# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ESTUDIES = {
    :title => "El Inicio de la Gran Tribulación",
    :semester => 2,
    :year => 2021,
    :number => 18,
    :biblical_base => "Apocalipsis 6:1-7:17",
    :subtitles => {
        "Los juicios de los primeros cuatro sellos (Ap. 6:1-8)" => [
            "El juicio del caballo blanco, diplomacia y autoritarismo (6:1,2)",
            "el juicio del caballo bermejo, guerras y conflictos (6:3,4)",
            "El juicio del caballo negro,, hambre y escasez (6:5,6)",
            "El juicio del caballo amarillo, muerte y condenación (6:7,8)"
]       ],

        "Los escogidos de dios son sellados (Ap. 7:1-8)" => [
            "Protección divina en medio de la tribulación (7:1-3)",
            "Identidad de los que son sellados (7:4-8)"
        ],

        "Una gran multitud de redimidos (Ap. 6:9-11, 7:9-17)" => [
            "Los primeros mártires de la tribulación (6:9-11)",
            "Se completa el número de los mártires (7:9-17)"
        ]
    }
}

new_study = Study.new
new_study.title = OUTLINE[:title]
new_study.semester = OUTLINE[:semester]
new_study.year = OUTLINE[:year]
new_study.number = OUTLINE[:number]
new_study.outline = OUTLINE
new_study.save