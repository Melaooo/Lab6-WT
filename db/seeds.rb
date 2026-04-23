# OWNERS

owner1 = Owner.create!(
  first_name: "Tomás",
  last_name: "Melin",
  email: "tomas@miuandes.cl",
  phone: "123456789",
  address: "Santiago, Chile"
)

owner2 = Owner.create!(
  first_name: "María",
  last_name: "González",
  email: "maria@miuandes.cl",
  phone: "987654321",
  address: "Valparaíso, Chile"
)

owner3 = Owner.create!(
  first_name: "Juan",
  last_name: "Pérez",
  email: "juan@miuandes.cl",
  phone: "555555555",
  address: "Concepción, Chile"
)


# VETS

vet1 = Vet.create!(
  first_name: "Juan",
  last_name: "López",
  email: "lopez@vet.com",
  phone: "111111111",
  specialization: "General Practice"
)

vet2 = Vet.create!(
  first_name: "Ana",
  last_name: "Martínez",
  email: "martinez@vet.com",
  phone: "222222222",
  specialization: "Surgery"
)


# PETS

pet1 = owner1.pets.create!(
  name: "Firulais",
  species: "Dog",
  breed: "Labrador",
  date_of_birth: Date.new(2018, 5, 20),
  weight: 30.5
)

pet2 = owner1.pets.create!(
  name: "Michi",
  species: "Cat",
  breed: "Siamese",
  date_of_birth: Date.new(2020, 8, 15),
  weight: 4.2
)

pet3 = owner2.pets.create!(
  name: "Bad Bunny",
  species: "Rabbit",
  breed: "Mini Lop",
  date_of_birth: Date.new(2019, 3, 10),
  weight: 2.5
)

pet4 = owner3.pets.create!(
  name: "Rocky",
  species: "Dog",
  breed: "Bulldog",
  date_of_birth: Date.new(2017, 11, 5),
  weight: 25.0
)

pet5 = owner3.pets.create!(
  name: "Luna",
  species: "Cat",
  breed: "Persian",
  date_of_birth: Date.new(2021, 1, 30),
  weight: 3.8
)

# APPOINTMENTS
# Scheduled: 0
# Completed: 1
# Cancelled: 2
# In_Progress: 3

appt1 = Appointment.create!(
  date: Time.now + 1.day,
  reason: "Annual check-up",
  status: 0,
  pet: pet1,
  vet: vet1
)

appt2 = Appointment.create!(
  date: Time.now,
  reason: "Vaccination",
  status: 1,
  pet: pet2,
  vet: vet1
)

appt3 = Appointment.create!(
  date: Time.now - 1.day,
  reason: "Surgery follow-up",
  status: 2,
  pet: pet3,
  vet: vet2
)

appt4 = Appointment.create!(
  date: Time.now - 2.days,
  reason: "Skin treatment",
  status: 3,
  pet: pet4,
  vet: vet2
)

appt5 = Appointment.create!(
  date: Time.now,
  reason: "General check-up",
  status: 2,
  pet: pet5,
  vet: vet1
)


# TREATMENTS

Treatment.create!(
  name: "Vaccination",
  medication: "Rabies Vaccine",
  notes: "Pet handled well",
  dosages: "2ml",
  administered_at: Time.now,
  appointment: appt2
)

Treatment.create!(
  name: "Deworming",
  medication: "Antiparasitic",
  notes: "No issues",
  dosages: "1 tablet",
  administered_at: Time.now,
  appointment: appt2
)

Treatment.create!(
  name: "Surgery follow-up",
  medication: "Painkillers",
  notes: "Healing correctly",
  dosages: "5mg daily",
  administered_at: Time.now,
  appointment: appt3
)

Treatment.create!(
  name: "Skin treatment",
  medication: "Dermatological cream",
  notes: "Apply twice a day",
  dosages: "Topical",
  administered_at: Time.now,
  appointment: appt5
)

Treatment.create!(
  name: "General check-up",
  medication: "Vitamins",
  notes: "Routine control",
  dosages: "10ml",
  administered_at: Time.now,
  appointment: appt5
)
