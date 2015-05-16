require 'mongo'

class Formater
  def initialize
    @@data = {
        :nom =>"",
        :prenom => "",
        :genre => "",
        :anneeNaissance => "",
        :tel => "",
        :mail => "",
        :photos => Array.new,
        :adresse => Hash.new(:rue=>"", :codePostal=>"", :ville=>""),
        :profils => Array.new
    }

    @@client = Mongo::Client.new(['ds053778.mongolab.com:53778'], :database =>'stalking', :user =>'nicolas', :password =>'epsi')
  end

  def getAll
    return @@data
  end

  def setName(name)
    @@data[:nom] = name
  end

  def setFirstName(fname)
    @@data[:prenom] = fname
  end

  def setGender(gender)
    @@data[:genre] = gender
  end

  def setBirthDay(birthDay)
    @@data[:anneeNaissance] = birthDay
  end

  def setTel(tel)
    @@data[:tel] = tel
  end

  def setMail(email)
    @@data[:mail] = email
  end

  def setPictures(pic)
    @@data[:photos].push(pic)
  end

  def setAddress(street, zipCode , city)
    @@data[:adresse][:rue] = street
    @@data[:adresse][:codePostal] = zipCode
    @@data[:adresse][:ville] = city
  end

  def saveData
    result = @@client[:personnes].insert_one(@@data)
    if result == 1 then
      puts "Data saved."
    else
      puts "Problem encountered."
    end
  end

  def clearAll
    @@data = {
        :nom =>"",
        :prenom => "",
        :genre => "",
        :anneeNaissance => "",
        :tel => "",
        :mail => "",
        :photos => Array.new,
        :adresse => Hash.new(:rue=>"", :codePostal=>"", :ville=>""),
        :profils => Array.new
    }
  end

end