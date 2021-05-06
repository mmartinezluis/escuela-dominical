# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


STUDIES = [
  {
    :title => "El Inicio de la Gran Tribulación",
    :semester => 2,
    :year => 2021,
    :number => 18,
    :biblical_base => "Apocalipsis 6:1-7:17",
    :subtitles => {
      "Los juicios de los primeros cuatro sellos (Ap. 6:1-8)" => [
        {"El juicio del caballo blanco, diplomacia y autoritarismo (6:1,2)" => "Dios jusga la desobedicencia (Génesis 3:8-23)"},
        {"El juicio del caballo bermejo, guerras y conflictos (6:3,4)" => "Dios jusga la irreverencia (Números 2:1-15)"},
        {"El juicio del caballo negro,, hambre y escasez (6:5,6)" => "Dios jusga la rebelión (1 Samuel 15:24-35)"},
        {"El juicio del caballo amarillo, muerte y condenación (6:7,8)" => "Los juicios de los sellos (Ap. 6:1-8:1)"}
      ],

      "Los escogidos de dios son sellados (Ap. 7:1-8)" => [
        {"Protección divina en medio de la tribulación (7:1-3)" => "Los juicios de las trompetas (Ap. 8:2-9:21)"},
        {"Identidad de los que son sellados (7:4-8)" => "Juicio de las naciones (Ap. 6:1-21)"}
      ],

      "Una gran multitud de redimidos (Ap. 6:9-11, 7:9-17)" => [
        {"Los primeros mártires de la tribulación (6:9-11)" => "Entender mejor el amor y la justicia de Dios"},
        {"Se completa el número de los mártires (7:9-17)" => "Considerar los sufirmientos causados por la tribulación"}
      ]
    }
  },

  {
    :title => "Ángeles con Siete Trompetas",
    :semester => 2,
    :year => 2021,
    :number => 19,
    :biblical_base => "Apocalipsis 8:1-9:21",
    :subtitles => {
      "Catástrofes de las cuatro primera trompetas (Ap. 8:1-13)" => [
        {"Silencio en el cielo por lo que está por sucedder (8:1-5)" => "Sberanía univesal de Dios (Salmos 68:28-35)"},
        {"Juicios por las primeras trompetas (8:6-13)" => "Soberanía divina sobre Israel (Éxodo 19:10-20:20)"}
      ],

      "Terremoto por la quinta trompoeta (Ap. 9:1-12)" => [
        {"Plaga de langostas que pican como escorpiones (9:1-5)" => "Soberanía sobre los homber (2 Reyes 19:20-24)"},
        {"Una plaga espantosa bajo el mando de Satanás (9:7-12)" => "Soberanía sobre el destino humano (Salmos 31:14-18)"}
      ],

      "Poder destructivo desatado por la sexta trompeta (Ap. 9:13-12)" => [
        {"Un ejécito invasor de doscientso millones (9:13-19)" => "Soberanía de Cristo (Jeremías 23:5-8"},
        {"Dureza espiritual de los impíos en la tribulaión (9:20-21)" => "Soberanía eterna de Dios (1 Timoteo 1:17"}
      ]
    }
  },

  {
    :title => "El Anuncio del Fin y los Dos Testigos",
    :semester => 2,
    :year => 2021,
    :number => 20,
    :biblical_base => "Apocalipsis 10:1-11:14",
    :subtitles => {
      "El ángel fuerte y el amargo libro dulce de la profecía (Ap. 10:1-11)" => [
        {"El ángel fuerte anuncia que no habrá más tiempo (10:1-7)" => "Testgos falsos (Éxodo 20:16)"},
        {"EL libro y el ministerio profético de Juan (10:8-11)" => "Un testimonio constante (Isaías 62:6-7)"}
      ],

      "Los dos testigos de la Gran Tribulación (Ap. 11:1-14)" => [
        {"Su identidad y ministerio (11:1-6)" => "Testigos de la verdad (Isaías 43:10)"},
        {"La fidelidad de su ministerio (11:7-14)" => "El tstigo fiel y verdadero (Ap. 1:5)"}
      ],

      "La apertura de la séptima tromptea y la alabanza al Señor (Ap. 11:15-19)" => [
      ]
    }
  }

]


def create_studies(array)
  array.each do |study|
    new_study = Study.new
    new_study.title = study[:title]
    new_study.semester = study[:semester]
    new_study.year = study[:year]
    new_study.number = study[:number]
    new_study.outline = study
    new_study.save
  end
end

create_studies(STUDIES)

